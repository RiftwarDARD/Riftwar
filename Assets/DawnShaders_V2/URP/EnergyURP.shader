// Made with Amplify Shader Editor v1.9.1.5
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DawnShaderURP_V2/EnergyURP"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[ASEBegin]_EmmisiveBoost("Emmisive Boost", Float) = 50
		_EmissiveColor("Emissive Color", Color) = (0.4858491,0.8229298,1,0)
		_Speed("Speed", Float) = 0.5
		_TimeScale("Time Scale", Float) = 0.1
		_Pattern("Pattern", 2D) = "white" {}
		_Divisor("Divisor", Float) = 1
		_Number("Number", Float) = 1
		_Pow("Pow", Float) = 5
		_Multi("Multi", Float) = 1
		_Tilling("Tilling", Float) = 1
		_VTilling("V Tilling", Float) = 1
		_UTilling("U Tilling", Float) = 1
		_Meshsize("Mesh size", Float) = 0.03
		_Direction("Direction", Vector) = (0.01,0.01,0.01,0)
		[ASEEnd][Toggle(_FLIPSIDE_ON)] _Flipside("Flip side", Float) = 0


		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25

		[HideInInspector] _QueueOffset("_QueueOffset", Float) = 0
        [HideInInspector] _QueueControl("_QueueControl", Float) = -1

        [HideInInspector][NoScaleOffset] unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Transparent" "Queue"="Transparent" "UniversalMaterialType"="Unlit" }

		Cull Back
		AlphaToMask Off

		

		HLSLINCLUDE
		#pragma target 3.5
		#pragma prefer_hlslcc gles
		// ensure rendering platforms toggle list is visible

		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
		#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Filtering.hlsl"

		#ifndef ASE_TESS_FUNCS
		#define ASE_TESS_FUNCS
		float4 FixedTess( float tessValue )
		{
			return tessValue;
		}

		float CalcDistanceTessFactor (float4 vertex, float minDist, float maxDist, float tess, float4x4 o2w, float3 cameraPos )
		{
			float3 wpos = mul(o2w,vertex).xyz;
			float dist = distance (wpos, cameraPos);
			float f = clamp(1.0 - (dist - minDist) / (maxDist - minDist), 0.01, 1.0) * tess;
			return f;
		}

		float4 CalcTriEdgeTessFactors (float3 triVertexFactors)
		{
			float4 tess;
			tess.x = 0.5 * (triVertexFactors.y + triVertexFactors.z);
			tess.y = 0.5 * (triVertexFactors.x + triVertexFactors.z);
			tess.z = 0.5 * (triVertexFactors.x + triVertexFactors.y);
			tess.w = (triVertexFactors.x + triVertexFactors.y + triVertexFactors.z) / 3.0f;
			return tess;
		}

		float CalcEdgeTessFactor (float3 wpos0, float3 wpos1, float edgeLen, float3 cameraPos, float4 scParams )
		{
			float dist = distance (0.5 * (wpos0+wpos1), cameraPos);
			float len = distance(wpos0, wpos1);
			float f = max(len * scParams.y / (edgeLen * dist), 1.0);
			return f;
		}

		float DistanceFromPlane (float3 pos, float4 plane)
		{
			float d = dot (float4(pos,1.0f), plane);
			return d;
		}

		bool WorldViewFrustumCull (float3 wpos0, float3 wpos1, float3 wpos2, float cullEps, float4 planes[6] )
		{
			float4 planeTest;
			planeTest.x = (( DistanceFromPlane(wpos0, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[0]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[0]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.y = (( DistanceFromPlane(wpos0, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[1]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[1]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.z = (( DistanceFromPlane(wpos0, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[2]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[2]) > -cullEps) ? 1.0f : 0.0f );
			planeTest.w = (( DistanceFromPlane(wpos0, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos1, planes[3]) > -cullEps) ? 1.0f : 0.0f ) +
						  (( DistanceFromPlane(wpos2, planes[3]) > -cullEps) ? 1.0f : 0.0f );
			return !all (planeTest);
		}

		float4 DistanceBasedTess( float4 v0, float4 v1, float4 v2, float tess, float minDist, float maxDist, float4x4 o2w, float3 cameraPos )
		{
			float3 f;
			f.x = CalcDistanceTessFactor (v0,minDist,maxDist,tess,o2w,cameraPos);
			f.y = CalcDistanceTessFactor (v1,minDist,maxDist,tess,o2w,cameraPos);
			f.z = CalcDistanceTessFactor (v2,minDist,maxDist,tess,o2w,cameraPos);

			return CalcTriEdgeTessFactors (f);
		}

		float4 EdgeLengthBasedTess( float4 v0, float4 v1, float4 v2, float edgeLength, float4x4 o2w, float3 cameraPos, float4 scParams )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;
			tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
			tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
			tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
			tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			return tess;
		}

		float4 EdgeLengthBasedTessCull( float4 v0, float4 v1, float4 v2, float edgeLength, float maxDisplacement, float4x4 o2w, float3 cameraPos, float4 scParams, float4 planes[6] )
		{
			float3 pos0 = mul(o2w,v0).xyz;
			float3 pos1 = mul(o2w,v1).xyz;
			float3 pos2 = mul(o2w,v2).xyz;
			float4 tess;

			if (WorldViewFrustumCull(pos0, pos1, pos2, maxDisplacement, planes))
			{
				tess = 0.0f;
			}
			else
			{
				tess.x = CalcEdgeTessFactor (pos1, pos2, edgeLength, cameraPos, scParams);
				tess.y = CalcEdgeTessFactor (pos2, pos0, edgeLength, cameraPos, scParams);
				tess.z = CalcEdgeTessFactor (pos0, pos1, edgeLength, cameraPos, scParams);
				tess.w = (tess.x + tess.y + tess.z) / 3.0f;
			}
			return tess;
		}
		#endif //ASE_TESS_FUNCS
		ENDHLSL

		
		Pass
		{
			
			Name "Forward"
			Tags { "LightMode"="UniversalForwardOnly" }

			Blend One OneMinusSrcAlpha, One OneMinusSrcAlpha
			ZWrite Off
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			

			HLSLPROGRAM

			#pragma multi_compile_instancing
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _RECEIVE_SHADOWS_OFF 1
			#define _ALPHAPREMULTIPLY_ON 1
			#define ASE_SRP_VERSION 140007


			#pragma instancing_options renderinglayer

			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma shader_feature _ _SAMPLE_GI
			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
        	#pragma multi_compile_fragment _ DEBUG_DISPLAY
        	#pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
        	#pragma multi_compile_fragment _ _WRITE_RENDERING_LAYERS

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_UNLIT

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Debug/Debugging3D.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/SurfaceData.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local _FLIPSIDE_ON


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD1;
				#endif
				#ifdef ASE_FOG
					float fogFactor : TEXCOORD2;
				#endif
				float4 ase_texcoord3 : TEXCOORD3;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _EmissiveColor;
			float3 _Direction;
			float _Speed;
			float _TimeScale;
			float _Tilling;
			float _UTilling;
			float _VTilling;
			float _Divisor;
			float _Number;
			float _Pow;
			float _Multi;
			float _Meshsize;
			float _EmmisiveBoost;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _Pattern;


			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
			}
			

			VertexOutput VertexFunction ( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float2 texCoord9 = v.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float mulTime16 = _TimeParameters.x * _TimeScale;
				float temp_output_14_0 = ( _Speed * mulTime16 );
				float4 _SpeedConstant = float4(1,-2,2,-1);
				float2 temp_cast_0 = (_SpeedConstant.x).xx;
				float2 texCoord35 = v.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float4 appendResult40 = (float4(_UTilling , _VTilling , 0.0 , 0.0));
				float4 temp_output_41_0 = ( float4( ( texCoord35 * _Tilling ), 0.0 , 0.0 ) * appendResult40 );
				float2 panner10 = ( temp_output_14_0 * temp_cast_0 + temp_output_41_0.xy);
				float2 panner11 = ( temp_output_14_0 * _SpeedConstant.xy + ( temp_output_41_0 + 0.418 ).xy);
				float4 _SpeedConstant1 = float4(1,0,2,-1);
				float2 temp_cast_6 = (_SpeedConstant1.w).xx;
				float2 panner12 = ( temp_output_14_0 * temp_cast_6 + ( temp_output_41_0 + 8.9 ).xy);
				float2 panner13 = ( temp_output_14_0 * _SpeedConstant1.xy + ( temp_output_41_0 + 0.65 ).xy);
				float simplePerlin2D53 = snoise( ( texCoord9 + (( ( ( tex2Dlod( _Pattern, float4( panner10, 0, 0.0) ) + tex2Dlod( _Pattern, float4( panner11, 0, 0.0) ) ) + ( tex2Dlod( _Pattern, float4( panner12, 0, 0.0) ) + tex2Dlod( _Pattern, float4( panner13, 0, 0.0) ) ) ) * _Divisor )).r ) );
				simplePerlin2D53 = simplePerlin2D53*0.5 + 0.5;
				float clampResult62 = clamp( ( pow( sin( frac( ( simplePerlin2D53 * _Number ) ) ) , _Pow ) * _Multi ) , 0.0 , 1.0 );
				float3 temp_cast_12 = (_Meshsize).xxx;
				float3 VertexOffset81 = ( clampResult62 * max( ( v.ase_normal * _Direction ) , temp_cast_12 ) );
				
				o.ase_texcoord3.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord3.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = VertexOffset81;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.worldPos = positionWS;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				#ifdef ASE_FOG
					o.fogFactor = ComputeFogFactor( positionCS.z );
				#endif

				o.clipPos = positionCS;

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag ( VertexOutput IN
				#ifdef _WRITE_RENDERING_LAYERS
				, out float4 outRenderingLayers : SV_Target1
				#endif
				, bool ase_vface : SV_IsFrontFace ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.worldPos;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 texCoord9 = IN.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float mulTime16 = _TimeParameters.x * _TimeScale;
				float temp_output_14_0 = ( _Speed * mulTime16 );
				float4 _SpeedConstant = float4(1,-2,2,-1);
				float2 temp_cast_0 = (_SpeedConstant.x).xx;
				float2 texCoord35 = IN.ase_texcoord3.xy * float2( 1,1 ) + float2( 0,0 );
				float4 appendResult40 = (float4(_UTilling , _VTilling , 0.0 , 0.0));
				float4 temp_output_41_0 = ( float4( ( texCoord35 * _Tilling ), 0.0 , 0.0 ) * appendResult40 );
				float2 panner10 = ( temp_output_14_0 * temp_cast_0 + temp_output_41_0.xy);
				float2 panner11 = ( temp_output_14_0 * _SpeedConstant.xy + ( temp_output_41_0 + 0.418 ).xy);
				float4 _SpeedConstant1 = float4(1,0,2,-1);
				float2 temp_cast_6 = (_SpeedConstant1.w).xx;
				float2 panner12 = ( temp_output_14_0 * temp_cast_6 + ( temp_output_41_0 + 8.9 ).xy);
				float2 panner13 = ( temp_output_14_0 * _SpeedConstant1.xy + ( temp_output_41_0 + 0.65 ).xy);
				float simplePerlin2D53 = snoise( ( texCoord9 + (( ( ( tex2D( _Pattern, panner10 ) + tex2D( _Pattern, panner11 ) ) + ( tex2D( _Pattern, panner12 ) + tex2D( _Pattern, panner13 ) ) ) * _Divisor )).r ) );
				simplePerlin2D53 = simplePerlin2D53*0.5 + 0.5;
				float clampResult62 = clamp( ( pow( sin( frac( ( simplePerlin2D53 * _Number ) ) ) , _Pow ) * _Multi ) , 0.0 , 1.0 );
				float4 Emiisive82 = ( ( _EmissiveColor * clampResult62 ) * _EmmisiveBoost );
				
				#ifdef _FLIPSIDE_ON
				float staticSwitch80 = ( ( 1.0 - ase_vface ) * clampResult62 );
				#else
				float staticSwitch80 = clampResult62;
				#endif
				float Opacity63 = staticSwitch80;
				
				float3 BakedAlbedo = 0;
				float3 BakedEmission = 0;
				float3 Color = Emiisive82.rgb;
				float Alpha = Opacity63;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;

				#ifdef _ALPHATEST_ON
					clip( Alpha - AlphaClipThreshold );
				#endif

				#if defined(_DBUFFER)
					ApplyDecalToBaseColor(IN.clipPos, Color);
				#endif

				#if defined(_ALPHAPREMULTIPLY_ON)
				Color *= Alpha;
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.clipPos );
				#endif

				#ifdef ASE_FOG
					Color = MixFog( Color, IN.fogFactor );
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4( EncodeMeshRenderingLayer( renderingLayers ), 0, 0, 0 );
				#endif

				return half4( Color, Alpha );
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "ShadowCaster"
			Tags { "LightMode"="ShadowCaster" }

			ZWrite On
			ZTest LEqual
			AlphaToMask Off
			ColorMask 0

			HLSLPROGRAM

			#pragma multi_compile_instancing
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _RECEIVE_SHADOWS_OFF 1
			#define _ALPHAPREMULTIPLY_ON 1
			#define ASE_SRP_VERSION 140007


			#pragma vertex vert
			#pragma fragment frag

			#pragma multi_compile _ _CASTING_PUNCTUAL_LIGHT_SHADOW

			#define SHADERPASS SHADERPASS_SHADOWCASTER

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local _FLIPSIDE_ON


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _EmissiveColor;
			float3 _Direction;
			float _Speed;
			float _TimeScale;
			float _Tilling;
			float _UTilling;
			float _VTilling;
			float _Divisor;
			float _Number;
			float _Pow;
			float _Multi;
			float _Meshsize;
			float _EmmisiveBoost;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _Pattern;


			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
			}
			

			float3 _LightDirection;
			float3 _LightPosition;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				float2 texCoord9 = v.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float mulTime16 = _TimeParameters.x * _TimeScale;
				float temp_output_14_0 = ( _Speed * mulTime16 );
				float4 _SpeedConstant = float4(1,-2,2,-1);
				float2 temp_cast_0 = (_SpeedConstant.x).xx;
				float2 texCoord35 = v.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float4 appendResult40 = (float4(_UTilling , _VTilling , 0.0 , 0.0));
				float4 temp_output_41_0 = ( float4( ( texCoord35 * _Tilling ), 0.0 , 0.0 ) * appendResult40 );
				float2 panner10 = ( temp_output_14_0 * temp_cast_0 + temp_output_41_0.xy);
				float2 panner11 = ( temp_output_14_0 * _SpeedConstant.xy + ( temp_output_41_0 + 0.418 ).xy);
				float4 _SpeedConstant1 = float4(1,0,2,-1);
				float2 temp_cast_6 = (_SpeedConstant1.w).xx;
				float2 panner12 = ( temp_output_14_0 * temp_cast_6 + ( temp_output_41_0 + 8.9 ).xy);
				float2 panner13 = ( temp_output_14_0 * _SpeedConstant1.xy + ( temp_output_41_0 + 0.65 ).xy);
				float simplePerlin2D53 = snoise( ( texCoord9 + (( ( ( tex2Dlod( _Pattern, float4( panner10, 0, 0.0) ) + tex2Dlod( _Pattern, float4( panner11, 0, 0.0) ) ) + ( tex2Dlod( _Pattern, float4( panner12, 0, 0.0) ) + tex2Dlod( _Pattern, float4( panner13, 0, 0.0) ) ) ) * _Divisor )).r ) );
				simplePerlin2D53 = simplePerlin2D53*0.5 + 0.5;
				float clampResult62 = clamp( ( pow( sin( frac( ( simplePerlin2D53 * _Number ) ) ) , _Pow ) * _Multi ) , 0.0 , 1.0 );
				float3 temp_cast_12 = (_Meshsize).xxx;
				float3 VertexOffset81 = ( clampResult62 * max( ( v.ase_normal * _Direction ) , temp_cast_12 ) );
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = VertexOffset81;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.worldPos = positionWS;
				#endif

				float3 normalWS = TransformObjectToWorldDir( v.ase_normal );

				#if _CASTING_PUNCTUAL_LIGHT_SHADOW
					float3 lightDirectionWS = normalize(_LightPosition - positionWS);
				#else
					float3 lightDirectionWS = _LightDirection;
				#endif

				float4 clipPos = TransformWorldToHClip(ApplyShadowBias(positionWS, normalWS, lightDirectionWS));

				#if UNITY_REVERSED_Z
					clipPos.z = min(clipPos.z, UNITY_NEAR_CLIP_VALUE);
				#else
					clipPos.z = max(clipPos.z, UNITY_NEAR_CLIP_VALUE);
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = clipPos;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = clipPos;

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN , bool ase_vface : SV_IsFrontFace ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.worldPos;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 texCoord9 = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float mulTime16 = _TimeParameters.x * _TimeScale;
				float temp_output_14_0 = ( _Speed * mulTime16 );
				float4 _SpeedConstant = float4(1,-2,2,-1);
				float2 temp_cast_0 = (_SpeedConstant.x).xx;
				float2 texCoord35 = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float4 appendResult40 = (float4(_UTilling , _VTilling , 0.0 , 0.0));
				float4 temp_output_41_0 = ( float4( ( texCoord35 * _Tilling ), 0.0 , 0.0 ) * appendResult40 );
				float2 panner10 = ( temp_output_14_0 * temp_cast_0 + temp_output_41_0.xy);
				float2 panner11 = ( temp_output_14_0 * _SpeedConstant.xy + ( temp_output_41_0 + 0.418 ).xy);
				float4 _SpeedConstant1 = float4(1,0,2,-1);
				float2 temp_cast_6 = (_SpeedConstant1.w).xx;
				float2 panner12 = ( temp_output_14_0 * temp_cast_6 + ( temp_output_41_0 + 8.9 ).xy);
				float2 panner13 = ( temp_output_14_0 * _SpeedConstant1.xy + ( temp_output_41_0 + 0.65 ).xy);
				float simplePerlin2D53 = snoise( ( texCoord9 + (( ( ( tex2D( _Pattern, panner10 ) + tex2D( _Pattern, panner11 ) ) + ( tex2D( _Pattern, panner12 ) + tex2D( _Pattern, panner13 ) ) ) * _Divisor )).r ) );
				simplePerlin2D53 = simplePerlin2D53*0.5 + 0.5;
				float clampResult62 = clamp( ( pow( sin( frac( ( simplePerlin2D53 * _Number ) ) ) , _Pow ) * _Multi ) , 0.0 , 1.0 );
				#ifdef _FLIPSIDE_ON
				float staticSwitch80 = ( ( 1.0 - ase_vface ) * clampResult62 );
				#else
				float staticSwitch80 = clampResult62;
				#endif
				float Opacity63 = staticSwitch80;
				

				float Alpha = Opacity63;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;

				#ifdef _ALPHATEST_ON
					#ifdef _ALPHATEST_SHADOW_ON
						clip(Alpha - AlphaClipThresholdShadow);
					#else
						clip(Alpha - AlphaClipThreshold);
					#endif
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.clipPos );
				#endif
				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthOnly"
			Tags { "LightMode"="DepthOnly" }

			ZWrite On
			ColorMask 0
			AlphaToMask Off

			HLSLPROGRAM

			#pragma multi_compile_instancing
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _RECEIVE_SHADOWS_OFF 1
			#define _ALPHAPREMULTIPLY_ON 1
			#define ASE_SRP_VERSION 140007


			#pragma vertex vert
			#pragma fragment frag

			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local _FLIPSIDE_ON


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
				float3 worldPos : TEXCOORD0;
				#endif
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
				float4 shadowCoord : TEXCOORD1;
				#endif
				float4 ase_texcoord2 : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _EmissiveColor;
			float3 _Direction;
			float _Speed;
			float _TimeScale;
			float _Tilling;
			float _UTilling;
			float _VTilling;
			float _Divisor;
			float _Number;
			float _Pow;
			float _Multi;
			float _Meshsize;
			float _EmmisiveBoost;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _Pattern;


			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
			}
			

			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float2 texCoord9 = v.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float mulTime16 = _TimeParameters.x * _TimeScale;
				float temp_output_14_0 = ( _Speed * mulTime16 );
				float4 _SpeedConstant = float4(1,-2,2,-1);
				float2 temp_cast_0 = (_SpeedConstant.x).xx;
				float2 texCoord35 = v.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float4 appendResult40 = (float4(_UTilling , _VTilling , 0.0 , 0.0));
				float4 temp_output_41_0 = ( float4( ( texCoord35 * _Tilling ), 0.0 , 0.0 ) * appendResult40 );
				float2 panner10 = ( temp_output_14_0 * temp_cast_0 + temp_output_41_0.xy);
				float2 panner11 = ( temp_output_14_0 * _SpeedConstant.xy + ( temp_output_41_0 + 0.418 ).xy);
				float4 _SpeedConstant1 = float4(1,0,2,-1);
				float2 temp_cast_6 = (_SpeedConstant1.w).xx;
				float2 panner12 = ( temp_output_14_0 * temp_cast_6 + ( temp_output_41_0 + 8.9 ).xy);
				float2 panner13 = ( temp_output_14_0 * _SpeedConstant1.xy + ( temp_output_41_0 + 0.65 ).xy);
				float simplePerlin2D53 = snoise( ( texCoord9 + (( ( ( tex2Dlod( _Pattern, float4( panner10, 0, 0.0) ) + tex2Dlod( _Pattern, float4( panner11, 0, 0.0) ) ) + ( tex2Dlod( _Pattern, float4( panner12, 0, 0.0) ) + tex2Dlod( _Pattern, float4( panner13, 0, 0.0) ) ) ) * _Divisor )).r ) );
				simplePerlin2D53 = simplePerlin2D53*0.5 + 0.5;
				float clampResult62 = clamp( ( pow( sin( frac( ( simplePerlin2D53 * _Number ) ) ) , _Pow ) * _Multi ) , 0.0 , 1.0 );
				float3 temp_cast_12 = (_Meshsize).xxx;
				float3 VertexOffset81 = ( clampResult62 * max( ( v.ase_normal * _Direction ) , temp_cast_12 ) );
				
				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = VertexOffset81;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.worldPos = positionWS;
				#endif

				o.clipPos = TransformWorldToHClip( positionWS );
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = o.clipPos;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
			   return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN , bool ase_vface : SV_IsFrontFace ) : SV_TARGET
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.worldPos;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 texCoord9 = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float mulTime16 = _TimeParameters.x * _TimeScale;
				float temp_output_14_0 = ( _Speed * mulTime16 );
				float4 _SpeedConstant = float4(1,-2,2,-1);
				float2 temp_cast_0 = (_SpeedConstant.x).xx;
				float2 texCoord35 = IN.ase_texcoord2.xy * float2( 1,1 ) + float2( 0,0 );
				float4 appendResult40 = (float4(_UTilling , _VTilling , 0.0 , 0.0));
				float4 temp_output_41_0 = ( float4( ( texCoord35 * _Tilling ), 0.0 , 0.0 ) * appendResult40 );
				float2 panner10 = ( temp_output_14_0 * temp_cast_0 + temp_output_41_0.xy);
				float2 panner11 = ( temp_output_14_0 * _SpeedConstant.xy + ( temp_output_41_0 + 0.418 ).xy);
				float4 _SpeedConstant1 = float4(1,0,2,-1);
				float2 temp_cast_6 = (_SpeedConstant1.w).xx;
				float2 panner12 = ( temp_output_14_0 * temp_cast_6 + ( temp_output_41_0 + 8.9 ).xy);
				float2 panner13 = ( temp_output_14_0 * _SpeedConstant1.xy + ( temp_output_41_0 + 0.65 ).xy);
				float simplePerlin2D53 = snoise( ( texCoord9 + (( ( ( tex2D( _Pattern, panner10 ) + tex2D( _Pattern, panner11 ) ) + ( tex2D( _Pattern, panner12 ) + tex2D( _Pattern, panner13 ) ) ) * _Divisor )).r ) );
				simplePerlin2D53 = simplePerlin2D53*0.5 + 0.5;
				float clampResult62 = clamp( ( pow( sin( frac( ( simplePerlin2D53 * _Number ) ) ) , _Pow ) * _Multi ) , 0.0 , 1.0 );
				#ifdef _FLIPSIDE_ON
				float staticSwitch80 = ( ( 1.0 - ase_vface ) * clampResult62 );
				#else
				float staticSwitch80 = clampResult62;
				#endif
				float Opacity63 = staticSwitch80;
				

				float Alpha = Opacity63;
				float AlphaClipThreshold = 0.5;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.clipPos );
				#endif
				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
            Name "SceneSelectionPass"
            Tags { "LightMode"="SceneSelectionPass" }

			Cull Off

			HLSLPROGRAM

			#pragma multi_compile_instancing
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _RECEIVE_SHADOWS_OFF 1
			#define _ALPHAPREMULTIPLY_ON 1
			#define ASE_SRP_VERSION 140007


			#pragma vertex vert
			#pragma fragment frag

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local _FLIPSIDE_ON


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _EmissiveColor;
			float3 _Direction;
			float _Speed;
			float _TimeScale;
			float _Tilling;
			float _UTilling;
			float _VTilling;
			float _Divisor;
			float _Number;
			float _Pow;
			float _Multi;
			float _Meshsize;
			float _EmmisiveBoost;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _Pattern;


			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
			}
			

			int _ObjectId;
			int _PassValue;

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float2 texCoord9 = v.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float mulTime16 = _TimeParameters.x * _TimeScale;
				float temp_output_14_0 = ( _Speed * mulTime16 );
				float4 _SpeedConstant = float4(1,-2,2,-1);
				float2 temp_cast_0 = (_SpeedConstant.x).xx;
				float2 texCoord35 = v.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float4 appendResult40 = (float4(_UTilling , _VTilling , 0.0 , 0.0));
				float4 temp_output_41_0 = ( float4( ( texCoord35 * _Tilling ), 0.0 , 0.0 ) * appendResult40 );
				float2 panner10 = ( temp_output_14_0 * temp_cast_0 + temp_output_41_0.xy);
				float2 panner11 = ( temp_output_14_0 * _SpeedConstant.xy + ( temp_output_41_0 + 0.418 ).xy);
				float4 _SpeedConstant1 = float4(1,0,2,-1);
				float2 temp_cast_6 = (_SpeedConstant1.w).xx;
				float2 panner12 = ( temp_output_14_0 * temp_cast_6 + ( temp_output_41_0 + 8.9 ).xy);
				float2 panner13 = ( temp_output_14_0 * _SpeedConstant1.xy + ( temp_output_41_0 + 0.65 ).xy);
				float simplePerlin2D53 = snoise( ( texCoord9 + (( ( ( tex2Dlod( _Pattern, float4( panner10, 0, 0.0) ) + tex2Dlod( _Pattern, float4( panner11, 0, 0.0) ) ) + ( tex2Dlod( _Pattern, float4( panner12, 0, 0.0) ) + tex2Dlod( _Pattern, float4( panner13, 0, 0.0) ) ) ) * _Divisor )).r ) );
				simplePerlin2D53 = simplePerlin2D53*0.5 + 0.5;
				float clampResult62 = clamp( ( pow( sin( frac( ( simplePerlin2D53 * _Number ) ) ) , _Pow ) * _Multi ) , 0.0 , 1.0 );
				float3 temp_cast_12 = (_Meshsize).xxx;
				float3 VertexOffset81 = ( clampResult62 * max( ( v.ase_normal * _Direction ) , temp_cast_12 ) );
				
				o.ase_texcoord.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = VertexOffset81;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				o.clipPos = TransformWorldToHClip(positionWS);

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN , bool ase_vface : SV_IsFrontFace) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float2 texCoord9 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float mulTime16 = _TimeParameters.x * _TimeScale;
				float temp_output_14_0 = ( _Speed * mulTime16 );
				float4 _SpeedConstant = float4(1,-2,2,-1);
				float2 temp_cast_0 = (_SpeedConstant.x).xx;
				float2 texCoord35 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float4 appendResult40 = (float4(_UTilling , _VTilling , 0.0 , 0.0));
				float4 temp_output_41_0 = ( float4( ( texCoord35 * _Tilling ), 0.0 , 0.0 ) * appendResult40 );
				float2 panner10 = ( temp_output_14_0 * temp_cast_0 + temp_output_41_0.xy);
				float2 panner11 = ( temp_output_14_0 * _SpeedConstant.xy + ( temp_output_41_0 + 0.418 ).xy);
				float4 _SpeedConstant1 = float4(1,0,2,-1);
				float2 temp_cast_6 = (_SpeedConstant1.w).xx;
				float2 panner12 = ( temp_output_14_0 * temp_cast_6 + ( temp_output_41_0 + 8.9 ).xy);
				float2 panner13 = ( temp_output_14_0 * _SpeedConstant1.xy + ( temp_output_41_0 + 0.65 ).xy);
				float simplePerlin2D53 = snoise( ( texCoord9 + (( ( ( tex2D( _Pattern, panner10 ) + tex2D( _Pattern, panner11 ) ) + ( tex2D( _Pattern, panner12 ) + tex2D( _Pattern, panner13 ) ) ) * _Divisor )).r ) );
				simplePerlin2D53 = simplePerlin2D53*0.5 + 0.5;
				float clampResult62 = clamp( ( pow( sin( frac( ( simplePerlin2D53 * _Number ) ) ) , _Pow ) * _Multi ) , 0.0 , 1.0 );
				#ifdef _FLIPSIDE_ON
				float staticSwitch80 = ( ( 1.0 - ase_vface ) * clampResult62 );
				#else
				float staticSwitch80 = clampResult62;
				#endif
				float Opacity63 = staticSwitch80;
				

				surfaceDescription.Alpha = Opacity63;
				surfaceDescription.AlphaClipThreshold = 0.5;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
					clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				return outColor;
			}
			ENDHLSL
		}

		
		Pass
		{
			
            Name "ScenePickingPass"
            Tags { "LightMode"="Picking" }

			HLSLPROGRAM

			#pragma multi_compile_instancing
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _RECEIVE_SHADOWS_OFF 1
			#define _ALPHAPREMULTIPLY_ON 1
			#define ASE_SRP_VERSION 140007


			#pragma vertex vert
			#pragma fragment frag

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local _FLIPSIDE_ON


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _EmissiveColor;
			float3 _Direction;
			float _Speed;
			float _TimeScale;
			float _Tilling;
			float _UTilling;
			float _VTilling;
			float _Divisor;
			float _Number;
			float _Pow;
			float _Multi;
			float _Meshsize;
			float _EmmisiveBoost;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _Pattern;


			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
			}
			

			float4 _SelectionID;


			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float2 texCoord9 = v.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float mulTime16 = _TimeParameters.x * _TimeScale;
				float temp_output_14_0 = ( _Speed * mulTime16 );
				float4 _SpeedConstant = float4(1,-2,2,-1);
				float2 temp_cast_0 = (_SpeedConstant.x).xx;
				float2 texCoord35 = v.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float4 appendResult40 = (float4(_UTilling , _VTilling , 0.0 , 0.0));
				float4 temp_output_41_0 = ( float4( ( texCoord35 * _Tilling ), 0.0 , 0.0 ) * appendResult40 );
				float2 panner10 = ( temp_output_14_0 * temp_cast_0 + temp_output_41_0.xy);
				float2 panner11 = ( temp_output_14_0 * _SpeedConstant.xy + ( temp_output_41_0 + 0.418 ).xy);
				float4 _SpeedConstant1 = float4(1,0,2,-1);
				float2 temp_cast_6 = (_SpeedConstant1.w).xx;
				float2 panner12 = ( temp_output_14_0 * temp_cast_6 + ( temp_output_41_0 + 8.9 ).xy);
				float2 panner13 = ( temp_output_14_0 * _SpeedConstant1.xy + ( temp_output_41_0 + 0.65 ).xy);
				float simplePerlin2D53 = snoise( ( texCoord9 + (( ( ( tex2Dlod( _Pattern, float4( panner10, 0, 0.0) ) + tex2Dlod( _Pattern, float4( panner11, 0, 0.0) ) ) + ( tex2Dlod( _Pattern, float4( panner12, 0, 0.0) ) + tex2Dlod( _Pattern, float4( panner13, 0, 0.0) ) ) ) * _Divisor )).r ) );
				simplePerlin2D53 = simplePerlin2D53*0.5 + 0.5;
				float clampResult62 = clamp( ( pow( sin( frac( ( simplePerlin2D53 * _Number ) ) ) , _Pow ) * _Multi ) , 0.0 , 1.0 );
				float3 temp_cast_12 = (_Meshsize).xxx;
				float3 VertexOffset81 = ( clampResult62 * max( ( v.ase_normal * _Direction ) , temp_cast_12 ) );
				
				o.ase_texcoord.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif
				float3 vertexValue = VertexOffset81;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				o.clipPos = TransformWorldToHClip(positionWS);
				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			half4 frag(VertexOutput IN , bool ase_vface : SV_IsFrontFace) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float2 texCoord9 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float mulTime16 = _TimeParameters.x * _TimeScale;
				float temp_output_14_0 = ( _Speed * mulTime16 );
				float4 _SpeedConstant = float4(1,-2,2,-1);
				float2 temp_cast_0 = (_SpeedConstant.x).xx;
				float2 texCoord35 = IN.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float4 appendResult40 = (float4(_UTilling , _VTilling , 0.0 , 0.0));
				float4 temp_output_41_0 = ( float4( ( texCoord35 * _Tilling ), 0.0 , 0.0 ) * appendResult40 );
				float2 panner10 = ( temp_output_14_0 * temp_cast_0 + temp_output_41_0.xy);
				float2 panner11 = ( temp_output_14_0 * _SpeedConstant.xy + ( temp_output_41_0 + 0.418 ).xy);
				float4 _SpeedConstant1 = float4(1,0,2,-1);
				float2 temp_cast_6 = (_SpeedConstant1.w).xx;
				float2 panner12 = ( temp_output_14_0 * temp_cast_6 + ( temp_output_41_0 + 8.9 ).xy);
				float2 panner13 = ( temp_output_14_0 * _SpeedConstant1.xy + ( temp_output_41_0 + 0.65 ).xy);
				float simplePerlin2D53 = snoise( ( texCoord9 + (( ( ( tex2D( _Pattern, panner10 ) + tex2D( _Pattern, panner11 ) ) + ( tex2D( _Pattern, panner12 ) + tex2D( _Pattern, panner13 ) ) ) * _Divisor )).r ) );
				simplePerlin2D53 = simplePerlin2D53*0.5 + 0.5;
				float clampResult62 = clamp( ( pow( sin( frac( ( simplePerlin2D53 * _Number ) ) ) , _Pow ) * _Multi ) , 0.0 , 1.0 );
				#ifdef _FLIPSIDE_ON
				float staticSwitch80 = ( ( 1.0 - ase_vface ) * clampResult62 );
				#else
				float staticSwitch80 = clampResult62;
				#endif
				float Opacity63 = staticSwitch80;
				

				surfaceDescription.Alpha = Opacity63;
				surfaceDescription.AlphaClipThreshold = 0.5;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
					clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = 0;
				outColor = _SelectionID;

				return outColor;
			}

			ENDHLSL
		}

		
		Pass
		{
			
            Name "DepthNormals"
            Tags { "LightMode"="DepthNormalsOnly" }

			ZTest LEqual
			ZWrite On


			HLSLPROGRAM

			#pragma multi_compile_instancing
			#define _SURFACE_TYPE_TRANSPARENT 1
			#define _RECEIVE_SHADOWS_OFF 1
			#define _ALPHAPREMULTIPLY_ON 1
			#define ASE_SRP_VERSION 140007


			#pragma vertex vert
			#pragma fragment frag

			#pragma multi_compile_fragment _ _WRITE_RENDERING_LAYERS
        	#pragma multi_compile_fragment _ _GBUFFER_NORMALS_OCT

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define VARYINGS_NEED_NORMAL_WS

			#define SHADERPASS SHADERPASS_DEPTHNORMALSONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"

			#define ASE_NEEDS_VERT_NORMAL
			#pragma shader_feature_local _FLIPSIDE_ON


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float3 normalWS : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _EmissiveColor;
			float3 _Direction;
			float _Speed;
			float _TimeScale;
			float _Tilling;
			float _UTilling;
			float _VTilling;
			float _Divisor;
			float _Number;
			float _Pow;
			float _Multi;
			float _Meshsize;
			float _EmmisiveBoost;
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			sampler2D _Pattern;


			float3 mod2D289( float3 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float2 mod2D289( float2 x ) { return x - floor( x * ( 1.0 / 289.0 ) ) * 289.0; }
			float3 permute( float3 x ) { return mod2D289( ( ( x * 34.0 ) + 1.0 ) * x ); }
			float snoise( float2 v )
			{
				const float4 C = float4( 0.211324865405187, 0.366025403784439, -0.577350269189626, 0.024390243902439 );
				float2 i = floor( v + dot( v, C.yy ) );
				float2 x0 = v - i + dot( i, C.xx );
				float2 i1;
				i1 = ( x0.x > x0.y ) ? float2( 1.0, 0.0 ) : float2( 0.0, 1.0 );
				float4 x12 = x0.xyxy + C.xxzz;
				x12.xy -= i1;
				i = mod2D289( i );
				float3 p = permute( permute( i.y + float3( 0.0, i1.y, 1.0 ) ) + i.x + float3( 0.0, i1.x, 1.0 ) );
				float3 m = max( 0.5 - float3( dot( x0, x0 ), dot( x12.xy, x12.xy ), dot( x12.zw, x12.zw ) ), 0.0 );
				m = m * m;
				m = m * m;
				float3 x = 2.0 * frac( p * C.www ) - 1.0;
				float3 h = abs( x ) - 0.5;
				float3 ox = floor( x + 0.5 );
				float3 a0 = x - ox;
				m *= 1.79284291400159 - 0.85373472095314 * ( a0 * a0 + h * h );
				float3 g;
				g.x = a0.x * x0.x + h.x * x0.y;
				g.yz = a0.yz * x12.xz + h.yz * x12.yw;
				return 130.0 * dot( m, g );
			}
			

			struct SurfaceDescription
			{
				float Alpha;
				float AlphaClipThreshold;
			};

			VertexOutput VertexFunction(VertexInput v  )
			{
				VertexOutput o;
				ZERO_INITIALIZE(VertexOutput, o);

				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				float2 texCoord9 = v.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float mulTime16 = _TimeParameters.x * _TimeScale;
				float temp_output_14_0 = ( _Speed * mulTime16 );
				float4 _SpeedConstant = float4(1,-2,2,-1);
				float2 temp_cast_0 = (_SpeedConstant.x).xx;
				float2 texCoord35 = v.ase_texcoord.xy * float2( 1,1 ) + float2( 0,0 );
				float4 appendResult40 = (float4(_UTilling , _VTilling , 0.0 , 0.0));
				float4 temp_output_41_0 = ( float4( ( texCoord35 * _Tilling ), 0.0 , 0.0 ) * appendResult40 );
				float2 panner10 = ( temp_output_14_0 * temp_cast_0 + temp_output_41_0.xy);
				float2 panner11 = ( temp_output_14_0 * _SpeedConstant.xy + ( temp_output_41_0 + 0.418 ).xy);
				float4 _SpeedConstant1 = float4(1,0,2,-1);
				float2 temp_cast_6 = (_SpeedConstant1.w).xx;
				float2 panner12 = ( temp_output_14_0 * temp_cast_6 + ( temp_output_41_0 + 8.9 ).xy);
				float2 panner13 = ( temp_output_14_0 * _SpeedConstant1.xy + ( temp_output_41_0 + 0.65 ).xy);
				float simplePerlin2D53 = snoise( ( texCoord9 + (( ( ( tex2Dlod( _Pattern, float4( panner10, 0, 0.0) ) + tex2Dlod( _Pattern, float4( panner11, 0, 0.0) ) ) + ( tex2Dlod( _Pattern, float4( panner12, 0, 0.0) ) + tex2Dlod( _Pattern, float4( panner13, 0, 0.0) ) ) ) * _Divisor )).r ) );
				simplePerlin2D53 = simplePerlin2D53*0.5 + 0.5;
				float clampResult62 = clamp( ( pow( sin( frac( ( simplePerlin2D53 * _Number ) ) ) , _Pow ) * _Multi ) , 0.0 , 1.0 );
				float3 temp_cast_12 = (_Meshsize).xxx;
				float3 VertexOffset81 = ( clampResult62 * max( ( v.ase_normal * _Direction ) , temp_cast_12 ) );
				
				o.ase_texcoord1.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord1.zw = 0;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = VertexOffset81;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 normalWS = TransformObjectToWorldNormal(v.ase_normal);

				o.clipPos = TransformWorldToHClip(positionWS);
				o.normalWS.xyz =  normalWS;

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_texcoord : TEXCOORD0;

				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct TessellationFactors
			{
				float edge[3] : SV_TessFactor;
				float inside : SV_InsideTessFactor;
			};

			VertexControl vert ( VertexInput v )
			{
				VertexControl o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				o.vertex = v.vertex;
				o.ase_normal = v.ase_normal;
				o.ase_texcoord = v.ase_texcoord;
				return o;
			}

			TessellationFactors TessellationFunction (InputPatch<VertexControl,3> v)
			{
				TessellationFactors o;
				float4 tf = 1;
				float tessValue = _TessValue; float tessMin = _TessMin; float tessMax = _TessMax;
				float edgeLength = _TessEdgeLength; float tessMaxDisp = _TessMaxDisp;
				#if defined(ASE_FIXED_TESSELLATION)
				tf = FixedTess( tessValue );
				#elif defined(ASE_DISTANCE_TESSELLATION)
				tf = DistanceBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, tessValue, tessMin, tessMax, GetObjectToWorldMatrix(), _WorldSpaceCameraPos );
				#elif defined(ASE_LENGTH_TESSELLATION)
				tf = EdgeLengthBasedTess(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams );
				#elif defined(ASE_LENGTH_CULL_TESSELLATION)
				tf = EdgeLengthBasedTessCull(v[0].vertex, v[1].vertex, v[2].vertex, edgeLength, tessMaxDisp, GetObjectToWorldMatrix(), _WorldSpaceCameraPos, _ScreenParams, unity_CameraWorldClipPlanes );
				#endif
				o.edge[0] = tf.x; o.edge[1] = tf.y; o.edge[2] = tf.z; o.inside = tf.w;
				return o;
			}

			[domain("tri")]
			[partitioning("fractional_odd")]
			[outputtopology("triangle_cw")]
			[patchconstantfunc("TessellationFunction")]
			[outputcontrolpoints(3)]
			VertexControl HullFunction(InputPatch<VertexControl, 3> patch, uint id : SV_OutputControlPointID)
			{
				return patch[id];
			}

			[domain("tri")]
			VertexOutput DomainFunction(TessellationFactors factors, OutputPatch<VertexControl, 3> patch, float3 bary : SV_DomainLocation)
			{
				VertexInput o = (VertexInput) 0;
				o.vertex = patch[0].vertex * bary.x + patch[1].vertex * bary.y + patch[2].vertex * bary.z;
				o.ase_normal = patch[0].ase_normal * bary.x + patch[1].ase_normal * bary.y + patch[2].ase_normal * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				#if defined(ASE_PHONG_TESSELLATION)
				float3 pp[3];
				for (int i = 0; i < 3; ++i)
					pp[i] = o.vertex.xyz - patch[i].ase_normal * (dot(o.vertex.xyz, patch[i].ase_normal) - dot(patch[i].vertex.xyz, patch[i].ase_normal));
				float phongStrength = _TessPhongStrength;
				o.vertex.xyz = phongStrength * (pp[0]*bary.x + pp[1]*bary.y + pp[2]*bary.z) + (1.0f-phongStrength) * o.vertex.xyz;
				#endif
				UNITY_TRANSFER_INSTANCE_ID(patch[0], o);
				return VertexFunction(o);
			}
			#else
			VertexOutput vert ( VertexInput v )
			{
				return VertexFunction( v );
			}
			#endif

			void frag( VertexOutput IN
				, out half4 outNormalWS : SV_Target0
			#ifdef _WRITE_RENDERING_LAYERS
				, out float4 outRenderingLayers : SV_Target1
			#endif
				, bool ase_vface : SV_IsFrontFace )
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				float2 texCoord9 = IN.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float mulTime16 = _TimeParameters.x * _TimeScale;
				float temp_output_14_0 = ( _Speed * mulTime16 );
				float4 _SpeedConstant = float4(1,-2,2,-1);
				float2 temp_cast_0 = (_SpeedConstant.x).xx;
				float2 texCoord35 = IN.ase_texcoord1.xy * float2( 1,1 ) + float2( 0,0 );
				float4 appendResult40 = (float4(_UTilling , _VTilling , 0.0 , 0.0));
				float4 temp_output_41_0 = ( float4( ( texCoord35 * _Tilling ), 0.0 , 0.0 ) * appendResult40 );
				float2 panner10 = ( temp_output_14_0 * temp_cast_0 + temp_output_41_0.xy);
				float2 panner11 = ( temp_output_14_0 * _SpeedConstant.xy + ( temp_output_41_0 + 0.418 ).xy);
				float4 _SpeedConstant1 = float4(1,0,2,-1);
				float2 temp_cast_6 = (_SpeedConstant1.w).xx;
				float2 panner12 = ( temp_output_14_0 * temp_cast_6 + ( temp_output_41_0 + 8.9 ).xy);
				float2 panner13 = ( temp_output_14_0 * _SpeedConstant1.xy + ( temp_output_41_0 + 0.65 ).xy);
				float simplePerlin2D53 = snoise( ( texCoord9 + (( ( ( tex2D( _Pattern, panner10 ) + tex2D( _Pattern, panner11 ) ) + ( tex2D( _Pattern, panner12 ) + tex2D( _Pattern, panner13 ) ) ) * _Divisor )).r ) );
				simplePerlin2D53 = simplePerlin2D53*0.5 + 0.5;
				float clampResult62 = clamp( ( pow( sin( frac( ( simplePerlin2D53 * _Number ) ) ) , _Pow ) * _Multi ) , 0.0 , 1.0 );
				#ifdef _FLIPSIDE_ON
				float staticSwitch80 = ( ( 1.0 - ase_vface ) * clampResult62 );
				#else
				float staticSwitch80 = clampResult62;
				#endif
				float Opacity63 = staticSwitch80;
				

				surfaceDescription.Alpha = Opacity63;
				surfaceDescription.AlphaClipThreshold = 0.5;

				#if _ALPHATEST_ON
					clip(surfaceDescription.Alpha - surfaceDescription.AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.clipPos );
				#endif

				#if defined(_GBUFFER_NORMALS_OCT)
					float3 normalWS = normalize(IN.normalWS);
					float2 octNormalWS = PackNormalOctQuadEncode(normalWS);           // values between [-1, +1], must use fp32 on some platforms
					float2 remappedOctNormalWS = saturate(octNormalWS * 0.5 + 0.5);   // values between [ 0,  1]
					half3 packedNormalWS = PackFloat2To888(remappedOctNormalWS);      // values between [ 0,  1]
					outNormalWS = half4(packedNormalWS, 0.0);
				#else
					float3 normalWS = IN.normalWS;
					outNormalWS = half4(NormalizeNormalPerPixel(normalWS), 0.0);
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4(EncodeMeshRenderingLayer(renderingLayers), 0, 0, 0);
				#endif
			}

			ENDHLSL
		}

	
	}
	
	CustomEditor "UnityEditor.ShaderGraphUnlitGUI"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback Off
}
/*ASEBEGIN
Version=19105
Node;AmplifyShaderEditor.CommentaryNode;73;160.2232,-677.3101;Inherit;False;685;417;Vertex Offset;5;68;69;71;72;90;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;64;-28.13894,-1030.683;Inherit;False;870.2644;323.4664;Fine Tune;5;59;58;61;60;62;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;57;-1644.995,-1033.324;Inherit;False;1571.341;399.7491;Electric Effect;8;54;56;55;53;9;47;44;97;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;42;-4681.802,-1519.014;Inherit;False;657.7256;497.1013;Tilling;7;35;37;36;39;38;40;41;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;34;-3982.847,-1531.769;Inherit;False;2308.569;1226.168;Motion 4 ways Chaos;26;10;11;12;13;14;16;18;19;20;21;22;25;26;27;28;29;30;31;33;17;15;32;24;23;95;98;;1,1,1,1;0;0
Node;AmplifyShaderEditor.PannerNode;10;-2979.847,-1163.634;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;11;-2977.847,-969.6342;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;12;-2988.847,-799.6342;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;13;-2984.847,-630.6342;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;14;-3431.847,-663.6342;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;16;-3753.847,-573.6342;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;18;-3428.847,-1145.634;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleAddOpNode;19;-3423.847,-1000.634;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleAddOpNode;20;-3426.847,-856.6342;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;21;-3756.847,-1127.634;Inherit;False;Constant;_Float1;Float 1;2;0;Create;True;0;0;0;False;0;False;0.418;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;26;-2678.532,-955.6008;Inherit;True;Property;_TextureSample1;Texture Sample 0;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;27;-2679.532,-744.6008;Inherit;True;Property;_TextureSample2;Texture Sample 0;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;28;-2680.532,-535.6009;Inherit;True;Property;_TextureSample3;Texture Sample 0;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;29;-2318.355,-1019.673;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;30;-2306.532,-601.1404;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;31;-2123.275,-834.0525;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;35;-4631.802,-1469.014;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;37;-4558.076,-1335.913;Inherit;False;Property;_Tilling;Tilling;9;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;36;-4379.668,-1468.467;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;39;-4548.076,-1226.913;Inherit;False;Property;_UTilling;U Tilling;11;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;38;-4548.076,-1137.913;Inherit;False;Property;_VTilling;V Tilling;10;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;40;-4344.075,-1240.913;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;41;-4186.076,-1468.912;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;33;-2101.993,-532.5673;Inherit;False;Property;_Divisor;Divisor;5;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;44;-1269.185,-978.5034;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ComponentMaskNode;47;-1594.995,-832.6997;Inherit;True;True;False;False;False;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;9;-1572.08,-977.8276;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.NoiseGeneratorNode;53;-1060.32,-983.3242;Inherit;False;Simplex2D;True;False;2;0;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;55;-835.3198,-977.3242;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;56;-564.515,-978.1969;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;54;-1025.32,-840.3242;Inherit;False;Property;_Number;Number;6;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;24;-2678.847,-1182.638;Inherit;True;Property;_TextureSample0;Texture Sample 0;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;32;-1909.278,-832.8702;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;17;-3932.847,-577.6342;Inherit;False;Property;_TimeScale;Time Scale;3;0;Create;True;0;0;0;False;0;False;0.1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;22;-3753.847,-979.6342;Inherit;False;Constant;_Float2;Float 2;2;0;Create;True;0;0;0;False;0;False;8.9;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;23;-3763.347,-827.0343;Inherit;False;Constant;_Float3;Float 3;2;0;Create;True;0;0;0;False;0;False;0.65;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;97;-342.2249,-978.551;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;58;178.1862,-980.6819;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;61;457.7461,-979.5412;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;62;671.1237,-977.2589;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.NormalVertexDataNode;68;241.2234,-627.3101;Inherit;False;0;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;69;499.2223,-626.3101;Inherit;False;2;2;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMaxOpNode;71;693.2219,-626.3101;Inherit;False;2;0;FLOAT3;0,0,0;False;1;FLOAT;0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;74;946.2231,-748.3101;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;77;1114.226,-1379.311;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.WireNode;78;995.224,-1264.311;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;81;1586.227,-758.3101;Inherit;False;VertexOffset;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;67;818.7943,-1242.543;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;60;275.1769,-827.7798;Inherit;False;Property;_Multi;Multi;8;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;90;263.5632,-470.0349;Inherit;False;Property;_Direction;Direction;13;0;Create;True;0;0;0;False;0;False;0.01,0.01,0.01;0.01,0.01,0.01;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Vector4Node;95;-3463.167,-1447.68;Inherit;False;Constant;_SpeedConstant;Speed Constant;15;0;Create;True;0;0;0;False;0;False;1,-2,2,-1;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;98;-3462.853,-531.7484;Inherit;False;Constant;_SpeedConstant1;Speed Constant;15;0;Create;True;0;0;0;False;0;False;1,0,2,-1;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;89;1022.327,-1088.708;Inherit;False;Property;_EmmisiveBoost;Emmisive Boost;0;0;Create;True;0;0;0;False;0;False;50;50;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;72;507.2221,-465.3104;Inherit;False;Property;_Meshsize;Mesh size;12;0;Create;True;0;0;0;False;0;False;0.03;0.03;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;59;21.86117,-823.2155;Inherit;False;Property;_Pow;Pow;7;0;Create;True;0;0;0;False;0;False;5;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;15;-3725.148,-665.234;Inherit;False;Property;_Speed;Speed;2;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;66;559.7941,-1248.543;Inherit;False;Property;_EmissiveColor;Emissive Color;1;0;Create;True;0;0;0;False;0;False;0.4858491,0.8229298,1,0;0.3537736,0.6568573,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexturePropertyNode;25;-3019.208,-1386.385;Inherit;True;Property;_Pattern;Pattern;4;0;Create;True;0;0;0;False;0;False;db7f4ce1bb2d95d4e9b96b7dbe5a5fc8;db7f4ce1bb2d95d4e9b96b7dbe5a5fc8;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RegisterLocalVarNode;82;1574.227,-1251.311;Inherit;False;Emiisive;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TwoSidedSign;75;649.2218,-1536.311;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;76;856.2224,-1535.311;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;88;1328.328,-1245.708;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;80;1298.526,-1383.31;Inherit;False;Property;_Flipside;Flip side;14;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;63;1576.084,-1381.965;Inherit;False;Opacity;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;87;679.9628,288.4455;Inherit;False;81;VertexOffset;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;86;698.6964,205.9165;Inherit;False;63;Opacity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;85;697.6964,112.9165;Inherit;False;82;Emiisive;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;100;935.6411,32.22744;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;3;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;102;935.6411,32.22744;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;103;935.6411,32.22744;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;104;935.6411,32.22744;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;105;935.6411,32.22744;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;3;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;106;935.6411,32.22744;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;SceneSelectionPass;0;6;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;107;935.6411,32.22744;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;ScenePickingPass;0;7;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;108;935.6411,32.22744;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;DepthNormals;0;8;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormalsOnly;False;False;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;109;935.6411,32.22744;Float;False;False;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;1;New Amplify Shader;2992e84f91cbeb14eab234972e07ea9d;True;DepthNormalsOnly;0;9;DepthNormalsOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Unlit;True;3;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormalsOnly;False;True;9;d3d11;metal;vulkan;xboxone;xboxseries;playstation;ps4;ps5;switch;0;;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;101;942.6411,169.2274;Float;False;True;-1;2;UnityEditor.ShaderGraphUnlitGUI;0;13;DawnShaderURP_V2/EnergyURP;2992e84f91cbeb14eab234972e07ea9d;True;Forward;0;1;Forward;8;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;False;False;False;True;4;RenderPipeline=UniversalPipeline;RenderType=Transparent=RenderType;Queue=Transparent=Queue=0;UniversalMaterialType=Unlit;True;3;True;12;all;0;False;True;1;1;False;;10;False;;1;1;False;;10;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;True;2;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForwardOnly;False;False;0;;0;0;Standard;23;Surface;1;638140218401781101;  Blend;1;638140219396890024;Two Sided;1;0;Forward Only;0;0;Cast Shadows;1;0;  Use Shadow Threshold;0;0;Receive Shadows;0;638140219232424315;GPU Instancing;1;0;LOD CrossFade;0;0;Built-in Fog;0;0;DOTS Instancing;0;0;Meta Pass;0;0;Extra Pre Pass;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Vertex Position,InvertActionOnDeselection;1;0;0;10;False;True;True;True;False;False;True;True;True;False;False;;False;0
WireConnection;10;0;41;0
WireConnection;10;2;95;1
WireConnection;10;1;14;0
WireConnection;11;0;18;0
WireConnection;11;2;95;0
WireConnection;11;1;14;0
WireConnection;12;0;19;0
WireConnection;12;2;98;4
WireConnection;12;1;14;0
WireConnection;13;0;20;0
WireConnection;13;2;98;0
WireConnection;13;1;14;0
WireConnection;14;0;15;0
WireConnection;14;1;16;0
WireConnection;16;0;17;0
WireConnection;18;0;41;0
WireConnection;18;1;21;0
WireConnection;19;0;41;0
WireConnection;19;1;22;0
WireConnection;20;0;41;0
WireConnection;20;1;23;0
WireConnection;26;0;25;0
WireConnection;26;1;11;0
WireConnection;27;0;25;0
WireConnection;27;1;12;0
WireConnection;28;0;25;0
WireConnection;28;1;13;0
WireConnection;29;0;24;0
WireConnection;29;1;26;0
WireConnection;30;0;27;0
WireConnection;30;1;28;0
WireConnection;31;0;29;0
WireConnection;31;1;30;0
WireConnection;36;0;35;0
WireConnection;36;1;37;0
WireConnection;40;0;39;0
WireConnection;40;1;38;0
WireConnection;41;0;36;0
WireConnection;41;1;40;0
WireConnection;44;0;9;0
WireConnection;44;1;47;0
WireConnection;47;0;32;0
WireConnection;53;0;44;0
WireConnection;55;0;53;0
WireConnection;55;1;54;0
WireConnection;56;0;55;0
WireConnection;24;0;25;0
WireConnection;24;1;10;0
WireConnection;32;0;31;0
WireConnection;32;1;33;0
WireConnection;97;0;56;0
WireConnection;58;0;97;0
WireConnection;58;1;59;0
WireConnection;61;0;58;0
WireConnection;61;1;60;0
WireConnection;62;0;61;0
WireConnection;69;0;68;0
WireConnection;69;1;90;0
WireConnection;71;0;69;0
WireConnection;71;1;72;0
WireConnection;74;0;62;0
WireConnection;74;1;71;0
WireConnection;77;0;76;0
WireConnection;77;1;78;0
WireConnection;78;0;62;0
WireConnection;81;0;74;0
WireConnection;67;0;66;0
WireConnection;67;1;62;0
WireConnection;82;0;88;0
WireConnection;76;0;75;0
WireConnection;88;0;67;0
WireConnection;88;1;89;0
WireConnection;80;1;62;0
WireConnection;80;0;77;0
WireConnection;63;0;80;0
WireConnection;101;2;85;0
WireConnection;101;3;86;0
WireConnection;101;5;87;0
ASEEND*/
//CHKSM=C0B193531213F6DF53A6012597427BFC88E017B4