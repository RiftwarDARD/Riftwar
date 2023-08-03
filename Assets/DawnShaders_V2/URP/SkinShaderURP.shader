// Made with Amplify Shader Editor v1.9.1.5
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DawnShaderURP_V2/SkinURP"
{
	Properties
	{
		[HideInInspector] _EmissionColor("Emission Color", Color) = (1,1,1,1)
		[HideInInspector] _AlphaCutoff("Alpha Cutoff ", Range(0, 1)) = 0.5
		[ASEBegin]_TattoMask("Tatto Mask", 2D) = "white" {}
		_TattooColor("Tattoo Color", Color) = (0.1422659,0.1889629,0.2169811,0)
		_TattooBoots("Tattoo Boots", Range( 0 , 1)) = 0
		_Dirt("Dirt", 2D) = "white" {}
		_DirtColor("Dirt Color", Color) = (0.2156863,0.1627929,0.1411765,0)
		_DirtBoots("Dirt Boots", Range( 0 , 1)) = 0
		_DirtRoughness_Power("DirtRoughness_Power", Float) = 0
		_SkinNormal("Skin Normal", 2D) = "bump" {}
		_SkinColor("Skin Color", 2D) = "white" {}
		_ORM("ORM", 2D) = "white" {}
		_Mask("Mask", 2D) = "white" {}
		_SSSColor("SSS Color", Color) = (1,0.7457517,0.6839622,0)
		_SSSPower("SSS Power", Range( 0 , 10)) = 1
		[Toggle(_ISCYBORG_ON)] _isCyborg("is Cyborg", Float) = 0
		_AMS("AMS", 2D) = "white" {}
		_MetallicMultiply("Metallic Multiply", Range( 0 , 1)) = 0.35
		_RoughnessMod_R("RoughnessMod_R", 2D) = "white" {}
		_SkinRounghnessBoots("Skin Rounghness Boots", Range( 0 , 1)) = 0.55
		_SkinPore("Skin Pore", 2D) = "bump" {}
		_SkinPore_Power("SkinPore_Power", Range( 0 , 1)) = 0.25
		_SkinPore_Tilling("SkinPore_Tilling", Float) = 35
		_ColorPow("Color Pow", Range( 0 , 10)) = 0
		_BaseColorMul("BaseColorMul", Color) = (1,1,1,0)
		_FemaleLipsNailIMaleBeardNailsColor("Female Lips/Nail I Male Beard/Nails Color", Color) = (1,1,1,0)
		_FemaleLipsNailIMaleBeardNailsPower("Female Lips/Nail I Male Beard/Nails Power", Range( 0 , 1)) = 0
		_FemaleLipsNailIMaleBeardNailsRoughnessBoost("Female Lips/Nail I Male Beard/Nails Roughness Boost", Range( 0 , 1)) = 0.75
		_HairCapColor("HairCap Color", Color) = (0,0,0,0)
		_HairCapColorPower("HairCap Color Power", Range( 0 , 5)) = 0
		_HairCapRoughness("HairCap Roughness", Range( 0 , 1)) = 0.6
		_FreaklesColor("Freakles Color", Color) = (0,0,0,0)
		_FreaklesColorPower("Freakles Color Power", Range( 0 , 20)) = 0
		[Toggle(_ISEXTRAMAKEUP_ON)] _IsExtraMakeUp("Is Extra MakeUp", Float) = 0
		_ExtraMask("Extra Mask", 2D) = "white" {}
		_EyeShadowInColor("Eye Shadow In  Color", Color) = (1,1,1,0)
		_EyeShadowInPower("Eye Shadow In Power", Range( 0 , 1)) = 0
		_EyeShadowOutColor("Eye Shadow Out  Color", Color) = (1,1,1,0)
		_EyeShadowOutPower("Eye Shadow Out Power", Range( 0 , 1)) = 0
		_BlushColor("Blush Color", Color) = (1,1,1,0)
		_BlushPower("Blush Power", Range( 0 , 1)) = 0
		_EmissiveMask("Emissive Mask", 2D) = "white" {}
		_Pattern("Pattern", 2D) = "white" {}
		_Emissivepowerboost("Emissive power boost", Float) = 100
		[Toggle(_ISBASICEMMISION_ON)] _isBasicEmmision("is Basic Emmision", Float) = 0
		_EmissiveColor1("Emissive Color 1", Color) = (0,0,0,0)
		_EmissivePower1("Emissive Power 1", Range( 0 , 2000)) = 0
		_EmissiveColor2("Emissive Color 2", Color) = (0,0,0,0)
		_EmissivePower2("Emissive Power 2", Range( 0 , 2000)) = 248.8943
		_EmissiveColor3("Emissive Color 3", Color) = (0,0,0,0)
		_EmissivePower3("Emissive Power 3", Range( 0 , 2000)) = 0
		_Number("Number", Float) = 1
		_TimeScale("Time Scale", Float) = 0.1
		_Speed("Speed", Float) = 0.5
		_Divisor("Divisor", Float) = 1
		_Multi("Multi", Float) = 1
		_Pow("Pow", Float) = 5
		_Tilling("Tilling", Float) = 1
		_UTilling("U Tilling", Float) = 1
		[ASEEnd]_VTilling("V Tilling", Float) = 1
		[HideInInspector] _texcoord( "", 2D ) = "white" {}


		_TransmissionShadow( "Transmission Shadow", Range( 0, 1 ) ) = 0.5
		_TransStrength( "Strength", Range( 0, 50 ) ) = 1
		_TransNormal( "Normal Distortion", Range( 0, 1 ) ) = 0.5
		_TransScattering( "Scattering", Range( 1, 50 ) ) = 2
		_TransDirect( "Direct", Range( 0, 1 ) ) = 0.9
		_TransAmbient( "Ambient", Range( 0, 1 ) ) = 0.1
		_TransShadow( "Shadow", Range( 0, 1 ) ) = 0.5
		//_TessPhongStrength( "Tess Phong Strength", Range( 0, 1 ) ) = 0.5
		//_TessValue( "Tess Max Tessellation", Range( 1, 32 ) ) = 16
		//_TessMin( "Tess Min Distance", Float ) = 10
		//_TessMax( "Tess Max Distance", Float ) = 25
		//_TessEdgeLength ( "Tess Edge length", Range( 2, 50 ) ) = 16
		//_TessMaxDisp( "Tess Max Displacement", Float ) = 25

		[HideInInspector][ToggleOff] _SpecularHighlights("Specular Highlights", Float) = 1.0
		[HideInInspector][ToggleOff] _EnvironmentReflections("Environment Reflections", Float) = 1.0
		[HideInInspector][ToggleOff] _ReceiveShadows("Receive Shadows", Float) = 1.0

		[HideInInspector] _QueueOffset("_QueueOffset", Float) = 0
        [HideInInspector] _QueueControl("_QueueControl", Float) = -1

        [HideInInspector][NoScaleOffset] unity_Lightmaps("unity_Lightmaps", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_LightmapsInd("unity_LightmapsInd", 2DArray) = "" {}
        [HideInInspector][NoScaleOffset] unity_ShadowMasks("unity_ShadowMasks", 2DArray) = "" {}
	}

	SubShader
	{
		LOD 0

		

		Tags { "RenderPipeline"="UniversalPipeline" "RenderType"="Opaque" "Queue"="Geometry" "UniversalMaterialType"="Lit" }

		Cull Back
		ZWrite On
		ZTest LEqual
		Offset 0 , 0
		AlphaToMask Off

		

		HLSLINCLUDE
		#pragma target 4.5
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
			Tags { "LightMode"="UniversalForward" }

			Blend One Zero, One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140007


			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile _ _ADDITIONAL_LIGHTS_VERTEX _ADDITIONAL_LIGHTS
			#pragma multi_compile_fragment _ _ADDITIONAL_LIGHT_SHADOWS
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION
			#pragma multi_compile_fragment _ _SHADOWS_SOFT
			#pragma multi_compile_fragment _ _SCREEN_SPACE_OCCLUSION
			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile_fragment _ _LIGHT_LAYERS
			#pragma multi_compile_fragment _ _LIGHT_COOKIES
			#pragma multi_compile _ _FORWARD_PLUS
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF

			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment _ DEBUG_DISPLAY
			#pragma multi_compile_fragment _ _WRITE_RENDERING_LAYERS

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_FORWARD

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"

			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
				#define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#pragma shader_feature_local _ISCYBORG_ON
			#pragma shader_feature_local _ISEXTRAMAKEUP_ON
			#pragma shader_feature_local _ISBASICEMMISION_ON


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 lightmapUVOrVertexSH : TEXCOORD0;
				half4 fogFactorAndVertexLight : TEXCOORD1;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					float4 shadowCoord : TEXCOORD2;
				#endif
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
					float4 screenPos : TEXCOORD6;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON)
					float2 dynamicLightmapUV : TEXCOORD7;
				#endif
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _BaseColorMul;
			float4 _EmissiveMask_ST;
			float4 _EmissiveColor1;
			float4 _SSSColor;
			float4 _SkinNormal_ST;
			float4 _Dirt_ST;
			float4 _EmissiveColor2;
			float4 _DirtColor;
			float4 _AMS_ST;
			float4 _EmissiveColor3;
			float4 _TattoMask_ST;
			float4 _RoughnessMod_R_ST;
			float4 _BlushColor;
			float4 _TattooColor;
			float4 _ExtraMask_ST;
			float4 _SkinColor_ST;
			float4 _FemaleLipsNailIMaleBeardNailsColor;
			float4 _Mask_ST;
			float4 _EyeShadowInColor;
			float4 _HairCapColor;
			float4 _FreaklesColor;
			float4 _ORM_ST;
			float4 _EyeShadowOutColor;
			float _DirtRoughness_Power;
			float _HairCapRoughness;
			float _VTilling;
			float _EmissivePower3;
			float _Multi;
			float _Pow;
			float _SkinRounghnessBoots;
			float _Number;
			float _FemaleLipsNailIMaleBeardNailsRoughnessBoost;
			float _Divisor;
			float _EmissivePower2;
			float _UTilling;
			float _SkinPore_Tilling;
			float _TimeScale;
			float _ColorPow;
			float _FemaleLipsNailIMaleBeardNailsPower;
			float _FreaklesColorPower;
			float _HairCapColorPower;
			float _EyeShadowOutPower;
			float _EyeShadowInPower;
			float _Tilling;
			float _BlushPower;
			float _MetallicMultiply;
			float _DirtBoots;
			float _SkinPore_Power;
			float _Emissivepowerboost;
			float _EmissivePower1;
			float _Speed;
			float _TattooBoots;
			float _SSSPower;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _SkinColor;
			sampler2D _Mask;
			sampler2D _ExtraMask;
			sampler2D _TattoMask;
			sampler2D _AMS;
			sampler2D _Dirt;
			sampler2D _SkinNormal;
			sampler2D _SkinPore;
			sampler2D _EmissiveMask;
			sampler2D _Pattern;
			sampler2D _RoughnessMod_R;
			sampler2D _ORM;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBRForwardPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

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

				o.ase_texcoord8.xy = v.texcoord.xy;
				o.ase_texcoord8.zw = v.texcoord1.xy;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif
				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 positionVS = TransformWorldToView( positionWS );
				float4 positionCS = TransformWorldToHClip( positionWS );

				VertexNormalInputs normalInput = GetVertexNormalInputs( v.ase_normal, v.ase_tangent );

				o.tSpace0 = float4( normalInput.normalWS, positionWS.x);
				o.tSpace1 = float4( normalInput.tangentWS, positionWS.y);
				o.tSpace2 = float4( normalInput.bitangentWS, positionWS.z);

				#if defined(LIGHTMAP_ON)
					OUTPUT_LIGHTMAP_UV( v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy );
				#endif

				#if !defined(LIGHTMAP_ON)
					OUTPUT_SH( normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz );
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					o.dynamicLightmapUV.xy = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord;
					o.lightmapUVOrVertexSH.xy = v.texcoord * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( positionWS, normalInput.normalWS );

				#ifdef ASE_FOG
					half fogFactor = ComputeFogFactor( positionCS.z );
				#else
					half fogFactor = 0;
				#endif

				o.fogFactorAndVertexLight = half4(fogFactor, vertexLight);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = positionCS;

				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
					o.screenPos = ComputeScreenPos(positionCS);
				#endif

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
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
				o.ase_tangent = v.ase_tangent;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				
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
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				
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

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
				#define ASE_SV_DEPTH SV_DepthLessEqual
			#else
				#define ASE_SV_DEPTH SV_Depth
			#endif

			half4 frag ( VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						#ifdef _WRITE_RENDERING_LAYERS
						, out float4 outRenderingLayers : SV_Target1
						#endif
						 ) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.clipPos );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (IN.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					float3 WorldNormal = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					float3 WorldTangent = -cross(GetObjectToWorldMatrix()._13_23_33, WorldNormal);
					float3 WorldBiTangent = cross(WorldNormal, -WorldTangent);
				#else
					float3 WorldNormal = normalize( IN.tSpace0.xyz );
					float3 WorldTangent = IN.tSpace1.xyz;
					float3 WorldBiTangent = IN.tSpace2.xyz;
				#endif

				float3 WorldPosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldViewDirection = _WorldSpaceCameraPos.xyz  - WorldPosition;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
					float4 ScreenPos = IN.screenPos;
				#endif

				float2 NormalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(IN.clipPos);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#endif

				WorldViewDirection = SafeNormalize( WorldViewDirection );

				float4 saferPower136 = abs( _BaseColorMul );
				float4 temp_cast_0 = (_ColorPow).xxxx;
				float2 uv_SkinColor = IN.ase_texcoord8.xy * _SkinColor_ST.xy + _SkinColor_ST.zw;
				float4 tex2DNode4 = tex2D( _SkinColor, uv_SkinColor );
				float4 temp_output_137_0 = ( pow( saferPower136 , temp_cast_0 ) * tex2DNode4 );
				float2 uv_Mask = IN.ase_texcoord8.xy * _Mask_ST.xy + _Mask_ST.zw;
				float4 tex2DNode11 = tex2D( _Mask, uv_Mask );
				float4 lerpResult124 = lerp( float4( 0,0,0,0 ) , _FemaleLipsNailIMaleBeardNailsColor , tex2DNode11.r);
				float4 lerpResult125 = lerp( float4( 0,0,0,0 ) , _FreaklesColor , tex2DNode11.g);
				float4 lerpResult126 = lerp( float4( 0,0,0,0 ) , _HairCapColor , tex2DNode11.b);
				float4 temp_output_57_0 = ( lerpResult124 + lerpResult125 + lerpResult126 );
				float temp_output_123_0 = ( ( _FemaleLipsNailIMaleBeardNailsPower * tex2DNode11.r ) + ( _FreaklesColorPower * tex2DNode11.g ) + ( _HairCapColorPower * tex2DNode11.b ) );
				float clampResult165 = clamp( temp_output_123_0 , 0.0 , 1.0 );
				float4 lerpResult140 = lerp( temp_output_137_0 , temp_output_57_0 , clampResult165);
				float2 uv_ExtraMask = IN.ase_texcoord8.xy * _ExtraMask_ST.xy + _ExtraMask_ST.zw;
				float4 tex2DNode223 = tex2D( _ExtraMask, uv_ExtraMask );
				float4 lerpResult220 = lerp( float4( 0,0,0,0 ) , _EyeShadowOutColor , tex2DNode223.r);
				float4 lerpResult219 = lerp( float4( 0,0,0,0 ) , _EyeShadowInColor , tex2DNode223.g);
				float4 lerpResult221 = lerp( float4( 0,0,0,0 ) , _BlushColor , tex2DNode223.b);
				float clampResult226 = clamp( ( ( _EyeShadowOutPower * tex2DNode223.r ) + ( _EyeShadowInPower * tex2DNode223.g ) + ( _BlushPower * tex2DNode223.b ) + temp_output_123_0 ) , 0.0 , 1.0 );
				float4 lerpResult225 = lerp( temp_output_137_0 , ( lerpResult220 + lerpResult219 + lerpResult221 + temp_output_57_0 ) , clampResult226);
				#ifdef _ISEXTRAMAKEUP_ON
				float4 staticSwitch227 = lerpResult225;
				#else
				float4 staticSwitch227 = lerpResult140;
				#endif
				float2 uv_TattoMask = IN.ase_texcoord8.xy * _TattoMask_ST.xy + _TattoMask_ST.zw;
				float4 lerpResult193 = lerp( staticSwitch227 , _TattooColor , ( tex2D( _TattoMask, uv_TattoMask ).r * _TattooBoots ));
				float4 SkinColor248 = ( tex2DNode4 * ( 1.0 - _MetallicMultiply ) );
				float2 uv_AMS = IN.ase_texcoord8.xy * _AMS_ST.xy + _AMS_ST.zw;
				float4 tex2DNode233 = tex2D( _AMS, uv_AMS );
				float AMSAlpha229 = tex2DNode233.r;
				float4 lerpResult246 = lerp( lerpResult193 , SkinColor248 , AMSAlpha229);
				#ifdef _ISCYBORG_ON
				float4 staticSwitch254 = lerpResult246;
				#else
				float4 staticSwitch254 = lerpResult193;
				#endif
				float2 uv_Dirt = IN.ase_texcoord8.xy * _Dirt_ST.xy + _Dirt_ST.zw;
				float4 tex2DNode63 = tex2D( _Dirt, uv_Dirt );
				float4 lerpResult70 = lerp( staticSwitch254 , ( _DirtColor * _DirtBoots ) , ( _DirtBoots * tex2DNode63.r ));
				float4 clampResult194 = clamp( lerpResult70 , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float4 Albedo198 = clampResult194;
				
				float2 uv_SkinNormal = IN.ase_texcoord8.xy * _SkinNormal_ST.xy + _SkinNormal_ST.zw;
				float3 tex2DNode38 = UnpackNormalScale( tex2D( _SkinNormal, uv_SkinNormal ), 1.0f );
				float2 temp_cast_2 = (_SkinPore_Tilling).xx;
				float2 texCoord94 = IN.ase_texcoord8.zw * temp_cast_2 + float2( 0,0 );
				float3 unpack93 = UnpackNormalScale( tex2D( _SkinPore, texCoord94 ), _SkinPore_Power );
				unpack93.z = lerp( 1, unpack93.z, saturate(_SkinPore_Power) );
				#ifdef _ISCYBORG_ON
				float3 staticSwitch255 = tex2DNode38;
				#else
				float3 staticSwitch255 = BlendNormal( tex2DNode38 , unpack93 );
				#endif
				float3 Normal200 = staticSwitch255;
				
				float2 uv_EmissiveMask = IN.ase_texcoord8.xy * _EmissiveMask_ST.xy + _EmissiveMask_ST.zw;
				float4 tex2DNode163 = tex2D( _EmissiveMask, uv_EmissiveMask );
				float2 texCoord291 = IN.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float mulTime270 = _TimeParameters.x * _TimeScale;
				float temp_output_269_0 = ( _Speed * mulTime270 );
				float4 _SpeedConstant = float4(1,-2,2,-1);
				float2 temp_cast_3 = (_SpeedConstant.x).xx;
				float2 texCoord281 = IN.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float4 appendResult286 = (float4(_UTilling , _VTilling , 0.0 , 0.0));
				float4 temp_output_287_0 = ( float4( ( texCoord281 * _Tilling ), 0.0 , 0.0 ) * appendResult286 );
				float2 panner265 = ( temp_output_269_0 * temp_cast_3 + temp_output_287_0.xy);
				float2 panner266 = ( temp_output_269_0 * _SpeedConstant.xy + ( temp_output_287_0 + 0.418 ).xy);
				float4 _SpeedConstant1 = float4(1,0,2,-1);
				float2 temp_cast_9 = (_SpeedConstant1.w).xx;
				float2 panner267 = ( temp_output_269_0 * temp_cast_9 + ( temp_output_287_0 + 8.9 ).xy);
				float2 panner268 = ( temp_output_269_0 * _SpeedConstant1.xy + ( temp_output_287_0 + 0.65 ).xy);
				float simplePerlin2D292 = snoise( ( texCoord291 + (( ( ( tex2D( _Pattern, panner265 ) + tex2D( _Pattern, panner266 ) ) + ( tex2D( _Pattern, panner267 ) + tex2D( _Pattern, panner268 ) ) ) * _Divisor )).r ) );
				simplePerlin2D292 = simplePerlin2D292*0.5 + 0.5;
				float clampResult304 = clamp( ( pow( sin( frac( ( simplePerlin2D292 * _Number ) ) ) , _Pow ) * _Multi ) , 0.0 , 1.0 );
				#ifdef _ISBASICEMMISION_ON
				float staticSwitch312 = 1.0;
				#else
				float staticSwitch312 = clampResult304;
				#endif
				float4 Emmision202 = ( _Emissivepowerboost * ( ( _EmissiveColor1 * _EmissivePower1 * tex2DNode163.r * staticSwitch312 ) + ( _EmissiveColor2 * _EmissivePower2 * tex2DNode163.g * staticSwitch312 ) + ( _EmissiveColor3 * _EmissivePower3 * tex2DNode163.b * staticSwitch312 ) ) );
				
				float lerpResult231 = lerp( 0.0 , tex2DNode233.b , tex2DNode233.r);
				#ifdef _ISCYBORG_ON
				float staticSwitch234 = lerpResult231;
				#else
				float staticSwitch234 = 0.0;
				#endif
				float Mettalic235 = staticSwitch234;
				
				float2 uv_RoughnessMod_R = IN.ase_texcoord8.xy * _RoughnessMod_R_ST.xy + _RoughnessMod_R_ST.zw;
				float2 uv_ORM = IN.ase_texcoord8.xy * _ORM_ST.xy + _ORM_ST.zw;
				float4 tex2DNode179 = tex2D( _ORM, uv_ORM );
				float lerpResult71 = lerp( ( ( _SkinRounghnessBoots * tex2D( _RoughnessMod_R, uv_RoughnessMod_R ).a ) * tex2DNode179.g ) , ( _DirtRoughness_Power * _DirtBoots ) , ( _DirtBoots * tex2DNode63.r ));
				float lerpResult170 = lerp( lerpResult71 , _HairCapRoughness , tex2DNode11.b);
				float lerpResult141 = lerp( lerpResult170 , _FemaleLipsNailIMaleBeardNailsRoughnessBoost , tex2DNode11.r);
				float clampResult171 = clamp( lerpResult141 , 0.0 , 1.0 );
				float lerpResult257 = lerp( clampResult171 , tex2DNode179.g , AMSAlpha229);
				#ifdef _ISCYBORG_ON
				float staticSwitch256 = lerpResult257;
				#else
				float staticSwitch256 = clampResult171;
				#endif
				float Smoothness204 = staticSwitch256;
				
				float AO206 = tex2DNode179.r;
				
				float4 temp_output_183_0 = ( _SSSColor * ( 1.0 - tex2DNode179.b ) );
				float4 temp_cast_16 = (0.0).xxxx;
				float4 lerpResult237 = lerp( temp_output_183_0 , temp_cast_16 , AMSAlpha229);
				#ifdef _ISCYBORG_ON
				float4 staticSwitch239 = lerpResult237;
				#else
				float4 staticSwitch239 = temp_output_183_0;
				#endif
				float4 Transmission208 = staticSwitch239;
				
				float3 temp_cast_18 = (_SSSPower).xxx;
				

				float3 BaseColor = Albedo198.rgb;
				float3 Normal = Normal200;
				float3 Emission = Emmision202.rgb;
				float3 Specular = 0.5;
				float Metallic = Mettalic235;
				float Smoothness = Smoothness204;
				float Occlusion = AO206;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = Transmission208.rgb;
				float3 Translucency = temp_cast_18;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = 0;
				#endif

				#ifdef _CLEARCOAT
					float CoatMask = 0;
					float CoatSmoothness = 0;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData = (InputData)0;
				inputData.positionWS = WorldPosition;
				inputData.viewDirectionWS = WorldViewDirection;

				#ifdef _NORMALMAP
						#if _NORMAL_DROPOFF_TS
							inputData.normalWS = TransformTangentToWorld(Normal, half3x3(WorldTangent, WorldBiTangent, WorldNormal));
						#elif _NORMAL_DROPOFF_OS
							inputData.normalWS = TransformObjectToWorldNormal(Normal);
						#elif _NORMAL_DROPOFF_WS
							inputData.normalWS = Normal;
						#endif
					inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				#else
					inputData.normalWS = WorldNormal;
				#endif

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					inputData.shadowCoord = ShadowCoords;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					inputData.shadowCoord = TransformWorldToShadowCoord(inputData.positionWS);
				#else
					inputData.shadowCoord = float4(0, 0, 0, 0);
				#endif

				#ifdef ASE_FOG
					inputData.fogCoord = IN.fogFactorAndVertexLight.x;
				#endif
					inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					inputData.bakedGI = SAMPLE_GI(IN.lightmapUVOrVertexSH.xy, IN.dynamicLightmapUV.xy, SH, inputData.normalWS);
				#else
					inputData.bakedGI = SAMPLE_GI(IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS);
				#endif

				#ifdef ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#endif

				inputData.normalizedScreenSpaceUV = NormalizedScreenSpaceUV;
				inputData.shadowMask = SAMPLE_SHADOWMASK(IN.lightmapUVOrVertexSH.xy);

				#if defined(DEBUG_DISPLAY)
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.dynamicLightmapUV = IN.dynamicLightmapUV.xy;
					#endif
					#if defined(LIGHTMAP_ON)
						inputData.staticLightmapUV = IN.lightmapUVOrVertexSH.xy;
					#else
						inputData.vertexSH = SH;
					#endif
				#endif

				SurfaceData surfaceData;
				surfaceData.albedo              = BaseColor;
				surfaceData.metallic            = saturate(Metallic);
				surfaceData.specular            = Specular;
				surfaceData.smoothness          = saturate(Smoothness),
				surfaceData.occlusion           = Occlusion,
				surfaceData.emission            = Emission,
				surfaceData.alpha               = saturate(Alpha);
				surfaceData.normalTS            = Normal;
				surfaceData.clearCoatMask       = 0;
				surfaceData.clearCoatSmoothness = 1;

				#ifdef _CLEARCOAT
					surfaceData.clearCoatMask       = saturate(CoatMask);
					surfaceData.clearCoatSmoothness = saturate(CoatSmoothness);
				#endif

				#ifdef _DBUFFER
					ApplyDecalToSurfaceData(IN.clipPos, surfaceData, inputData);
				#endif

				half4 color = UniversalFragmentPBR( inputData, surfaceData);

				#ifdef ASE_TRANSMISSION
				{
					float shadow = _TransmissionShadow;

					#define SUM_LIGHT_TRANSMISSION(Light)\
						float3 atten = Light.color * Light.distanceAttenuation;\
						atten = lerp( atten, atten * Light.shadowAttenuation, shadow );\
						half3 transmission = max( 0, -dot( inputData.normalWS, Light.direction ) ) * atten * Transmission;\
						color.rgb += BaseColor * transmission;

					SUM_LIGHT_TRANSMISSION( GetMainLight( inputData.shadowCoord ) );

					#if defined(_ADDITIONAL_LIGHTS)
						uint meshRenderingLayers = GetMeshRenderingLayer();
						uint pixelLightCount = GetAdditionalLightsCount();
						#if USE_FORWARD_PLUS
							for (uint lightIndex = 0; lightIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); lightIndex++)
							{
								FORWARD_PLUS_SUBTRACTIVE_LIGHT_CHECK

								Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
								#ifdef _LIGHT_LAYERS
								if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
								#endif
								{
									SUM_LIGHT_TRANSMISSION( light );
								}
							}
						#endif
						LIGHT_LOOP_BEGIN( pixelLightCount )
							Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
							#ifdef _LIGHT_LAYERS
							if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
							#endif
							{
								SUM_LIGHT_TRANSMISSION( light );
							}
						LIGHT_LOOP_END
					#endif
				}
				#endif

				#ifdef ASE_TRANSLUCENCY
				{
					float shadow = _TransShadow;
					float normal = _TransNormal;
					float scattering = _TransScattering;
					float direct = _TransDirect;
					float ambient = _TransAmbient;
					float strength = _TransStrength;

					#define SUM_LIGHT_TRANSLUCENCY(Light)\
						float3 atten = Light.color * Light.distanceAttenuation;\
						atten = lerp( atten, atten * Light.shadowAttenuation, shadow );\
						half3 lightDir = Light.direction + inputData.normalWS * normal;\
						half VdotL = pow( saturate( dot( inputData.viewDirectionWS, -lightDir ) ), scattering );\
						half3 translucency = atten * ( VdotL * direct + inputData.bakedGI * ambient ) * Translucency;\
						color.rgb += BaseColor * translucency * strength;

					SUM_LIGHT_TRANSLUCENCY( GetMainLight( inputData.shadowCoord ) );

					#if defined(_ADDITIONAL_LIGHTS)
						uint meshRenderingLayers = GetMeshRenderingLayer();
						uint pixelLightCount = GetAdditionalLightsCount();
						#if USE_FORWARD_PLUS
							for (uint lightIndex = 0; lightIndex < min(URP_FP_DIRECTIONAL_LIGHTS_COUNT, MAX_VISIBLE_LIGHTS); lightIndex++)
							{
								FORWARD_PLUS_SUBTRACTIVE_LIGHT_CHECK

								Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
								#ifdef _LIGHT_LAYERS
								if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
								#endif
								{
									SUM_LIGHT_TRANSLUCENCY( light );
								}
							}
						#endif
						LIGHT_LOOP_BEGIN( pixelLightCount )
							Light light = GetAdditionalLight(lightIndex, inputData.positionWS);
							#ifdef _LIGHT_LAYERS
							if (IsMatchingLightLayer(light.layerMask, meshRenderingLayers))
							#endif
							{
								SUM_LIGHT_TRANSLUCENCY( light );
							}
						LIGHT_LOOP_END
					#endif
				}
				#endif

				#ifdef ASE_REFRACTION
					float4 projScreenPos = ScreenPos / ScreenPos.w;
					float3 refractionOffset = ( RefractionIndex - 1.0 ) * mul( UNITY_MATRIX_V, float4( WorldNormal,0 ) ).xyz * ( 1.0 - dot( WorldNormal, WorldViewDirection ) );
					projScreenPos.xy += refractionOffset.xy;
					float3 refraction = SHADERGRAPH_SAMPLE_SCENE_COLOR( projScreenPos.xy ) * RefractionColor;
					color.rgb = lerp( refraction, color.rgb, color.a );
					color.a = 1;
				#endif

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_FOG
					#ifdef TERRAIN_SPLAT_ADDPASS
						color.rgb = MixFogColor(color.rgb, half3( 0, 0, 0 ), IN.fogFactorAndVertexLight.x );
					#else
						color.rgb = MixFog(color.rgb, IN.fogFactorAndVertexLight.x);
					#endif
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4( EncodeMeshRenderingLayer( renderingLayers ), 0, 0, 0 );
				#endif

				return color;
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

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
			#pragma multi_compile_instancing
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140007


			#pragma vertex vert
			#pragma fragment frag

			#pragma multi_compile_vertex _ _CASTING_PUNCTUAL_LIGHT_SHADOW

			#define SHADERPASS SHADERPASS_SHADOWCASTER

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"

			

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				
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
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _BaseColorMul;
			float4 _EmissiveMask_ST;
			float4 _EmissiveColor1;
			float4 _SSSColor;
			float4 _SkinNormal_ST;
			float4 _Dirt_ST;
			float4 _EmissiveColor2;
			float4 _DirtColor;
			float4 _AMS_ST;
			float4 _EmissiveColor3;
			float4 _TattoMask_ST;
			float4 _RoughnessMod_R_ST;
			float4 _BlushColor;
			float4 _TattooColor;
			float4 _ExtraMask_ST;
			float4 _SkinColor_ST;
			float4 _FemaleLipsNailIMaleBeardNailsColor;
			float4 _Mask_ST;
			float4 _EyeShadowInColor;
			float4 _HairCapColor;
			float4 _FreaklesColor;
			float4 _ORM_ST;
			float4 _EyeShadowOutColor;
			float _DirtRoughness_Power;
			float _HairCapRoughness;
			float _VTilling;
			float _EmissivePower3;
			float _Multi;
			float _Pow;
			float _SkinRounghnessBoots;
			float _Number;
			float _FemaleLipsNailIMaleBeardNailsRoughnessBoost;
			float _Divisor;
			float _EmissivePower2;
			float _UTilling;
			float _SkinPore_Tilling;
			float _TimeScale;
			float _ColorPow;
			float _FemaleLipsNailIMaleBeardNailsPower;
			float _FreaklesColorPower;
			float _HairCapColorPower;
			float _EyeShadowOutPower;
			float _EyeShadowInPower;
			float _Tilling;
			float _BlushPower;
			float _MetallicMultiply;
			float _DirtBoots;
			float _SkinPore_Power;
			float _Emissivepowerboost;
			float _EmissivePower1;
			float _Speed;
			float _TattooBoots;
			float _SSSPower;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			

			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShadowCasterPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			
			float3 _LightDirection;
			float3 _LightPosition;

			VertexOutput VertexFunction( VertexInput v )
			{
				VertexOutput o;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;
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

				float3 normalWS = TransformObjectToWorldDir(v.ase_normal);

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

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
				#define ASE_SV_DEPTH SV_DepthLessEqual
			#else
				#define ASE_SV_DEPTH SV_Depth
			#endif

			half4 frag(	VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
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

				

				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = 0;
				#endif

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

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
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

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
			#pragma multi_compile_instancing
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140007


			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
			
			

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				
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
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _BaseColorMul;
			float4 _EmissiveMask_ST;
			float4 _EmissiveColor1;
			float4 _SSSColor;
			float4 _SkinNormal_ST;
			float4 _Dirt_ST;
			float4 _EmissiveColor2;
			float4 _DirtColor;
			float4 _AMS_ST;
			float4 _EmissiveColor3;
			float4 _TattoMask_ST;
			float4 _RoughnessMod_R_ST;
			float4 _BlushColor;
			float4 _TattooColor;
			float4 _ExtraMask_ST;
			float4 _SkinColor_ST;
			float4 _FemaleLipsNailIMaleBeardNailsColor;
			float4 _Mask_ST;
			float4 _EyeShadowInColor;
			float4 _HairCapColor;
			float4 _FreaklesColor;
			float4 _ORM_ST;
			float4 _EyeShadowOutColor;
			float _DirtRoughness_Power;
			float _HairCapRoughness;
			float _VTilling;
			float _EmissivePower3;
			float _Multi;
			float _Pow;
			float _SkinRounghnessBoots;
			float _Number;
			float _FemaleLipsNailIMaleBeardNailsRoughnessBoost;
			float _Divisor;
			float _EmissivePower2;
			float _UTilling;
			float _SkinPore_Tilling;
			float _TimeScale;
			float _ColorPow;
			float _FemaleLipsNailIMaleBeardNailsPower;
			float _FreaklesColorPower;
			float _HairCapColorPower;
			float _EyeShadowOutPower;
			float _EyeShadowInPower;
			float _Tilling;
			float _BlushPower;
			float _MetallicMultiply;
			float _DirtBoots;
			float _SkinPore_Power;
			float _Emissivepowerboost;
			float _EmissivePower1;
			float _Speed;
			float _TattooBoots;
			float _SSSPower;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			

			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/DepthOnlyPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

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

				o.clipPos = positionCS;

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				
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

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
				#define ASE_SV_DEPTH SV_DepthLessEqual
			#else
				#define ASE_SV_DEPTH SV_Depth
			#endif

			half4 frag(	VertexOutput IN
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						 ) : SV_TARGET
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

				

				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = 0;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.clipPos );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return 0;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Meta"
			Tags { "LightMode"="Meta" }

			Cull Off

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140007


			#pragma vertex vert
			#pragma fragment frag

			#pragma shader_feature EDITOR_VISUALIZATION

			#define SHADERPASS SHADERPASS_META

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/MetaInput.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#pragma shader_feature_local _ISCYBORG_ON
			#pragma shader_feature_local _ISEXTRAMAKEUP_ON
			#pragma shader_feature_local _ISBASICEMMISION_ON


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
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
				#ifdef EDITOR_VISUALIZATION
					float4 VizUV : TEXCOORD2;
					float4 LightCoord : TEXCOORD3;
				#endif
				float4 ase_texcoord4 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _BaseColorMul;
			float4 _EmissiveMask_ST;
			float4 _EmissiveColor1;
			float4 _SSSColor;
			float4 _SkinNormal_ST;
			float4 _Dirt_ST;
			float4 _EmissiveColor2;
			float4 _DirtColor;
			float4 _AMS_ST;
			float4 _EmissiveColor3;
			float4 _TattoMask_ST;
			float4 _RoughnessMod_R_ST;
			float4 _BlushColor;
			float4 _TattooColor;
			float4 _ExtraMask_ST;
			float4 _SkinColor_ST;
			float4 _FemaleLipsNailIMaleBeardNailsColor;
			float4 _Mask_ST;
			float4 _EyeShadowInColor;
			float4 _HairCapColor;
			float4 _FreaklesColor;
			float4 _ORM_ST;
			float4 _EyeShadowOutColor;
			float _DirtRoughness_Power;
			float _HairCapRoughness;
			float _VTilling;
			float _EmissivePower3;
			float _Multi;
			float _Pow;
			float _SkinRounghnessBoots;
			float _Number;
			float _FemaleLipsNailIMaleBeardNailsRoughnessBoost;
			float _Divisor;
			float _EmissivePower2;
			float _UTilling;
			float _SkinPore_Tilling;
			float _TimeScale;
			float _ColorPow;
			float _FemaleLipsNailIMaleBeardNailsPower;
			float _FreaklesColorPower;
			float _HairCapColorPower;
			float _EyeShadowOutPower;
			float _EyeShadowInPower;
			float _Tilling;
			float _BlushPower;
			float _MetallicMultiply;
			float _DirtBoots;
			float _SkinPore_Power;
			float _Emissivepowerboost;
			float _EmissivePower1;
			float _Speed;
			float _TattooBoots;
			float _SSSPower;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _SkinColor;
			sampler2D _Mask;
			sampler2D _ExtraMask;
			sampler2D _TattoMask;
			sampler2D _AMS;
			sampler2D _Dirt;
			sampler2D _EmissiveMask;
			sampler2D _Pattern;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/LightingMetaPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

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

				o.ase_texcoord4.xy = v.texcoord0.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord4.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

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

				o.clipPos = MetaVertexPosition( v.vertex, v.texcoord1.xy, v.texcoord1.xy, unity_LightmapST, unity_DynamicLightmapST );

				#ifdef EDITOR_VISUALIZATION
					float2 VizUV = 0;
					float4 LightCoord = 0;
					UnityEditorVizData(v.vertex.xyz, v.texcoord0.xy, v.texcoord1.xy, v.texcoord2.xy, VizUV, LightCoord);
					o.VizUV = float4(VizUV, 0, 0);
					o.LightCoord = LightCoord;
				#endif

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
				float4 texcoord0 : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
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
				o.texcoord0 = v.texcoord0;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				
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
				o.texcoord0 = patch[0].texcoord0 * bary.x + patch[1].texcoord0 * bary.y + patch[2].texcoord0 * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				
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

			half4 frag(VertexOutput IN  ) : SV_TARGET
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

				float4 saferPower136 = abs( _BaseColorMul );
				float4 temp_cast_0 = (_ColorPow).xxxx;
				float2 uv_SkinColor = IN.ase_texcoord4.xy * _SkinColor_ST.xy + _SkinColor_ST.zw;
				float4 tex2DNode4 = tex2D( _SkinColor, uv_SkinColor );
				float4 temp_output_137_0 = ( pow( saferPower136 , temp_cast_0 ) * tex2DNode4 );
				float2 uv_Mask = IN.ase_texcoord4.xy * _Mask_ST.xy + _Mask_ST.zw;
				float4 tex2DNode11 = tex2D( _Mask, uv_Mask );
				float4 lerpResult124 = lerp( float4( 0,0,0,0 ) , _FemaleLipsNailIMaleBeardNailsColor , tex2DNode11.r);
				float4 lerpResult125 = lerp( float4( 0,0,0,0 ) , _FreaklesColor , tex2DNode11.g);
				float4 lerpResult126 = lerp( float4( 0,0,0,0 ) , _HairCapColor , tex2DNode11.b);
				float4 temp_output_57_0 = ( lerpResult124 + lerpResult125 + lerpResult126 );
				float temp_output_123_0 = ( ( _FemaleLipsNailIMaleBeardNailsPower * tex2DNode11.r ) + ( _FreaklesColorPower * tex2DNode11.g ) + ( _HairCapColorPower * tex2DNode11.b ) );
				float clampResult165 = clamp( temp_output_123_0 , 0.0 , 1.0 );
				float4 lerpResult140 = lerp( temp_output_137_0 , temp_output_57_0 , clampResult165);
				float2 uv_ExtraMask = IN.ase_texcoord4.xy * _ExtraMask_ST.xy + _ExtraMask_ST.zw;
				float4 tex2DNode223 = tex2D( _ExtraMask, uv_ExtraMask );
				float4 lerpResult220 = lerp( float4( 0,0,0,0 ) , _EyeShadowOutColor , tex2DNode223.r);
				float4 lerpResult219 = lerp( float4( 0,0,0,0 ) , _EyeShadowInColor , tex2DNode223.g);
				float4 lerpResult221 = lerp( float4( 0,0,0,0 ) , _BlushColor , tex2DNode223.b);
				float clampResult226 = clamp( ( ( _EyeShadowOutPower * tex2DNode223.r ) + ( _EyeShadowInPower * tex2DNode223.g ) + ( _BlushPower * tex2DNode223.b ) + temp_output_123_0 ) , 0.0 , 1.0 );
				float4 lerpResult225 = lerp( temp_output_137_0 , ( lerpResult220 + lerpResult219 + lerpResult221 + temp_output_57_0 ) , clampResult226);
				#ifdef _ISEXTRAMAKEUP_ON
				float4 staticSwitch227 = lerpResult225;
				#else
				float4 staticSwitch227 = lerpResult140;
				#endif
				float2 uv_TattoMask = IN.ase_texcoord4.xy * _TattoMask_ST.xy + _TattoMask_ST.zw;
				float4 lerpResult193 = lerp( staticSwitch227 , _TattooColor , ( tex2D( _TattoMask, uv_TattoMask ).r * _TattooBoots ));
				float4 SkinColor248 = ( tex2DNode4 * ( 1.0 - _MetallicMultiply ) );
				float2 uv_AMS = IN.ase_texcoord4.xy * _AMS_ST.xy + _AMS_ST.zw;
				float4 tex2DNode233 = tex2D( _AMS, uv_AMS );
				float AMSAlpha229 = tex2DNode233.r;
				float4 lerpResult246 = lerp( lerpResult193 , SkinColor248 , AMSAlpha229);
				#ifdef _ISCYBORG_ON
				float4 staticSwitch254 = lerpResult246;
				#else
				float4 staticSwitch254 = lerpResult193;
				#endif
				float2 uv_Dirt = IN.ase_texcoord4.xy * _Dirt_ST.xy + _Dirt_ST.zw;
				float4 tex2DNode63 = tex2D( _Dirt, uv_Dirt );
				float4 lerpResult70 = lerp( staticSwitch254 , ( _DirtColor * _DirtBoots ) , ( _DirtBoots * tex2DNode63.r ));
				float4 clampResult194 = clamp( lerpResult70 , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float4 Albedo198 = clampResult194;
				
				float2 uv_EmissiveMask = IN.ase_texcoord4.xy * _EmissiveMask_ST.xy + _EmissiveMask_ST.zw;
				float4 tex2DNode163 = tex2D( _EmissiveMask, uv_EmissiveMask );
				float2 texCoord291 = IN.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float mulTime270 = _TimeParameters.x * _TimeScale;
				float temp_output_269_0 = ( _Speed * mulTime270 );
				float4 _SpeedConstant = float4(1,-2,2,-1);
				float2 temp_cast_2 = (_SpeedConstant.x).xx;
				float2 texCoord281 = IN.ase_texcoord4.xy * float2( 1,1 ) + float2( 0,0 );
				float4 appendResult286 = (float4(_UTilling , _VTilling , 0.0 , 0.0));
				float4 temp_output_287_0 = ( float4( ( texCoord281 * _Tilling ), 0.0 , 0.0 ) * appendResult286 );
				float2 panner265 = ( temp_output_269_0 * temp_cast_2 + temp_output_287_0.xy);
				float2 panner266 = ( temp_output_269_0 * _SpeedConstant.xy + ( temp_output_287_0 + 0.418 ).xy);
				float4 _SpeedConstant1 = float4(1,0,2,-1);
				float2 temp_cast_8 = (_SpeedConstant1.w).xx;
				float2 panner267 = ( temp_output_269_0 * temp_cast_8 + ( temp_output_287_0 + 8.9 ).xy);
				float2 panner268 = ( temp_output_269_0 * _SpeedConstant1.xy + ( temp_output_287_0 + 0.65 ).xy);
				float simplePerlin2D292 = snoise( ( texCoord291 + (( ( ( tex2D( _Pattern, panner265 ) + tex2D( _Pattern, panner266 ) ) + ( tex2D( _Pattern, panner267 ) + tex2D( _Pattern, panner268 ) ) ) * _Divisor )).r ) );
				simplePerlin2D292 = simplePerlin2D292*0.5 + 0.5;
				float clampResult304 = clamp( ( pow( sin( frac( ( simplePerlin2D292 * _Number ) ) ) , _Pow ) * _Multi ) , 0.0 , 1.0 );
				#ifdef _ISBASICEMMISION_ON
				float staticSwitch312 = 1.0;
				#else
				float staticSwitch312 = clampResult304;
				#endif
				float4 Emmision202 = ( _Emissivepowerboost * ( ( _EmissiveColor1 * _EmissivePower1 * tex2DNode163.r * staticSwitch312 ) + ( _EmissiveColor2 * _EmissivePower2 * tex2DNode163.g * staticSwitch312 ) + ( _EmissiveColor3 * _EmissivePower3 * tex2DNode163.b * staticSwitch312 ) ) );
				

				float3 BaseColor = Albedo198.rgb;
				float3 Emission = Emmision202.rgb;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				MetaInput metaInput = (MetaInput)0;
				metaInput.Albedo = BaseColor;
				metaInput.Emission = Emission;
				#ifdef EDITOR_VISUALIZATION
					metaInput.VizUV = IN.VizUV.xy;
					metaInput.LightCoord = IN.LightCoord;
				#endif

				return UnityMetaFragment(metaInput);
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "Universal2D"
			Tags { "LightMode"="Universal2D" }

			Blend One Zero, One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140007


			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_2D

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			#pragma shader_feature_local _ISCYBORG_ON
			#pragma shader_feature_local _ISEXTRAMAKEUP_ON


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
			float4 _BaseColorMul;
			float4 _EmissiveMask_ST;
			float4 _EmissiveColor1;
			float4 _SSSColor;
			float4 _SkinNormal_ST;
			float4 _Dirt_ST;
			float4 _EmissiveColor2;
			float4 _DirtColor;
			float4 _AMS_ST;
			float4 _EmissiveColor3;
			float4 _TattoMask_ST;
			float4 _RoughnessMod_R_ST;
			float4 _BlushColor;
			float4 _TattooColor;
			float4 _ExtraMask_ST;
			float4 _SkinColor_ST;
			float4 _FemaleLipsNailIMaleBeardNailsColor;
			float4 _Mask_ST;
			float4 _EyeShadowInColor;
			float4 _HairCapColor;
			float4 _FreaklesColor;
			float4 _ORM_ST;
			float4 _EyeShadowOutColor;
			float _DirtRoughness_Power;
			float _HairCapRoughness;
			float _VTilling;
			float _EmissivePower3;
			float _Multi;
			float _Pow;
			float _SkinRounghnessBoots;
			float _Number;
			float _FemaleLipsNailIMaleBeardNailsRoughnessBoost;
			float _Divisor;
			float _EmissivePower2;
			float _UTilling;
			float _SkinPore_Tilling;
			float _TimeScale;
			float _ColorPow;
			float _FemaleLipsNailIMaleBeardNailsPower;
			float _FreaklesColorPower;
			float _HairCapColorPower;
			float _EyeShadowOutPower;
			float _EyeShadowInPower;
			float _Tilling;
			float _BlushPower;
			float _MetallicMultiply;
			float _DirtBoots;
			float _SkinPore_Power;
			float _Emissivepowerboost;
			float _EmissivePower1;
			float _Speed;
			float _TattooBoots;
			float _SSSPower;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _SkinColor;
			sampler2D _Mask;
			sampler2D _ExtraMask;
			sampler2D _TattoMask;
			sampler2D _AMS;
			sampler2D _Dirt;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBR2DPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );

				o.ase_texcoord2.xy = v.ase_texcoord.xy;
				
				//setting value to unused interpolator channels and avoid initialization warnings
				o.ase_texcoord2.zw = 0;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

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

			half4 frag(VertexOutput IN  ) : SV_TARGET
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

				float4 saferPower136 = abs( _BaseColorMul );
				float4 temp_cast_0 = (_ColorPow).xxxx;
				float2 uv_SkinColor = IN.ase_texcoord2.xy * _SkinColor_ST.xy + _SkinColor_ST.zw;
				float4 tex2DNode4 = tex2D( _SkinColor, uv_SkinColor );
				float4 temp_output_137_0 = ( pow( saferPower136 , temp_cast_0 ) * tex2DNode4 );
				float2 uv_Mask = IN.ase_texcoord2.xy * _Mask_ST.xy + _Mask_ST.zw;
				float4 tex2DNode11 = tex2D( _Mask, uv_Mask );
				float4 lerpResult124 = lerp( float4( 0,0,0,0 ) , _FemaleLipsNailIMaleBeardNailsColor , tex2DNode11.r);
				float4 lerpResult125 = lerp( float4( 0,0,0,0 ) , _FreaklesColor , tex2DNode11.g);
				float4 lerpResult126 = lerp( float4( 0,0,0,0 ) , _HairCapColor , tex2DNode11.b);
				float4 temp_output_57_0 = ( lerpResult124 + lerpResult125 + lerpResult126 );
				float temp_output_123_0 = ( ( _FemaleLipsNailIMaleBeardNailsPower * tex2DNode11.r ) + ( _FreaklesColorPower * tex2DNode11.g ) + ( _HairCapColorPower * tex2DNode11.b ) );
				float clampResult165 = clamp( temp_output_123_0 , 0.0 , 1.0 );
				float4 lerpResult140 = lerp( temp_output_137_0 , temp_output_57_0 , clampResult165);
				float2 uv_ExtraMask = IN.ase_texcoord2.xy * _ExtraMask_ST.xy + _ExtraMask_ST.zw;
				float4 tex2DNode223 = tex2D( _ExtraMask, uv_ExtraMask );
				float4 lerpResult220 = lerp( float4( 0,0,0,0 ) , _EyeShadowOutColor , tex2DNode223.r);
				float4 lerpResult219 = lerp( float4( 0,0,0,0 ) , _EyeShadowInColor , tex2DNode223.g);
				float4 lerpResult221 = lerp( float4( 0,0,0,0 ) , _BlushColor , tex2DNode223.b);
				float clampResult226 = clamp( ( ( _EyeShadowOutPower * tex2DNode223.r ) + ( _EyeShadowInPower * tex2DNode223.g ) + ( _BlushPower * tex2DNode223.b ) + temp_output_123_0 ) , 0.0 , 1.0 );
				float4 lerpResult225 = lerp( temp_output_137_0 , ( lerpResult220 + lerpResult219 + lerpResult221 + temp_output_57_0 ) , clampResult226);
				#ifdef _ISEXTRAMAKEUP_ON
				float4 staticSwitch227 = lerpResult225;
				#else
				float4 staticSwitch227 = lerpResult140;
				#endif
				float2 uv_TattoMask = IN.ase_texcoord2.xy * _TattoMask_ST.xy + _TattoMask_ST.zw;
				float4 lerpResult193 = lerp( staticSwitch227 , _TattooColor , ( tex2D( _TattoMask, uv_TattoMask ).r * _TattooBoots ));
				float4 SkinColor248 = ( tex2DNode4 * ( 1.0 - _MetallicMultiply ) );
				float2 uv_AMS = IN.ase_texcoord2.xy * _AMS_ST.xy + _AMS_ST.zw;
				float4 tex2DNode233 = tex2D( _AMS, uv_AMS );
				float AMSAlpha229 = tex2DNode233.r;
				float4 lerpResult246 = lerp( lerpResult193 , SkinColor248 , AMSAlpha229);
				#ifdef _ISCYBORG_ON
				float4 staticSwitch254 = lerpResult246;
				#else
				float4 staticSwitch254 = lerpResult193;
				#endif
				float2 uv_Dirt = IN.ase_texcoord2.xy * _Dirt_ST.xy + _Dirt_ST.zw;
				float4 tex2DNode63 = tex2D( _Dirt, uv_Dirt );
				float4 lerpResult70 = lerp( staticSwitch254 , ( _DirtColor * _DirtBoots ) , ( _DirtBoots * tex2DNode63.r ));
				float4 clampResult194 = clamp( lerpResult70 , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float4 Albedo198 = clampResult194;
				

				float3 BaseColor = Albedo198.rgb;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;

				half4 color = half4(BaseColor, Alpha );

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				return color;
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "DepthNormals"
			Tags { "LightMode"="DepthNormals" }

			ZWrite On
			Blend One Zero
			ZTest LEqual
			ZWrite On

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
			#pragma multi_compile_instancing
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140007


			#pragma vertex vert
			#pragma fragment frag

			#pragma multi_compile_fragment _ _WRITE_RENDERING_LAYERS

			#define SHADERPASS SHADERPASS_DEPTHNORMALSONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"

			#pragma shader_feature_local _ISCYBORG_ON


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;
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
				float3 worldNormal : TEXCOORD2;
				float4 worldTangent : TEXCOORD3;
				float4 ase_texcoord4 : TEXCOORD4;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _BaseColorMul;
			float4 _EmissiveMask_ST;
			float4 _EmissiveColor1;
			float4 _SSSColor;
			float4 _SkinNormal_ST;
			float4 _Dirt_ST;
			float4 _EmissiveColor2;
			float4 _DirtColor;
			float4 _AMS_ST;
			float4 _EmissiveColor3;
			float4 _TattoMask_ST;
			float4 _RoughnessMod_R_ST;
			float4 _BlushColor;
			float4 _TattooColor;
			float4 _ExtraMask_ST;
			float4 _SkinColor_ST;
			float4 _FemaleLipsNailIMaleBeardNailsColor;
			float4 _Mask_ST;
			float4 _EyeShadowInColor;
			float4 _HairCapColor;
			float4 _FreaklesColor;
			float4 _ORM_ST;
			float4 _EyeShadowOutColor;
			float _DirtRoughness_Power;
			float _HairCapRoughness;
			float _VTilling;
			float _EmissivePower3;
			float _Multi;
			float _Pow;
			float _SkinRounghnessBoots;
			float _Number;
			float _FemaleLipsNailIMaleBeardNailsRoughnessBoost;
			float _Divisor;
			float _EmissivePower2;
			float _UTilling;
			float _SkinPore_Tilling;
			float _TimeScale;
			float _ColorPow;
			float _FemaleLipsNailIMaleBeardNailsPower;
			float _FreaklesColorPower;
			float _HairCapColorPower;
			float _EyeShadowOutPower;
			float _EyeShadowInPower;
			float _Tilling;
			float _BlushPower;
			float _MetallicMultiply;
			float _DirtBoots;
			float _SkinPore_Power;
			float _Emissivepowerboost;
			float _EmissivePower1;
			float _Speed;
			float _TattooBoots;
			float _SSSPower;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _SkinNormal;
			sampler2D _SkinPore;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/DepthNormalsOnlyPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			
			VertexOutput VertexFunction( VertexInput v  )
			{
				VertexOutput o = (VertexOutput)0;
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

				o.ase_texcoord4.xy = v.ase_texcoord.xy;
				o.ase_texcoord4.zw = v.ase_texcoord1.xy;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;
				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 normalWS = TransformObjectToWorldNormal( v.ase_normal );
				float4 tangentWS = float4(TransformObjectToWorldDir( v.ase_tangent.xyz), v.ase_tangent.w);
				float4 positionCS = TransformWorldToHClip( positionWS );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					o.worldPos = positionWS;
				#endif

				o.worldNormal = normalWS;
				o.worldTangent = tangentWS;

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR) && defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

				o.clipPos = positionCS;

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 ase_texcoord : TEXCOORD0;
				float4 ase_texcoord1 : TEXCOORD1;

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
				o.ase_tangent = v.ase_tangent;
				o.ase_texcoord = v.ase_texcoord;
				o.ase_texcoord1 = v.ase_texcoord1;
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
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.ase_texcoord = patch[0].ase_texcoord * bary.x + patch[1].ase_texcoord * bary.y + patch[2].ase_texcoord * bary.z;
				o.ase_texcoord1 = patch[0].ase_texcoord1 * bary.x + patch[1].ase_texcoord1 * bary.y + patch[2].ase_texcoord1 * bary.z;
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

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
				#define ASE_SV_DEPTH SV_DepthLessEqual
			#else
				#define ASE_SV_DEPTH SV_Depth
			#endif

			void frag(	VertexOutput IN
						, out half4 outNormalWS : SV_Target0
						#ifdef ASE_DEPTH_WRITE_ON
						,out float outputDepth : ASE_SV_DEPTH
						#endif
						#ifdef _WRITE_RENDERING_LAYERS
						, out float4 outRenderingLayers : SV_Target1
						#endif
						 )
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX( IN );

				#if defined(ASE_NEEDS_FRAG_WORLD_POSITION)
					float3 WorldPosition = IN.worldPos;
				#endif

				float4 ShadowCoords = float4( 0, 0, 0, 0 );
				float3 WorldNormal = IN.worldNormal;
				float4 WorldTangent = IN.worldTangent;

				#if defined(ASE_NEEDS_FRAG_SHADOWCOORDS)
					#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
						ShadowCoords = IN.shadowCoord;
					#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
						ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
					#endif
				#endif

				float2 uv_SkinNormal = IN.ase_texcoord4.xy * _SkinNormal_ST.xy + _SkinNormal_ST.zw;
				float3 tex2DNode38 = UnpackNormalScale( tex2D( _SkinNormal, uv_SkinNormal ), 1.0f );
				float2 temp_cast_0 = (_SkinPore_Tilling).xx;
				float2 texCoord94 = IN.ase_texcoord4.zw * temp_cast_0 + float2( 0,0 );
				float3 unpack93 = UnpackNormalScale( tex2D( _SkinPore, texCoord94 ), _SkinPore_Power );
				unpack93.z = lerp( 1, unpack93.z, saturate(_SkinPore_Power) );
				#ifdef _ISCYBORG_ON
				float3 staticSwitch255 = tex2DNode38;
				#else
				float3 staticSwitch255 = BlendNormal( tex2DNode38 , unpack93 );
				#endif
				float3 Normal200 = staticSwitch255;
				

				float3 Normal = Normal200;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = 0;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.clipPos );
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				#if defined(_GBUFFER_NORMALS_OCT)
					float2 octNormalWS = PackNormalOctQuadEncode(WorldNormal);
					float2 remappedOctNormalWS = saturate(octNormalWS * 0.5 + 0.5);
					half3 packedNormalWS = PackFloat2To888(remappedOctNormalWS);
					outNormalWS = half4(packedNormalWS, 0.0);
				#else
					#if defined(_NORMALMAP)
						#if _NORMAL_DROPOFF_TS
							float crossSign = (WorldTangent.w > 0.0 ? 1.0 : -1.0) * GetOddNegativeScale();
							float3 bitangent = crossSign * cross(WorldNormal.xyz, WorldTangent.xyz);
							float3 normalWS = TransformTangentToWorld(Normal, half3x3(WorldTangent.xyz, bitangent, WorldNormal.xyz));
						#elif _NORMAL_DROPOFF_OS
							float3 normalWS = TransformObjectToWorldNormal(Normal);
						#elif _NORMAL_DROPOFF_WS
							float3 normalWS = Normal;
						#endif
					#else
						float3 normalWS = WorldNormal;
					#endif
					outNormalWS = half4(NormalizeNormalPerPixel(normalWS), 0.0);
				#endif

				#ifdef _WRITE_RENDERING_LAYERS
					uint renderingLayers = GetMeshRenderingLayer();
					outRenderingLayers = float4( EncodeMeshRenderingLayer( renderingLayers ), 0, 0, 0 );
				#endif
			}
			ENDHLSL
		}

		
		Pass
		{
			
			Name "GBuffer"
			Tags { "LightMode"="UniversalGBuffer" }

			Blend One Zero, One Zero
			ZWrite On
			ZTest LEqual
			Offset 0 , 0
			ColorMask RGBA
			

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
			#pragma multi_compile_instancing
			#pragma instancing_options renderinglayer
			#pragma multi_compile_fragment _ LOD_FADE_CROSSFADE
			#pragma multi_compile_fog
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140007


			#pragma multi_compile _ _MAIN_LIGHT_SHADOWS _MAIN_LIGHT_SHADOWS_CASCADE _MAIN_LIGHT_SHADOWS_SCREEN
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BLENDING
			#pragma multi_compile_fragment _ _REFLECTION_PROBE_BOX_PROJECTION
			#pragma multi_compile_fragment _ _SHADOWS_SOFT
			#pragma multi_compile_fragment _ _DBUFFER_MRT1 _DBUFFER_MRT2 _DBUFFER_MRT3
			#pragma multi_compile_fragment _ _RENDER_PASS_ENABLED
			#pragma shader_feature_local _RECEIVE_SHADOWS_OFF
			#pragma shader_feature_local_fragment _SPECULARHIGHLIGHTS_OFF
			#pragma shader_feature_local_fragment _ENVIRONMENTREFLECTIONS_OFF

			#pragma multi_compile _ LIGHTMAP_SHADOW_MIXING
			#pragma multi_compile _ SHADOWS_SHADOWMASK
			#pragma multi_compile _ DIRLIGHTMAP_COMBINED
			#pragma multi_compile _ LIGHTMAP_ON
			#pragma multi_compile _ DYNAMICLIGHTMAP_ON
			#pragma multi_compile_fragment _ _GBUFFER_NORMALS_OCT
			#pragma multi_compile_fragment _ _WRITE_RENDERING_LAYERS

			#pragma vertex vert
			#pragma fragment frag

			#define SHADERPASS SHADERPASS_GBUFFER

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Shadows.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/DBuffer.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/LODCrossFade.hlsl"
			
			#if defined(UNITY_INSTANCING_ENABLED) && defined(_TERRAIN_INSTANCED_PERPIXEL_NORMAL)
				#define ENABLE_TERRAIN_PERPIXEL_NORMAL
			#endif

			#pragma shader_feature_local _ISCYBORG_ON
			#pragma shader_feature_local _ISEXTRAMAKEUP_ON
			#pragma shader_feature_local _ISBASICEMMISION_ON


			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				float4 lightmapUVOrVertexSH : TEXCOORD0;
				half4 fogFactorAndVertexLight : TEXCOORD1;
				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
				float4 shadowCoord : TEXCOORD2;
				#endif
				float4 tSpace0 : TEXCOORD3;
				float4 tSpace1 : TEXCOORD4;
				float4 tSpace2 : TEXCOORD5;
				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
				float4 screenPos : TEXCOORD6;
				#endif
				#if defined(DYNAMICLIGHTMAP_ON)
				float2 dynamicLightmapUV : TEXCOORD7;
				#endif
				float4 ase_texcoord8 : TEXCOORD8;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _BaseColorMul;
			float4 _EmissiveMask_ST;
			float4 _EmissiveColor1;
			float4 _SSSColor;
			float4 _SkinNormal_ST;
			float4 _Dirt_ST;
			float4 _EmissiveColor2;
			float4 _DirtColor;
			float4 _AMS_ST;
			float4 _EmissiveColor3;
			float4 _TattoMask_ST;
			float4 _RoughnessMod_R_ST;
			float4 _BlushColor;
			float4 _TattooColor;
			float4 _ExtraMask_ST;
			float4 _SkinColor_ST;
			float4 _FemaleLipsNailIMaleBeardNailsColor;
			float4 _Mask_ST;
			float4 _EyeShadowInColor;
			float4 _HairCapColor;
			float4 _FreaklesColor;
			float4 _ORM_ST;
			float4 _EyeShadowOutColor;
			float _DirtRoughness_Power;
			float _HairCapRoughness;
			float _VTilling;
			float _EmissivePower3;
			float _Multi;
			float _Pow;
			float _SkinRounghnessBoots;
			float _Number;
			float _FemaleLipsNailIMaleBeardNailsRoughnessBoost;
			float _Divisor;
			float _EmissivePower2;
			float _UTilling;
			float _SkinPore_Tilling;
			float _TimeScale;
			float _ColorPow;
			float _FemaleLipsNailIMaleBeardNailsPower;
			float _FreaklesColorPower;
			float _HairCapColorPower;
			float _EyeShadowOutPower;
			float _EyeShadowInPower;
			float _Tilling;
			float _BlushPower;
			float _MetallicMultiply;
			float _DirtBoots;
			float _SkinPore_Power;
			float _Emissivepowerboost;
			float _EmissivePower1;
			float _Speed;
			float _TattooBoots;
			float _SSSPower;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			sampler2D _SkinColor;
			sampler2D _Mask;
			sampler2D _ExtraMask;
			sampler2D _TattoMask;
			sampler2D _AMS;
			sampler2D _Dirt;
			sampler2D _SkinNormal;
			sampler2D _SkinPore;
			sampler2D _EmissiveMask;
			sampler2D _Pattern;
			sampler2D _RoughnessMod_R;
			sampler2D _ORM;


			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/UnityGBuffer.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/PBRGBufferPass.hlsl"

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

				o.ase_texcoord8.xy = v.texcoord.xy;
				o.ase_texcoord8.zw = v.texcoord1.xy;
				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					v.vertex.xyz = vertexValue;
				#else
					v.vertex.xyz += vertexValue;
				#endif

				v.ase_normal = v.ase_normal;

				float3 positionWS = TransformObjectToWorld( v.vertex.xyz );
				float3 positionVS = TransformWorldToView( positionWS );
				float4 positionCS = TransformWorldToHClip( positionWS );

				VertexNormalInputs normalInput = GetVertexNormalInputs( v.ase_normal, v.ase_tangent );

				o.tSpace0 = float4( normalInput.normalWS, positionWS.x);
				o.tSpace1 = float4( normalInput.tangentWS, positionWS.y);
				o.tSpace2 = float4( normalInput.bitangentWS, positionWS.z);

				#if defined(LIGHTMAP_ON)
					OUTPUT_LIGHTMAP_UV(v.texcoord1, unity_LightmapST, o.lightmapUVOrVertexSH.xy);
				#endif

				#if defined(DYNAMICLIGHTMAP_ON)
					o.dynamicLightmapUV.xy = v.texcoord2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
				#endif

				#if !defined(LIGHTMAP_ON)
					OUTPUT_SH(normalInput.normalWS.xyz, o.lightmapUVOrVertexSH.xyz);
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					o.lightmapUVOrVertexSH.zw = v.texcoord;
					o.lightmapUVOrVertexSH.xy = v.texcoord * unity_LightmapST.xy + unity_LightmapST.zw;
				#endif

				half3 vertexLight = VertexLighting( positionWS, normalInput.normalWS );

				o.fogFactorAndVertexLight = half4(0, vertexLight);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					VertexPositionInputs vertexInput = (VertexPositionInputs)0;
					vertexInput.positionWS = positionWS;
					vertexInput.positionCS = positionCS;
					o.shadowCoord = GetShadowCoord( vertexInput );
				#endif

					o.clipPos = positionCS;

				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
					o.screenPos = ComputeScreenPos(positionCS);
				#endif

				return o;
			}

			#if defined(ASE_TESSELLATION)
			struct VertexControl
			{
				float4 vertex : INTERNALTESSPOS;
				float3 ase_normal : NORMAL;
				float4 ase_tangent : TANGENT;
				float4 texcoord : TEXCOORD0;
				float4 texcoord1 : TEXCOORD1;
				float4 texcoord2 : TEXCOORD2;
				
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
				o.ase_tangent = v.ase_tangent;
				o.texcoord = v.texcoord;
				o.texcoord1 = v.texcoord1;
				o.texcoord2 = v.texcoord2;
				
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
				o.ase_tangent = patch[0].ase_tangent * bary.x + patch[1].ase_tangent * bary.y + patch[2].ase_tangent * bary.z;
				o.texcoord = patch[0].texcoord * bary.x + patch[1].texcoord * bary.y + patch[2].texcoord * bary.z;
				o.texcoord1 = patch[0].texcoord1 * bary.x + patch[1].texcoord1 * bary.y + patch[2].texcoord1 * bary.z;
				o.texcoord2 = patch[0].texcoord2 * bary.x + patch[1].texcoord2 * bary.y + patch[2].texcoord2 * bary.z;
				
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

			#if defined(ASE_EARLY_Z_DEPTH_OPTIMIZE)
				#define ASE_SV_DEPTH SV_DepthLessEqual
			#else
				#define ASE_SV_DEPTH SV_Depth
			#endif

			FragmentOutput frag ( VertexOutput IN
								#ifdef ASE_DEPTH_WRITE_ON
								,out float outputDepth : ASE_SV_DEPTH
								#endif
								 )
			{
				UNITY_SETUP_INSTANCE_ID(IN);
				UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(IN);

				#ifdef LOD_FADE_CROSSFADE
					LODFadeCrossFade( IN.clipPos );
				#endif

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float2 sampleCoords = (IN.lightmapUVOrVertexSH.zw / _TerrainHeightmapRecipSize.zw + 0.5f) * _TerrainHeightmapRecipSize.xy;
					float3 WorldNormal = TransformObjectToWorldNormal(normalize(SAMPLE_TEXTURE2D(_TerrainNormalmapTexture, sampler_TerrainNormalmapTexture, sampleCoords).rgb * 2 - 1));
					float3 WorldTangent = -cross(GetObjectToWorldMatrix()._13_23_33, WorldNormal);
					float3 WorldBiTangent = cross(WorldNormal, -WorldTangent);
				#else
					float3 WorldNormal = normalize( IN.tSpace0.xyz );
					float3 WorldTangent = IN.tSpace1.xyz;
					float3 WorldBiTangent = IN.tSpace2.xyz;
				#endif

				float3 WorldPosition = float3(IN.tSpace0.w,IN.tSpace1.w,IN.tSpace2.w);
				float3 WorldViewDirection = _WorldSpaceCameraPos.xyz  - WorldPosition;
				float4 ShadowCoords = float4( 0, 0, 0, 0 );

				#if defined(ASE_NEEDS_FRAG_SCREEN_POSITION)
					float4 ScreenPos = IN.screenPos;
				#endif

				float2 NormalizedScreenSpaceUV = GetNormalizedScreenSpaceUV(IN.clipPos);

				#if defined(REQUIRES_VERTEX_SHADOW_COORD_INTERPOLATOR)
					ShadowCoords = IN.shadowCoord;
				#elif defined(MAIN_LIGHT_CALCULATE_SHADOWS)
					ShadowCoords = TransformWorldToShadowCoord( WorldPosition );
				#else
					ShadowCoords = float4(0, 0, 0, 0);
				#endif

				WorldViewDirection = SafeNormalize( WorldViewDirection );

				float4 saferPower136 = abs( _BaseColorMul );
				float4 temp_cast_0 = (_ColorPow).xxxx;
				float2 uv_SkinColor = IN.ase_texcoord8.xy * _SkinColor_ST.xy + _SkinColor_ST.zw;
				float4 tex2DNode4 = tex2D( _SkinColor, uv_SkinColor );
				float4 temp_output_137_0 = ( pow( saferPower136 , temp_cast_0 ) * tex2DNode4 );
				float2 uv_Mask = IN.ase_texcoord8.xy * _Mask_ST.xy + _Mask_ST.zw;
				float4 tex2DNode11 = tex2D( _Mask, uv_Mask );
				float4 lerpResult124 = lerp( float4( 0,0,0,0 ) , _FemaleLipsNailIMaleBeardNailsColor , tex2DNode11.r);
				float4 lerpResult125 = lerp( float4( 0,0,0,0 ) , _FreaklesColor , tex2DNode11.g);
				float4 lerpResult126 = lerp( float4( 0,0,0,0 ) , _HairCapColor , tex2DNode11.b);
				float4 temp_output_57_0 = ( lerpResult124 + lerpResult125 + lerpResult126 );
				float temp_output_123_0 = ( ( _FemaleLipsNailIMaleBeardNailsPower * tex2DNode11.r ) + ( _FreaklesColorPower * tex2DNode11.g ) + ( _HairCapColorPower * tex2DNode11.b ) );
				float clampResult165 = clamp( temp_output_123_0 , 0.0 , 1.0 );
				float4 lerpResult140 = lerp( temp_output_137_0 , temp_output_57_0 , clampResult165);
				float2 uv_ExtraMask = IN.ase_texcoord8.xy * _ExtraMask_ST.xy + _ExtraMask_ST.zw;
				float4 tex2DNode223 = tex2D( _ExtraMask, uv_ExtraMask );
				float4 lerpResult220 = lerp( float4( 0,0,0,0 ) , _EyeShadowOutColor , tex2DNode223.r);
				float4 lerpResult219 = lerp( float4( 0,0,0,0 ) , _EyeShadowInColor , tex2DNode223.g);
				float4 lerpResult221 = lerp( float4( 0,0,0,0 ) , _BlushColor , tex2DNode223.b);
				float clampResult226 = clamp( ( ( _EyeShadowOutPower * tex2DNode223.r ) + ( _EyeShadowInPower * tex2DNode223.g ) + ( _BlushPower * tex2DNode223.b ) + temp_output_123_0 ) , 0.0 , 1.0 );
				float4 lerpResult225 = lerp( temp_output_137_0 , ( lerpResult220 + lerpResult219 + lerpResult221 + temp_output_57_0 ) , clampResult226);
				#ifdef _ISEXTRAMAKEUP_ON
				float4 staticSwitch227 = lerpResult225;
				#else
				float4 staticSwitch227 = lerpResult140;
				#endif
				float2 uv_TattoMask = IN.ase_texcoord8.xy * _TattoMask_ST.xy + _TattoMask_ST.zw;
				float4 lerpResult193 = lerp( staticSwitch227 , _TattooColor , ( tex2D( _TattoMask, uv_TattoMask ).r * _TattooBoots ));
				float4 SkinColor248 = ( tex2DNode4 * ( 1.0 - _MetallicMultiply ) );
				float2 uv_AMS = IN.ase_texcoord8.xy * _AMS_ST.xy + _AMS_ST.zw;
				float4 tex2DNode233 = tex2D( _AMS, uv_AMS );
				float AMSAlpha229 = tex2DNode233.r;
				float4 lerpResult246 = lerp( lerpResult193 , SkinColor248 , AMSAlpha229);
				#ifdef _ISCYBORG_ON
				float4 staticSwitch254 = lerpResult246;
				#else
				float4 staticSwitch254 = lerpResult193;
				#endif
				float2 uv_Dirt = IN.ase_texcoord8.xy * _Dirt_ST.xy + _Dirt_ST.zw;
				float4 tex2DNode63 = tex2D( _Dirt, uv_Dirt );
				float4 lerpResult70 = lerp( staticSwitch254 , ( _DirtColor * _DirtBoots ) , ( _DirtBoots * tex2DNode63.r ));
				float4 clampResult194 = clamp( lerpResult70 , float4( 0,0,0,0 ) , float4( 1,1,1,0 ) );
				float4 Albedo198 = clampResult194;
				
				float2 uv_SkinNormal = IN.ase_texcoord8.xy * _SkinNormal_ST.xy + _SkinNormal_ST.zw;
				float3 tex2DNode38 = UnpackNormalScale( tex2D( _SkinNormal, uv_SkinNormal ), 1.0f );
				float2 temp_cast_2 = (_SkinPore_Tilling).xx;
				float2 texCoord94 = IN.ase_texcoord8.zw * temp_cast_2 + float2( 0,0 );
				float3 unpack93 = UnpackNormalScale( tex2D( _SkinPore, texCoord94 ), _SkinPore_Power );
				unpack93.z = lerp( 1, unpack93.z, saturate(_SkinPore_Power) );
				#ifdef _ISCYBORG_ON
				float3 staticSwitch255 = tex2DNode38;
				#else
				float3 staticSwitch255 = BlendNormal( tex2DNode38 , unpack93 );
				#endif
				float3 Normal200 = staticSwitch255;
				
				float2 uv_EmissiveMask = IN.ase_texcoord8.xy * _EmissiveMask_ST.xy + _EmissiveMask_ST.zw;
				float4 tex2DNode163 = tex2D( _EmissiveMask, uv_EmissiveMask );
				float2 texCoord291 = IN.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float mulTime270 = _TimeParameters.x * _TimeScale;
				float temp_output_269_0 = ( _Speed * mulTime270 );
				float4 _SpeedConstant = float4(1,-2,2,-1);
				float2 temp_cast_3 = (_SpeedConstant.x).xx;
				float2 texCoord281 = IN.ase_texcoord8.xy * float2( 1,1 ) + float2( 0,0 );
				float4 appendResult286 = (float4(_UTilling , _VTilling , 0.0 , 0.0));
				float4 temp_output_287_0 = ( float4( ( texCoord281 * _Tilling ), 0.0 , 0.0 ) * appendResult286 );
				float2 panner265 = ( temp_output_269_0 * temp_cast_3 + temp_output_287_0.xy);
				float2 panner266 = ( temp_output_269_0 * _SpeedConstant.xy + ( temp_output_287_0 + 0.418 ).xy);
				float4 _SpeedConstant1 = float4(1,0,2,-1);
				float2 temp_cast_9 = (_SpeedConstant1.w).xx;
				float2 panner267 = ( temp_output_269_0 * temp_cast_9 + ( temp_output_287_0 + 8.9 ).xy);
				float2 panner268 = ( temp_output_269_0 * _SpeedConstant1.xy + ( temp_output_287_0 + 0.65 ).xy);
				float simplePerlin2D292 = snoise( ( texCoord291 + (( ( ( tex2D( _Pattern, panner265 ) + tex2D( _Pattern, panner266 ) ) + ( tex2D( _Pattern, panner267 ) + tex2D( _Pattern, panner268 ) ) ) * _Divisor )).r ) );
				simplePerlin2D292 = simplePerlin2D292*0.5 + 0.5;
				float clampResult304 = clamp( ( pow( sin( frac( ( simplePerlin2D292 * _Number ) ) ) , _Pow ) * _Multi ) , 0.0 , 1.0 );
				#ifdef _ISBASICEMMISION_ON
				float staticSwitch312 = 1.0;
				#else
				float staticSwitch312 = clampResult304;
				#endif
				float4 Emmision202 = ( _Emissivepowerboost * ( ( _EmissiveColor1 * _EmissivePower1 * tex2DNode163.r * staticSwitch312 ) + ( _EmissiveColor2 * _EmissivePower2 * tex2DNode163.g * staticSwitch312 ) + ( _EmissiveColor3 * _EmissivePower3 * tex2DNode163.b * staticSwitch312 ) ) );
				
				float lerpResult231 = lerp( 0.0 , tex2DNode233.b , tex2DNode233.r);
				#ifdef _ISCYBORG_ON
				float staticSwitch234 = lerpResult231;
				#else
				float staticSwitch234 = 0.0;
				#endif
				float Mettalic235 = staticSwitch234;
				
				float2 uv_RoughnessMod_R = IN.ase_texcoord8.xy * _RoughnessMod_R_ST.xy + _RoughnessMod_R_ST.zw;
				float2 uv_ORM = IN.ase_texcoord8.xy * _ORM_ST.xy + _ORM_ST.zw;
				float4 tex2DNode179 = tex2D( _ORM, uv_ORM );
				float lerpResult71 = lerp( ( ( _SkinRounghnessBoots * tex2D( _RoughnessMod_R, uv_RoughnessMod_R ).a ) * tex2DNode179.g ) , ( _DirtRoughness_Power * _DirtBoots ) , ( _DirtBoots * tex2DNode63.r ));
				float lerpResult170 = lerp( lerpResult71 , _HairCapRoughness , tex2DNode11.b);
				float lerpResult141 = lerp( lerpResult170 , _FemaleLipsNailIMaleBeardNailsRoughnessBoost , tex2DNode11.r);
				float clampResult171 = clamp( lerpResult141 , 0.0 , 1.0 );
				float lerpResult257 = lerp( clampResult171 , tex2DNode179.g , AMSAlpha229);
				#ifdef _ISCYBORG_ON
				float staticSwitch256 = lerpResult257;
				#else
				float staticSwitch256 = clampResult171;
				#endif
				float Smoothness204 = staticSwitch256;
				
				float AO206 = tex2DNode179.r;
				
				float4 temp_output_183_0 = ( _SSSColor * ( 1.0 - tex2DNode179.b ) );
				float4 temp_cast_16 = (0.0).xxxx;
				float4 lerpResult237 = lerp( temp_output_183_0 , temp_cast_16 , AMSAlpha229);
				#ifdef _ISCYBORG_ON
				float4 staticSwitch239 = lerpResult237;
				#else
				float4 staticSwitch239 = temp_output_183_0;
				#endif
				float4 Transmission208 = staticSwitch239;
				
				float3 temp_cast_18 = (_SSSPower).xxx;
				

				float3 BaseColor = Albedo198.rgb;
				float3 Normal = Normal200;
				float3 Emission = Emmision202.rgb;
				float3 Specular = 0.5;
				float Metallic = Mettalic235;
				float Smoothness = Smoothness204;
				float Occlusion = AO206;
				float Alpha = 1;
				float AlphaClipThreshold = 0.5;
				float AlphaClipThresholdShadow = 0.5;
				float3 BakedGI = 0;
				float3 RefractionColor = 1;
				float RefractionIndex = 1;
				float3 Transmission = Transmission208.rgb;
				float3 Translucency = temp_cast_18;

				#ifdef ASE_DEPTH_WRITE_ON
					float DepthValue = 0;
				#endif

				#ifdef _ALPHATEST_ON
					clip(Alpha - AlphaClipThreshold);
				#endif

				InputData inputData = (InputData)0;
				inputData.positionWS = WorldPosition;
				inputData.positionCS = IN.clipPos;
				inputData.shadowCoord = ShadowCoords;

				#ifdef _NORMALMAP
					#if _NORMAL_DROPOFF_TS
						inputData.normalWS = TransformTangentToWorld(Normal, half3x3( WorldTangent, WorldBiTangent, WorldNormal ));
					#elif _NORMAL_DROPOFF_OS
						inputData.normalWS = TransformObjectToWorldNormal(Normal);
					#elif _NORMAL_DROPOFF_WS
						inputData.normalWS = Normal;
					#endif
				#else
					inputData.normalWS = WorldNormal;
				#endif

				inputData.normalWS = NormalizeNormalPerPixel(inputData.normalWS);
				inputData.viewDirectionWS = SafeNormalize( WorldViewDirection );

				inputData.vertexLighting = IN.fogFactorAndVertexLight.yzw;

				#if defined(ENABLE_TERRAIN_PERPIXEL_NORMAL)
					float3 SH = SampleSH(inputData.normalWS.xyz);
				#else
					float3 SH = IN.lightmapUVOrVertexSH.xyz;
				#endif

				#ifdef ASE_BAKEDGI
					inputData.bakedGI = BakedGI;
				#else
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, IN.dynamicLightmapUV.xy, SH, inputData.normalWS);
					#else
						inputData.bakedGI = SAMPLE_GI( IN.lightmapUVOrVertexSH.xy, SH, inputData.normalWS );
					#endif
				#endif

				inputData.normalizedScreenSpaceUV = NormalizedScreenSpaceUV;
				inputData.shadowMask = SAMPLE_SHADOWMASK(IN.lightmapUVOrVertexSH.xy);

				#if defined(DEBUG_DISPLAY)
					#if defined(DYNAMICLIGHTMAP_ON)
						inputData.dynamicLightmapUV = IN.dynamicLightmapUV.xy;
						#endif
					#if defined(LIGHTMAP_ON)
						inputData.staticLightmapUV = IN.lightmapUVOrVertexSH.xy;
					#else
						inputData.vertexSH = SH;
					#endif
				#endif

				#ifdef _DBUFFER
					ApplyDecal(IN.clipPos,
						BaseColor,
						Specular,
						inputData.normalWS,
						Metallic,
						Occlusion,
						Smoothness);
				#endif

				BRDFData brdfData;
				InitializeBRDFData
				(BaseColor, Metallic, Specular, Smoothness, Alpha, brdfData);

				Light mainLight = GetMainLight(inputData.shadowCoord, inputData.positionWS, inputData.shadowMask);
				half4 color;
				MixRealtimeAndBakedGI(mainLight, inputData.normalWS, inputData.bakedGI, inputData.shadowMask);
				color.rgb = GlobalIllumination(brdfData, inputData.bakedGI, Occlusion, inputData.positionWS, inputData.normalWS, inputData.viewDirectionWS);
				color.a = Alpha;

				#ifdef ASE_FINAL_COLOR_ALPHA_MULTIPLY
					color.rgb *= color.a;
				#endif

				#ifdef ASE_DEPTH_WRITE_ON
					outputDepth = DepthValue;
				#endif

				return BRDFDataToGbuffer(brdfData, inputData, Smoothness, Emission + color.rgb, Occlusion);
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "SceneSelectionPass"
			Tags { "LightMode"="SceneSelectionPass" }

			Cull Off

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140007


			#pragma vertex vert
			#pragma fragment frag

			#define SCENESELECTIONPASS 1

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _BaseColorMul;
			float4 _EmissiveMask_ST;
			float4 _EmissiveColor1;
			float4 _SSSColor;
			float4 _SkinNormal_ST;
			float4 _Dirt_ST;
			float4 _EmissiveColor2;
			float4 _DirtColor;
			float4 _AMS_ST;
			float4 _EmissiveColor3;
			float4 _TattoMask_ST;
			float4 _RoughnessMod_R_ST;
			float4 _BlushColor;
			float4 _TattooColor;
			float4 _ExtraMask_ST;
			float4 _SkinColor_ST;
			float4 _FemaleLipsNailIMaleBeardNailsColor;
			float4 _Mask_ST;
			float4 _EyeShadowInColor;
			float4 _HairCapColor;
			float4 _FreaklesColor;
			float4 _ORM_ST;
			float4 _EyeShadowOutColor;
			float _DirtRoughness_Power;
			float _HairCapRoughness;
			float _VTilling;
			float _EmissivePower3;
			float _Multi;
			float _Pow;
			float _SkinRounghnessBoots;
			float _Number;
			float _FemaleLipsNailIMaleBeardNailsRoughnessBoost;
			float _Divisor;
			float _EmissivePower2;
			float _UTilling;
			float _SkinPore_Tilling;
			float _TimeScale;
			float _ColorPow;
			float _FemaleLipsNailIMaleBeardNailsPower;
			float _FreaklesColorPower;
			float _HairCapColorPower;
			float _EyeShadowOutPower;
			float _EyeShadowInPower;
			float _Tilling;
			float _BlushPower;
			float _MetallicMultiply;
			float _DirtBoots;
			float _SkinPore_Power;
			float _Emissivepowerboost;
			float _EmissivePower1;
			float _Speed;
			float _TattooBoots;
			float _SSSPower;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			

			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/SelectionPickingPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			
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

				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

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

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				

				surfaceDescription.Alpha = 1;
				surfaceDescription.AlphaClipThreshold = 0.5;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
					clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = 0;

				#ifdef SCENESELECTIONPASS
					outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				#elif defined(SCENEPICKINGPASS)
					outColor = _SelectionID;
				#endif

				return outColor;
			}

			ENDHLSL
		}

		
		Pass
		{
			
			Name "ScenePickingPass"
			Tags { "LightMode"="Picking" }

			HLSLPROGRAM

			#define _NORMAL_DROPOFF_TS 1
			#define ASE_TRANSMISSION 1
			#define ASE_TRANSLUCENCY 1
			#define ASE_FOG 1
			#define _EMISSION
			#define _NORMALMAP 1
			#define ASE_SRP_VERSION 140007


			#pragma vertex vert
			#pragma fragment frag

		    #define SCENEPICKINGPASS 1

			#define ATTRIBUTES_NEED_NORMAL
			#define ATTRIBUTES_NEED_TANGENT
			#define SHADERPASS SHADERPASS_DEPTHONLY

			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Color.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Texture.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Lighting.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Input.hlsl"
			#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/TextureStack.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/ShaderGraphFunctions.hlsl"
			#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/ShaderPass.hlsl"

			

			struct VertexInput
			{
				float4 vertex : POSITION;
				float3 ase_normal : NORMAL;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct VertexOutput
			{
				float4 clipPos : SV_POSITION;
				
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};

			CBUFFER_START(UnityPerMaterial)
			float4 _BaseColorMul;
			float4 _EmissiveMask_ST;
			float4 _EmissiveColor1;
			float4 _SSSColor;
			float4 _SkinNormal_ST;
			float4 _Dirt_ST;
			float4 _EmissiveColor2;
			float4 _DirtColor;
			float4 _AMS_ST;
			float4 _EmissiveColor3;
			float4 _TattoMask_ST;
			float4 _RoughnessMod_R_ST;
			float4 _BlushColor;
			float4 _TattooColor;
			float4 _ExtraMask_ST;
			float4 _SkinColor_ST;
			float4 _FemaleLipsNailIMaleBeardNailsColor;
			float4 _Mask_ST;
			float4 _EyeShadowInColor;
			float4 _HairCapColor;
			float4 _FreaklesColor;
			float4 _ORM_ST;
			float4 _EyeShadowOutColor;
			float _DirtRoughness_Power;
			float _HairCapRoughness;
			float _VTilling;
			float _EmissivePower3;
			float _Multi;
			float _Pow;
			float _SkinRounghnessBoots;
			float _Number;
			float _FemaleLipsNailIMaleBeardNailsRoughnessBoost;
			float _Divisor;
			float _EmissivePower2;
			float _UTilling;
			float _SkinPore_Tilling;
			float _TimeScale;
			float _ColorPow;
			float _FemaleLipsNailIMaleBeardNailsPower;
			float _FreaklesColorPower;
			float _HairCapColorPower;
			float _EyeShadowOutPower;
			float _EyeShadowInPower;
			float _Tilling;
			float _BlushPower;
			float _MetallicMultiply;
			float _DirtBoots;
			float _SkinPore_Power;
			float _Emissivepowerboost;
			float _EmissivePower1;
			float _Speed;
			float _TattooBoots;
			float _SSSPower;
			#ifdef ASE_TRANSMISSION
				float _TransmissionShadow;
			#endif
			#ifdef ASE_TRANSLUCENCY
				float _TransStrength;
				float _TransNormal;
				float _TransScattering;
				float _TransDirect;
				float _TransAmbient;
				float _TransShadow;
			#endif
			#ifdef ASE_TESSELLATION
				float _TessPhongStrength;
				float _TessValue;
				float _TessMin;
				float _TessMax;
				float _TessEdgeLength;
				float _TessMaxDisp;
			#endif
			CBUFFER_END

			// Property used by ScenePickingPass
			#ifdef SCENEPICKINGPASS
				float4 _SelectionID;
			#endif

			// Properties used by SceneSelectionPass
			#ifdef SCENESELECTIONPASS
				int _ObjectId;
				int _PassValue;
			#endif

			

			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/Varyings.hlsl"
			//#include "Packages/com.unity.render-pipelines.universal/Editor/ShaderGraph/Includes/SelectionPickingPass.hlsl"

			//#ifdef HAVE_VFX_MODIFICATION
			//#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/VisualEffectVertex.hlsl"
			//#endif

			
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

				

				#ifdef ASE_ABSOLUTE_VERTEX_POS
					float3 defaultVertexValue = v.vertex.xyz;
				#else
					float3 defaultVertexValue = float3(0, 0, 0);
				#endif

				float3 vertexValue = defaultVertexValue;

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

			half4 frag(VertexOutput IN ) : SV_TARGET
			{
				SurfaceDescription surfaceDescription = (SurfaceDescription)0;

				

				surfaceDescription.Alpha = 1;
				surfaceDescription.AlphaClipThreshold = 0.5;

				#if _ALPHATEST_ON
					float alphaClipThreshold = 0.01f;
					#if ALPHA_CLIP_THRESHOLD
						alphaClipThreshold = surfaceDescription.AlphaClipThreshold;
					#endif
						clip(surfaceDescription.Alpha - alphaClipThreshold);
				#endif

				half4 outColor = 0;

				#ifdef SCENESELECTIONPASS
					outColor = half4(_ObjectId, _PassValue, 1.0, 1.0);
				#elif defined(SCENEPICKINGPASS)
					outColor = _SelectionID;
				#endif

				return outColor;
			}

			ENDHLSL
		}
		
	}
	
	CustomEditor "UnityEditor.ShaderGraphLitGUI"
	FallBack "Hidden/Shader Graph/FallbackError"
	
	Fallback "Hidden/InternalErrorShader"
}
/*ASEBEGIN
Version=19105
Node;AmplifyShaderEditor.RangedFloatNode;117;-2103.236,-893.8469;Inherit;False;Property;_FreaklesColorPower;Freakles Color Power;30;0;Create;True;0;0;0;False;0;False;0;0;0;20;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;67;-456.1283,-2578.857;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;183;2315.974,-1768.805;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;93;835.314,-858.0076;Inherit;True;Property;_SkinPore;Skin Pore;18;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ClampOpNode;171;1030.628,-2200.49;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;254;274.2328,-3279.44;Inherit;False;Property;_isCyborg;is Cyborg;13;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;155;357.5413,640.4976;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;242;2052.395,-1388.002;Inherit;False;229;AMSAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;38;833.5989,-1063.202;Inherit;True;Property;_SkinNormal;Skin Normal;7;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;True;bump;Auto;True;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;163;-677.4165,258.1001;Inherit;True;Property;_EmissiveMask;Emissive Mask;39;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;154;-263.4793,596.7627;Float;False;Property;_EmissiveColor1;Emissive Color 1;43;0;Create;True;0;0;0;False;0;False;0,0,0,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TextureCoordinatesNode;94;537.0673,-863.1323;Inherit;False;1;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;150;-297.7054,1351.195;Float;False;Property;_EmissivePower3;Emissive Power 3;48;0;Create;True;0;0;0;False;0;False;0;0;0;2000;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;147;-295.3543,833.9128;Float;False;Property;_EmissivePower1;Emissive Power 1;44;0;Create;True;0;0;0;False;0;False;0;0;0;2000;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;113;2105.679,-1747.014;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;158;375.5061,1185.75;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;152;-225.8211,1176.974;Float;False;Property;_EmissiveColor3;Emissive Color 3;47;0;Create;True;0;0;0;False;0;False;0,0,0,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;246;30.68616,-3240.872;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;141;739.9926,-2508.017;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;182;2035.974,-1943.807;Inherit;False;Property;_SSSColor;SSS Color;11;0;Create;True;0;0;0;False;0;False;1,0.7457517,0.6839622,0;0,0,0,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;96;268.041,-770.4504;Inherit;False;Property;_SkinPore_Power;SkinPore_Power;19;0;Create;True;0;0;0;False;0;False;0.25;0.25;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;148;-225.6663,921.9042;Float;False;Property;_EmissiveColor2;Emissive Color 2;45;0;Create;True;0;0;0;False;0;False;0,0,0,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;149;-292.6663,1094.905;Float;False;Property;_EmissivePower2;Emissive Power 2;46;0;Create;True;0;0;0;False;0;False;248.8943;0;0;2000;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;193;-183.1676,-3435.953;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;95;331.063,-861.0825;Inherit;False;Property;_SkinPore_Tilling;SkinPore_Tilling;20;0;Create;True;0;0;0;False;0;False;35;35;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;253;-256.8845,-3191.362;Inherit;False;248;SkinColor;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;128;235.0357,-2656.672;Inherit;False;Property;_FemaleLipsNailIMaleBeardNailsRoughnessBoost;Female Lips/Nail I Male Beard/Nails Roughness Boost;25;0;Create;True;0;0;0;False;0;False;0.75;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;247;-258.3138,-3068.872;Inherit;False;229;AMSAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;236;-3158.46,-279.4356;Inherit;False;Constant;_MetallicZero;MetallicZero;51;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;197;-791.5758,-2907.118;Inherit;False;Property;_DirtColor;Dirt Color;4;0;Create;True;0;0;0;False;0;False;0.2156863,0.1627929,0.1411765,0;0.1509434,0.0874304,0.05339979,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;157;371.2302,913.4891;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;170;516.7056,-2475.682;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;205;2116.795,-642.7246;Inherit;False;204;Smoothness;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;201;2126.688,-951.6869;Inherit;False;200;Normal;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;202;952.9011,1283.217;Inherit;False;Emmision;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;235;-2384.269,-293.7219;Inherit;False;Mettalic;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;208;3203.898,-1634.747;Inherit;False;Transmission;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;198;1138.652,-3066.955;Inherit;False;Albedo;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;200;1771.397,-1074.309;Inherit;False;Normal;-1;True;1;0;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;204;1621.021,-2213.172;Inherit;False;Smoothness;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;209;2112.63,-484.3176;Inherit;False;208;Transmission;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;203;2126.106,-872.5416;Inherit;False;202;Emmision;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;199;2125.821,-1027.417;Inherit;False;198;Albedo;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.GetLocalVarNode;207;2116.296,-565.052;Inherit;False;206;AO;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;206;2039.579,-1604.671;Inherit;False;AO;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;90;2030.988,-385.9758;Inherit;False;Property;_SSSPower;SSS Power;12;0;Create;True;0;0;0;False;0;False;1;1.2;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;243;2120.716,-731.9746;Inherit;False;235;Mettalic;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;234;-2627.707,-292.4141;Inherit;False;Property;_isCyborg;is Cyborg;13;0;Create;False;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;227;239.4686,-1865.501;Inherit;False;Property;_IsExtraMakeUp;Is Extra MakeUp;31;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;239;2973.132,-1633.334;Inherit;False;Property;_isCyborg;is Cyborg;13;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;COLOR;0,0,0,0;False;0;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;4;COLOR;0,0,0,0;False;5;COLOR;0,0,0,0;False;6;COLOR;0,0,0,0;False;7;COLOR;0,0,0,0;False;8;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;161;765.809,1284.863;Inherit;False;2;2;0;FLOAT;0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;194;853.739,-3248.25;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;1,1,1,0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;255;1499.825,-932.2454;Inherit;False;Property;_isCyborg;is Cyborg;13;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT3;0,0,0;False;0;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT3;0,0,0;False;4;FLOAT3;0,0,0;False;5;FLOAT3;0,0,0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;258;1000.775,-1998.675;Inherit;False;229;AMSAlpha;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;237;2491.973,-1612.674;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;160;437.1213,1395.793;Inherit;False;Property;_Emissivepowerboost;Emissive power boost;41;0;Create;True;0;0;0;False;0;False;100;100;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;70;598.6964,-3244.134;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.BlendNormalsNode;92;1178.656,-1065.039;Inherit;False;0;3;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;1;FLOAT3;0
Node;AmplifyShaderEditor.LerpOp;257;1193.168,-2022.724;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;231;-2855.158,-394.5608;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;159;587.527,965.0378;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;68;-452.9777,-2704.891;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;244;2055.704,-1472.641;Inherit;False;Constant;_SSSZero;SSSZero;50;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.StaticSwitch;256;1353.657,-2137.383;Inherit;False;Property;_isCyborg;is Cyborg;13;0;Create;False;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;191;-651.5506,-3525.757;Inherit;False;Property;_TattooColor;Tattoo Color;1;0;Create;True;0;0;0;False;0;False;0.1422659,0.1889629,0.2169811,0;0.1509434,0.0874304,0.05339979,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;233;-3285.08,-480.0153;Inherit;True;Property;_AMS;AMS;14;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;123;-1071.28,-875.0791;Inherit;True;3;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;26;235.947,-1358.957;Float;False;Property;_SkinRounghnessBoots;Skin Rounghness Boots;17;0;Create;True;0;0;0;False;0;False;0.55;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;250;-1416.257,-7.602993;Inherit;False;Property;_MetallicMultiply;Metallic Multiply;15;0;Create;True;0;0;0;False;0;False;0.35;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;3;230.1889,-1260.054;Inherit;True;Property;_RoughnessMod_R;RoughnessMod_R;16;0;Create;True;0;0;0;False;0;False;-1;c0b7b18616e3d4c4d9f007d6681e9331;c0b7b18616e3d4c4d9f007d6681e9331;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;215;-1792.431,-1582.608;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;125;-826.8776,-1033.162;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.ColorNode;213;-944.3007,-2093.164;Float;False;Property;_EyeShadowInColor;Eye Shadow In  Color;33;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.ColorNode;216;-1345.479,-2082.64;Float;False;Property;_EyeShadowOutColor;Eye Shadow Out  Color;35;0;Create;True;0;0;0;False;0;False;1,1,1,0;0.5566037,0.107645,0.107645,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;124;-1056.878,-1033.162;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;214;-1771.003,-1721.166;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;126;-620.8776,-1036.162;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;9;-1421.307,-105.7903;Float;False;Property;_ColorPow;Color Pow;21;0;Create;True;0;0;0;False;0;False;0;1;0;10;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;217;-668.8743,-2094.174;Float;False;Property;_BlushColor;Blush Color;37;0;Create;True;0;0;0;False;0;False;1,1,1,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;219;-830.3524,-1870.27;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;224;-1074.756,-1712.187;Inherit;True;4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;7;-1404.597,-489.9144;Float;False;Property;_BaseColorMul;BaseColorMul;22;0;Create;True;0;0;0;False;0;False;1,1,1,0;0.372549,0.4821379,0.6509804,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;119;-1809.385,-1132.132;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;12;-1342.003,-1245.533;Float;False;Property;_FemaleLipsNailIMaleBeardNailsColor;Female Lips/Nail I Male Beard/Nails Color;23;0;Create;True;0;0;0;False;0;False;1,1,1,0;0.5566037,0.107645,0.107645,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;223;-2124.684,-2256.538;Inherit;True;Property;_ExtraMask;Extra Mask;32;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;211;-2101.682,-1580.63;Inherit;False;Property;_BlushPower;Blush Power;38;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;212;-2106.89,-1863.396;Inherit;False;Property;_EyeShadowOutPower;Eye Shadow Out Power;36;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;120;-1767.527,-884.0588;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;210;-2106.71,-1730.954;Inherit;False;Property;_EyeShadowInPower;Eye Shadow In Power;34;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;21;-663.8802,-1247.952;Float;False;Property;_HairCapColor;HairCap Color;26;0;Create;True;0;0;0;False;0;False;0,0,0,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;121;-1788.955,-745.5;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;20;-940.8261,-1256.057;Float;False;Property;_FreaklesColor;Freakles Color;29;0;Create;True;0;0;0;False;0;False;0,0,0,0;1,1,1,0;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;116;-2103.416,-1026.289;Inherit;False;Property;_FemaleLipsNailIMaleBeardNailsPower;Female Lips/Nail I Male Beard/Nails Power;24;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;11;-2121.21,-1419.432;Inherit;True;Property;_Mask;Mask;10;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;115;-2098.208,-743.5226;Inherit;False;Property;_HairCapColorPower;HairCap Color Power;27;0;Create;True;0;0;0;False;0;False;0;0;0;5;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;218;-1812.861,-1969.24;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;167;-2405.028,-1372.821;Inherit;False;Constant;_max;max;40;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;166;-2418.772,-1509.179;Inherit;False;Constant;_min;min;40;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;44;581.072,-1283.94;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;192;-356.6633,-3313.379;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;71;-23.84647,-2484.303;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;169;223.4813,-2549.958;Inherit;False;Property;_HairCapRoughness;HairCap Roughness;28;0;Create;True;0;0;0;False;0;False;0.6;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;229;-2862.734,-517.4192;Inherit;False;AMSAlpha;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.LerpOp;225;-73.70215,-1838.035;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;189;-711.5787,-3341.12;Float;False;Property;_TattooBoots;Tattoo Boots;2;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;252;-864.2572,-66.60306;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.PowerNode;136;-1058.79,-307.5454;Inherit;False;True;2;0;COLOR;2,0,0,0;False;1;FLOAT;1;False;1;COLOR;0
Node;AmplifyShaderEditor.LerpOp;140;-485.7543,-559.9897;Inherit;True;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;66;-452.9776,-2325.213;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;69;-452.9776,-2454.398;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;57;-674.1805,-804.7922;Inherit;False;3;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;248;-671.8395,-74.68184;Inherit;False;SkinColor;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.ClampOpNode;226;-720.5319,-1676.702;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;222;-431.6552,-1708.9;Inherit;False;4;4;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;COLOR;0,0,0,0;False;3;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;43;729.5057,-1419.513;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;251;-1115.671,-5.717285;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;165;-681.916,-617.0463;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;65;-845.4449,-2703.599;Float;False;Property;_DirtBoots;Dirt Boots;5;0;Create;True;0;0;0;False;0;False;0;0;0;1;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;97;-821.817,-2395.084;Float;False;Property;_DirtRoughness_Power;DirtRoughness_Power;6;0;Create;True;0;0;0;False;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;63;-865.7389,-2593.036;Inherit;True;Property;_Dirt;Dirt;3;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;179;222.582,-1590.765;Inherit;True;Property;_ORM;ORM;9;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;221;-624.3525,-1873.27;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SamplerNode;190;-731.8729,-3230.557;Inherit;True;Property;_TattoMask;Tatto Mask;0;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;4;-1442.65,-308.3117;Inherit;True;Property;_SkinColor;Skin Color;8;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.LerpOp;220;-1060.353,-1870.27;Inherit;False;3;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;2;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;137;-868.0598,-418.015;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;173;2606.271,-1757.373;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ExtraPrePass;0;0;ExtraPrePass;5;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;0;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;177;790.2903,-848.5927;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Meta;0;4;Meta;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Meta;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;178;790.2903,-848.5927;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;Universal2D;0;5;Universal2D;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=Universal2D;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;175;790.2903,-848.5927;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ShadowCaster;0;2;ShadowCaster;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=ShadowCaster;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;195;790.2903,-788.5927;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthNormals;0;6;DepthNormals;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;0;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;False;;True;3;False;;False;True;1;LightMode=DepthNormals;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;176;790.2903,-848.5927;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;DepthOnly;0;3;DepthOnly;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;False;False;True;False;False;False;False;0;False;;False;False;False;False;False;False;False;False;False;True;1;False;;False;False;True;1;LightMode=DepthOnly;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;196;790.2903,-848.5927;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;GBuffer;0;7;GBuffer;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalGBuffer;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;259;2385.028,-775.712;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;SceneSelectionPass;0;8;SceneSelectionPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;2;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=SceneSelectionPass;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;260;2385.028,-775.712;Float;False;False;-1;2;UnityEditor.ShaderGraphLitGUI;0;1;New Amplify Shader;94348b07e5e8bab40bd6c8a1e3df54cd;True;ScenePickingPass;0;9;ScenePickingPass;0;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;1;LightMode=Picking;False;False;0;Hidden/InternalErrorShader;0;0;Standard;0;False;0
Node;AmplifyShaderEditor.CommentaryNode;261;-1760,1072;Inherit;False;870.2644;323.4664;Fine Tune;5;308;305;304;303;302;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;262;-3376,1056;Inherit;False;1571.341;399.7491;Electric Effect;8;301;295;294;293;292;291;290;289;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;263;-6416,576;Inherit;False;657.7256;497.1013;Tilling;7;287;286;285;284;283;282;281;;1,1,1,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;264;-5712,560;Inherit;False;2308.569;1226.168;Motion 4 ways Chaos;26;310;309;307;306;300;299;298;297;296;288;280;279;278;277;276;275;274;273;272;271;270;269;268;267;266;265;;1,1,1,1;0;0
Node;AmplifyShaderEditor.PannerNode;265;-4720,928;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;266;-4720,1120;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;267;-4720,1296;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.PannerNode;268;-4720,1472;Inherit;False;3;0;FLOAT2;0,0;False;2;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT2;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;269;-5168,1440;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleTimeNode;270;-5488,1520;Inherit;False;1;0;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;271;-5168,944;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleAddOpNode;272;-5168,1104;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleAddOpNode;273;-5168,1248;Inherit;False;2;2;0;FLOAT4;0,0,0,0;False;1;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;274;-5488,976;Inherit;False;Constant;_Float1;Float 1;2;0;Create;True;0;0;0;False;0;False;0.418;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;275;-4416,1136;Inherit;True;Property;_TextureSample1;Texture Sample 0;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;276;-4416,1360;Inherit;True;Property;_TextureSample2;Texture Sample 0;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SamplerNode;277;-4416,1568;Inherit;True;Property;_TextureSample3;Texture Sample 0;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleAddOpNode;278;-4048,1072;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;279;-4048,1504;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.SimpleAddOpNode;280;-3856,1264;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;281;-6368,624;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;282;-6288,768;Inherit;False;Property;_Tilling;Tilling;55;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;283;-6112,624;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;284;-6288,864;Inherit;False;Property;_UTilling;U Tilling;56;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;285;-6288,960;Inherit;False;Property;_VTilling;V Tilling;57;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;286;-6080,864;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;287;-5920,624;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;288;-3840,1568;Inherit;False;Property;_Divisor;Divisor;52;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;289;-3008,1120;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ComponentMaskNode;290;-3328,1264;Inherit;True;True;False;False;False;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;291;-3312,1120;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.NoiseGeneratorNode;292;-2800,1120;Inherit;False;Simplex2D;True;False;2;0;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;293;-2576,1120;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;294;-2304,1120;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;295;-2768,1264;Inherit;False;Property;_Number;Number;49;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SamplerNode;296;-4416,912;Inherit;True;Property;_TextureSample0;Texture Sample 0;2;0;Create;True;0;0;0;False;0;False;-1;None;None;True;0;False;white;Auto;False;Object;-1;Auto;Texture2D;8;0;SAMPLER2D;;False;1;FLOAT2;0,0;False;2;FLOAT;0;False;3;FLOAT2;0,0;False;4;FLOAT2;0,0;False;5;FLOAT;1;False;6;FLOAT;0;False;7;SAMPLERSTATE;;False;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;297;-3648,1264;Inherit;True;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.RangedFloatNode;298;-5664,1520;Inherit;False;Property;_TimeScale;Time Scale;50;0;Create;True;0;0;0;False;0;False;0.1;0.1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;299;-5488,1120;Inherit;False;Constant;_Float2;Float 2;2;0;Create;True;0;0;0;False;0;False;8.9;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;300;-5504,1264;Inherit;False;Constant;_Float3;Float 3;2;0;Create;True;0;0;0;False;0;False;0.65;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SinOpNode;301;-2080,1120;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.PowerNode;302;-1552,1120;Inherit;False;False;2;0;FLOAT;0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;303;-1280,1120;Inherit;False;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.ClampOpNode;304;-1072,1120;Inherit;False;3;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;305;-1456,1264;Inherit;False;Property;_Multi;Multi;53;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector4Node;306;-5200,656;Inherit;False;Constant;_SpeedConstant;Speed Constant;15;0;Create;True;0;0;0;False;0;False;1,-2,2,-1;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;307;-5200,1568;Inherit;False;Constant;_SpeedConstant1;Speed Constant;15;0;Create;True;0;0;0;False;0;False;1,0,2,-1;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;308;-1712,1280;Inherit;False;Property;_Pow;Pow;54;0;Create;True;0;0;0;False;0;False;5;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;309;-5456,1424;Inherit;False;Property;_Speed;Speed;51;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.TexturePropertyNode;310;-4752,704;Inherit;True;Property;_Pattern;Pattern;40;0;Create;True;0;0;0;False;0;False;db7f4ce1bb2d95d4e9b96b7dbe5a5fc8;db7f4ce1bb2d95d4e9b96b7dbe5a5fc8;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.TemplateMultiPassMasterNode;174;2385.028,-855.712;Float;False;True;-1;2;UnityEditor.ShaderGraphLitGUI;0;12;DawnShaderURP_V2/SkinURP;94348b07e5e8bab40bd6c8a1e3df54cd;True;Forward;0;1;Forward;19;False;False;False;False;False;False;False;False;False;False;False;False;True;0;False;;False;True;0;False;;False;False;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;4;RenderPipeline=UniversalPipeline;RenderType=Opaque=RenderType;Queue=Geometry=Queue=0;UniversalMaterialType=Lit;True;5;True;12;all;0;False;True;1;1;False;;0;False;;1;1;False;;0;False;;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;True;True;True;True;0;False;;False;False;False;False;False;False;False;True;False;255;False;;255;False;;255;False;;7;False;;1;False;;1;False;;1;False;;7;False;;1;False;;1;False;;1;False;;False;True;1;False;;True;3;False;;True;True;0;False;;0;False;;True;1;LightMode=UniversalForward;False;False;0;Hidden/InternalErrorShader;0;0;Standard;41;Workflow;1;0;Surface;0;0;  Refraction Model;0;0;  Blend;0;0;Two Sided;1;0;Fragment Normal Space,InvertActionOnDeselection;0;0;Forward Only;0;0;Transmission;1;0;  Transmission Shadow;0.5,False,;0;Translucency;1;0;  Translucency Strength;1,False,;0;  Normal Distortion;0.5,False,;0;  Scattering;2,False,;0;  Direct;0.9,False,;0;  Ambient;0.1,False,;0;  Shadow;0.5,False,;0;Cast Shadows;1;0;  Use Shadow Threshold;0;0;Receive Shadows;1;0;GPU Instancing;1;0;LOD CrossFade;1;0;Built-in Fog;1;0;_FinalColorxAlpha;0;0;Meta Pass;1;0;Override Baked GI;0;0;Extra Pre Pass;0;0;DOTS Instancing;0;0;Tessellation;0;0;  Phong;0;0;  Strength;0.5,False,;0;  Type;0;0;  Tess;16,False,;0;  Min;10,False,;0;  Max;25,False,;0;  Edge Length;16,False,;0;  Max Displacement;25,False,;0;Write Depth;0;0;  Early Z;0;0;Vertex Position,InvertActionOnDeselection;1;0;Debug Display;0;0;Clear Coat;0;0;0;10;False;True;True;True;True;True;True;True;True;True;False;;False;0
Node;AmplifyShaderEditor.StaticSwitch;312;-800,1120;Inherit;False;Property;_isBasicEmmision;is Basic Emmision;42;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;311;-1024,1408;Inherit;False;Constant;_Float0;Float 0;58;0;Create;True;0;0;0;False;0;False;1;0;0;0;0;1;FLOAT;0
WireConnection;67;0;65;0
WireConnection;67;1;63;1
WireConnection;183;0;182;0
WireConnection;183;1;113;0
WireConnection;93;1;94;0
WireConnection;93;5;96;0
WireConnection;171;0;141;0
WireConnection;171;1;166;0
WireConnection;171;2;167;0
WireConnection;254;1;193;0
WireConnection;254;0;246;0
WireConnection;155;0;154;0
WireConnection;155;1;147;0
WireConnection;155;2;163;1
WireConnection;155;3;312;0
WireConnection;94;0;95;0
WireConnection;113;0;179;3
WireConnection;158;0;152;0
WireConnection;158;1;150;0
WireConnection;158;2;163;3
WireConnection;158;3;312;0
WireConnection;246;0;193;0
WireConnection;246;1;253;0
WireConnection;246;2;247;0
WireConnection;141;0;170;0
WireConnection;141;1;128;0
WireConnection;141;2;11;1
WireConnection;193;0;227;0
WireConnection;193;1;191;0
WireConnection;193;2;192;0
WireConnection;157;0;148;0
WireConnection;157;1;149;0
WireConnection;157;2;163;2
WireConnection;157;3;312;0
WireConnection;170;0;71;0
WireConnection;170;1;169;0
WireConnection;170;2;11;3
WireConnection;202;0;161;0
WireConnection;235;0;234;0
WireConnection;208;0;239;0
WireConnection;198;0;194;0
WireConnection;200;0;255;0
WireConnection;204;0;256;0
WireConnection;206;0;179;1
WireConnection;234;1;236;0
WireConnection;234;0;231;0
WireConnection;227;1;140;0
WireConnection;227;0;225;0
WireConnection;239;1;183;0
WireConnection;239;0;237;0
WireConnection;161;0;160;0
WireConnection;161;1;159;0
WireConnection;194;0;70;0
WireConnection;255;1;92;0
WireConnection;255;0;38;0
WireConnection;237;0;183;0
WireConnection;237;1;244;0
WireConnection;237;2;242;0
WireConnection;70;0;254;0
WireConnection;70;1;68;0
WireConnection;70;2;67;0
WireConnection;92;0;38;0
WireConnection;92;1;93;0
WireConnection;257;0;171;0
WireConnection;257;1;179;2
WireConnection;257;2;258;0
WireConnection;231;0;236;0
WireConnection;231;1;233;3
WireConnection;231;2;233;1
WireConnection;159;0;155;0
WireConnection;159;1;157;0
WireConnection;159;2;158;0
WireConnection;68;0;197;0
WireConnection;68;1;65;0
WireConnection;256;1;171;0
WireConnection;256;0;257;0
WireConnection;123;0;119;0
WireConnection;123;1;120;0
WireConnection;123;2;121;0
WireConnection;215;0;211;0
WireConnection;215;1;223;3
WireConnection;125;1;20;0
WireConnection;125;2;11;2
WireConnection;124;1;12;0
WireConnection;124;2;11;1
WireConnection;214;0;210;0
WireConnection;214;1;223;2
WireConnection;126;1;21;0
WireConnection;126;2;11;3
WireConnection;219;1;213;0
WireConnection;219;2;223;2
WireConnection;224;0;218;0
WireConnection;224;1;214;0
WireConnection;224;2;215;0
WireConnection;224;3;123;0
WireConnection;119;0;116;0
WireConnection;119;1;11;1
WireConnection;120;0;117;0
WireConnection;120;1;11;2
WireConnection;121;0;115;0
WireConnection;121;1;11;3
WireConnection;218;0;212;0
WireConnection;218;1;223;1
WireConnection;44;0;26;0
WireConnection;44;1;3;4
WireConnection;192;0;190;1
WireConnection;192;1;189;0
WireConnection;71;0;43;0
WireConnection;71;1;69;0
WireConnection;71;2;66;0
WireConnection;229;0;233;1
WireConnection;225;0;137;0
WireConnection;225;1;222;0
WireConnection;225;2;226;0
WireConnection;252;0;4;0
WireConnection;252;1;251;0
WireConnection;136;0;7;0
WireConnection;136;1;9;0
WireConnection;140;0;137;0
WireConnection;140;1;57;0
WireConnection;140;2;165;0
WireConnection;66;0;65;0
WireConnection;66;1;63;1
WireConnection;69;0;97;0
WireConnection;69;1;65;0
WireConnection;57;0;124;0
WireConnection;57;1;125;0
WireConnection;57;2;126;0
WireConnection;248;0;252;0
WireConnection;226;0;224;0
WireConnection;226;1;166;0
WireConnection;226;2;167;0
WireConnection;222;0;220;0
WireConnection;222;1;219;0
WireConnection;222;2;221;0
WireConnection;222;3;57;0
WireConnection;43;0;44;0
WireConnection;43;1;179;2
WireConnection;251;0;250;0
WireConnection;165;0;123;0
WireConnection;165;1;166;0
WireConnection;165;2;167;0
WireConnection;221;1;217;0
WireConnection;221;2;223;3
WireConnection;220;1;216;0
WireConnection;220;2;223;1
WireConnection;137;0;136;0
WireConnection;137;1;4;0
WireConnection;265;0;287;0
WireConnection;265;2;306;1
WireConnection;265;1;269;0
WireConnection;266;0;271;0
WireConnection;266;2;306;0
WireConnection;266;1;269;0
WireConnection;267;0;272;0
WireConnection;267;2;307;4
WireConnection;267;1;269;0
WireConnection;268;0;273;0
WireConnection;268;2;307;0
WireConnection;268;1;269;0
WireConnection;269;0;309;0
WireConnection;269;1;270;0
WireConnection;270;0;298;0
WireConnection;271;0;287;0
WireConnection;271;1;274;0
WireConnection;272;0;287;0
WireConnection;272;1;299;0
WireConnection;273;0;287;0
WireConnection;273;1;300;0
WireConnection;275;0;310;0
WireConnection;275;1;266;0
WireConnection;276;0;310;0
WireConnection;276;1;267;0
WireConnection;277;0;310;0
WireConnection;277;1;268;0
WireConnection;278;0;296;0
WireConnection;278;1;275;0
WireConnection;279;0;276;0
WireConnection;279;1;277;0
WireConnection;280;0;278;0
WireConnection;280;1;279;0
WireConnection;283;0;281;0
WireConnection;283;1;282;0
WireConnection;286;0;284;0
WireConnection;286;1;285;0
WireConnection;287;0;283;0
WireConnection;287;1;286;0
WireConnection;289;0;291;0
WireConnection;289;1;290;0
WireConnection;290;0;297;0
WireConnection;292;0;289;0
WireConnection;293;0;292;0
WireConnection;293;1;295;0
WireConnection;294;0;293;0
WireConnection;296;0;310;0
WireConnection;296;1;265;0
WireConnection;297;0;280;0
WireConnection;297;1;288;0
WireConnection;301;0;294;0
WireConnection;302;0;301;0
WireConnection;302;1;308;0
WireConnection;303;0;302;0
WireConnection;303;1;305;0
WireConnection;304;0;303;0
WireConnection;174;0;199;0
WireConnection;174;1;201;0
WireConnection;174;2;203;0
WireConnection;174;3;243;0
WireConnection;174;4;205;0
WireConnection;174;5;207;0
WireConnection;174;14;209;0
WireConnection;174;15;90;0
WireConnection;312;1;304;0
WireConnection;312;0;311;0
ASEEND*/
//CHKSM=891C134734D4450E7711751FE2690745A4ACA0B1