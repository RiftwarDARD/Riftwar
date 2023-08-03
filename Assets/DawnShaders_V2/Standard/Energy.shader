// Made with Amplify Shader Editor v1.9.1.5
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DawnShader_V2/Energy"
{
	Properties
	{
		_EmmisiveBoost("Emmisive Boost", Float) = 50
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
		[Toggle(_FLIPSIDE_ON)] _Flipside("Flip side", Float) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		[HideInInspector] __dirty( "", Int ) = 1
	}

	SubShader
	{
		Tags{ "RenderType" = "Transparent"  "Queue" = "AlphaTest+0" "IgnoreProjector" = "True" "IsEmissive" = "true"  }
		Cull Back
		Blend OneMinusDstColor One
		
		CGINCLUDE
		#include "UnityShaderVariables.cginc"
		#include "UnityPBSLighting.cginc"
		#include "Lighting.cginc"
		#pragma target 3.0
		#pragma shader_feature_local _FLIPSIDE_ON
		struct Input
		{
			float2 uv_texcoord;
			half ASEIsFrontFacing : VFACE;
		};

		uniform sampler2D _Pattern;
		uniform float _Speed;
		uniform float _TimeScale;
		uniform float _Tilling;
		uniform float _UTilling;
		uniform float _VTilling;
		uniform float _Divisor;
		uniform float _Number;
		uniform float _Pow;
		uniform float _Multi;
		uniform float3 _Direction;
		uniform float _Meshsize;
		uniform float4 _EmissiveColor;
		uniform float _EmmisiveBoost;


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


		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			float mulTime16 = _Time.y * _TimeScale;
			float temp_output_14_0 = ( _Speed * mulTime16 );
			float4 _SpeedConstant = float4(1,-2,2,-1);
			float2 temp_cast_0 = (_SpeedConstant.x).xx;
			float4 appendResult40 = (float4(_UTilling , _VTilling , 0.0 , 0.0));
			float4 temp_output_41_0 = ( float4( ( v.texcoord.xy * _Tilling ), 0.0 , 0.0 ) * appendResult40 );
			float2 panner10 = ( temp_output_14_0 * temp_cast_0 + temp_output_41_0.xy);
			float2 panner11 = ( temp_output_14_0 * _SpeedConstant.xy + ( temp_output_41_0 + 0.418 ).xy);
			float4 _SpeedConstant1 = float4(1,0,2,-1);
			float2 temp_cast_6 = (_SpeedConstant1.w).xx;
			float2 panner12 = ( temp_output_14_0 * temp_cast_6 + ( temp_output_41_0 + 8.9 ).xy);
			float2 panner13 = ( temp_output_14_0 * _SpeedConstant1.xy + ( temp_output_41_0 + 0.65 ).xy);
			float simplePerlin2D53 = snoise( ( v.texcoord.xy + (( ( ( tex2Dlod( _Pattern, float4( panner10, 0, 0.0) ) + tex2Dlod( _Pattern, float4( panner11, 0, 0.0) ) ) + ( tex2Dlod( _Pattern, float4( panner12, 0, 0.0) ) + tex2Dlod( _Pattern, float4( panner13, 0, 0.0) ) ) ) * _Divisor )).r ) );
			simplePerlin2D53 = simplePerlin2D53*0.5 + 0.5;
			float clampResult62 = clamp( ( pow( sin( frac( ( simplePerlin2D53 * _Number ) ) ) , _Pow ) * _Multi ) , 0.0 , 1.0 );
			float3 ase_vertexNormal = v.normal.xyz;
			float3 temp_cast_12 = (_Meshsize).xxx;
			float3 VertexOffset81 = ( clampResult62 * max( ( ase_vertexNormal * _Direction ) , temp_cast_12 ) );
			v.vertex.xyz += VertexOffset81;
			v.vertex.w = 1;
		}

		inline half4 LightingUnlit( SurfaceOutput s, half3 lightDir, half atten )
		{
			return half4 ( 0, 0, 0, s.Alpha );
		}

		void surf( Input i , inout SurfaceOutput o )
		{
			float mulTime16 = _Time.y * _TimeScale;
			float temp_output_14_0 = ( _Speed * mulTime16 );
			float4 _SpeedConstant = float4(1,-2,2,-1);
			float2 temp_cast_0 = (_SpeedConstant.x).xx;
			float4 appendResult40 = (float4(_UTilling , _VTilling , 0.0 , 0.0));
			float4 temp_output_41_0 = ( float4( ( i.uv_texcoord * _Tilling ), 0.0 , 0.0 ) * appendResult40 );
			float2 panner10 = ( temp_output_14_0 * temp_cast_0 + temp_output_41_0.xy);
			float2 panner11 = ( temp_output_14_0 * _SpeedConstant.xy + ( temp_output_41_0 + 0.418 ).xy);
			float4 _SpeedConstant1 = float4(1,0,2,-1);
			float2 temp_cast_6 = (_SpeedConstant1.w).xx;
			float2 panner12 = ( temp_output_14_0 * temp_cast_6 + ( temp_output_41_0 + 8.9 ).xy);
			float2 panner13 = ( temp_output_14_0 * _SpeedConstant1.xy + ( temp_output_41_0 + 0.65 ).xy);
			float simplePerlin2D53 = snoise( ( i.uv_texcoord + (( ( ( tex2D( _Pattern, panner10 ) + tex2D( _Pattern, panner11 ) ) + ( tex2D( _Pattern, panner12 ) + tex2D( _Pattern, panner13 ) ) ) * _Divisor )).r ) );
			simplePerlin2D53 = simplePerlin2D53*0.5 + 0.5;
			float clampResult62 = clamp( ( pow( sin( frac( ( simplePerlin2D53 * _Number ) ) ) , _Pow ) * _Multi ) , 0.0 , 1.0 );
			float4 Emiisive82 = ( ( _EmissiveColor * clampResult62 ) * _EmmisiveBoost );
			o.Emission = Emiisive82.rgb;
			#ifdef _FLIPSIDE_ON
				float staticSwitch80 = ( ( 1.0 - (i.ASEIsFrontFacing > 0 ? +1 : -1 ) ) * clampResult62 );
			#else
				float staticSwitch80 = clampResult62;
			#endif
			float Opacity63 = staticSwitch80;
			o.Alpha = Opacity63;
		}

		ENDCG
		CGPROGRAM
		#pragma surface surf Unlit keepalpha fullforwardshadows noshadow vertex:vertexDataFunc 

		ENDCG
		Pass
		{
			Name "ShadowCaster"
			Tags{ "LightMode" = "ShadowCaster" }
			ZWrite On
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			#pragma target 3.0
			#pragma multi_compile_shadowcaster
			#pragma multi_compile UNITY_PASS_SHADOWCASTER
			#pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
			#include "HLSLSupport.cginc"
			#if ( SHADER_API_D3D11 || SHADER_API_GLCORE || SHADER_API_GLES || SHADER_API_GLES3 || SHADER_API_METAL || SHADER_API_VULKAN )
				#define CAN_SKIP_VPOS
			#endif
			#include "UnityCG.cginc"
			#include "Lighting.cginc"
			#include "UnityPBSLighting.cginc"
			sampler3D _DitherMaskLOD;
			struct v2f
			{
				V2F_SHADOW_CASTER;
				float2 customPack1 : TEXCOORD1;
				float3 worldPos : TEXCOORD2;
				UNITY_VERTEX_INPUT_INSTANCE_ID
				UNITY_VERTEX_OUTPUT_STEREO
			};
			v2f vert( appdata_full v )
			{
				v2f o;
				UNITY_SETUP_INSTANCE_ID( v );
				UNITY_INITIALIZE_OUTPUT( v2f, o );
				UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO( o );
				UNITY_TRANSFER_INSTANCE_ID( v, o );
				Input customInputData;
				vertexDataFunc( v, customInputData );
				float3 worldPos = mul( unity_ObjectToWorld, v.vertex ).xyz;
				half3 worldNormal = UnityObjectToWorldNormal( v.normal );
				o.customPack1.xy = customInputData.uv_texcoord;
				o.customPack1.xy = v.texcoord;
				o.worldPos = worldPos;
				TRANSFER_SHADOW_CASTER_NORMALOFFSET( o )
				return o;
			}
			half4 frag( v2f IN
			#if !defined( CAN_SKIP_VPOS )
			, UNITY_VPOS_TYPE vpos : VPOS
			#endif
			) : SV_Target
			{
				UNITY_SETUP_INSTANCE_ID( IN );
				Input surfIN;
				UNITY_INITIALIZE_OUTPUT( Input, surfIN );
				surfIN.uv_texcoord = IN.customPack1.xy;
				float3 worldPos = IN.worldPos;
				half3 worldViewDir = normalize( UnityWorldSpaceViewDir( worldPos ) );
				SurfaceOutput o;
				UNITY_INITIALIZE_OUTPUT( SurfaceOutput, o )
				surf( surfIN, o );
				#if defined( CAN_SKIP_VPOS )
				float2 vpos = IN.pos;
				#endif
				half alphaRef = tex3D( _DitherMaskLOD, float3( vpos.xy * 0.25, o.Alpha * 0.9375 ) ).a;
				clip( alphaRef - 0.01 );
				SHADOW_CASTER_FRAGMENT( IN )
			}
			ENDCG
		}
	}
	Fallback "Diffuse"
	CustomEditor "ASEMaterialInspector"
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
Node;AmplifyShaderEditor.RangedFloatNode;37;-4558.076,-1335.913;Inherit;False;Property;_Tilling;Tilling;10;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;36;-4379.668,-1468.467;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.RangedFloatNode;39;-4548.076,-1226.913;Inherit;False;Property;_UTilling;U Tilling;12;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;38;-4548.076,-1137.913;Inherit;False;Property;_VTilling;V Tilling;11;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.DynamicAppendNode;40;-4344.075,-1240.913;Inherit;False;FLOAT4;4;0;FLOAT;0;False;1;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;41;-4186.076,-1468.912;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.RangedFloatNode;33;-2101.993,-532.5673;Inherit;False;Property;_Divisor;Divisor;5;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleAddOpNode;44;-1269.185,-978.5034;Inherit;False;2;2;0;FLOAT2;0,0;False;1;FLOAT;0;False;1;FLOAT2;0
Node;AmplifyShaderEditor.ComponentMaskNode;47;-1594.995,-832.6997;Inherit;True;True;False;False;False;1;0;COLOR;0,0,0,0;False;1;FLOAT;0
Node;AmplifyShaderEditor.TextureCoordinatesNode;9;-1572.08,-977.8276;Inherit;False;0;-1;2;3;2;SAMPLER2D;;False;0;FLOAT2;1,1;False;1;FLOAT2;0,0;False;5;FLOAT2;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.NoiseGeneratorNode;53;-1060.32,-983.3242;Inherit;False;Simplex2D;True;False;2;0;FLOAT2;0,0;False;1;FLOAT;1;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;55;-835.3198,-977.3242;Inherit;True;2;2;0;FLOAT;0;False;1;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.FractNode;56;-564.515,-978.1969;Inherit;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;54;-1025.32,-840.3242;Inherit;False;Property;_Number;Number;7;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
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
Node;AmplifyShaderEditor.RangedFloatNode;60;275.1769,-827.7798;Inherit;False;Property;_Multi;Multi;9;0;Create;True;0;0;0;False;0;False;1;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.Vector3Node;90;263.5632,-470.0349;Inherit;False;Property;_Direction;Direction;14;0;Create;True;0;0;0;False;0;False;0.01,0.01,0.01;0.01,0.01,0.01;0;4;FLOAT3;0;FLOAT;1;FLOAT;2;FLOAT;3
Node;AmplifyShaderEditor.Vector4Node;95;-3463.167,-1447.68;Inherit;False;Constant;_SpeedConstant;Speed Constant;15;0;Create;True;0;0;0;False;0;False;1,-2,2,-1;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.Vector4Node;98;-3462.853,-531.7484;Inherit;False;Constant;_SpeedConstant1;Speed Constant;15;0;Create;True;0;0;0;False;0;False;1,0,2,-1;0,0,0,0;0;5;FLOAT4;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.RangedFloatNode;89;1022.327,-1088.708;Inherit;False;Property;_EmmisiveBoost;Emmisive Boost;0;0;Create;True;0;0;0;False;0;False;50;50;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;72;507.2221,-465.3104;Inherit;False;Property;_Meshsize;Mesh size;13;0;Create;True;0;0;0;False;0;False;0.03;0.03;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;59;21.86117,-823.2155;Inherit;False;Property;_Pow;Pow;8;0;Create;True;0;0;0;False;0;False;5;5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;15;-3725.148,-665.234;Inherit;False;Property;_Speed;Speed;2;0;Create;True;0;0;0;False;0;False;0.5;0.5;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.ColorNode;66;559.7941,-1248.543;Inherit;False;Property;_EmissiveColor;Emissive Color;1;0;Create;True;0;0;0;False;0;False;0.4858491,0.8229298,1,0;0.3537736,0.6568573,1,1;True;0;5;COLOR;0;FLOAT;1;FLOAT;2;FLOAT;3;FLOAT;4
Node;AmplifyShaderEditor.TexturePropertyNode;25;-3019.208,-1386.385;Inherit;True;Property;_Pattern;Pattern;4;0;Create;True;0;0;0;False;0;False;db7f4ce1bb2d95d4e9b96b7dbe5a5fc8;db7f4ce1bb2d95d4e9b96b7dbe5a5fc8;False;white;Auto;Texture2D;-1;0;2;SAMPLER2D;0;SAMPLERSTATE;1
Node;AmplifyShaderEditor.RegisterLocalVarNode;82;1574.227,-1251.311;Inherit;False;Emiisive;-1;True;1;0;COLOR;0,0,0,0;False;1;COLOR;0
Node;AmplifyShaderEditor.TwoSidedSign;75;649.2218,-1536.311;Inherit;False;0;1;FLOAT;0
Node;AmplifyShaderEditor.OneMinusNode;76;856.2224,-1535.311;Inherit;False;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.SimpleMultiplyOpNode;88;1328.328,-1245.708;Inherit;False;2;2;0;COLOR;0,0,0,0;False;1;FLOAT;0;False;1;COLOR;0
Node;AmplifyShaderEditor.StaticSwitch;80;1298.526,-1383.31;Inherit;False;Property;_Flipside;Flip side;15;0;Create;True;0;0;0;False;0;False;0;0;0;True;;Toggle;2;Key0;Key1;Create;True;True;All;9;1;FLOAT;0;False;0;FLOAT;0;False;2;FLOAT;0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT;0;False;7;FLOAT;0;False;8;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.RegisterLocalVarNode;63;1576.084,-1381.965;Inherit;False;Opacity;-1;True;1;0;FLOAT;0;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;87;679.9628,288.4455;Inherit;False;81;VertexOffset;1;0;OBJECT;;False;1;FLOAT3;0
Node;AmplifyShaderEditor.GetLocalVarNode;86;698.6964,205.9165;Inherit;False;63;Opacity;1;0;OBJECT;;False;1;FLOAT;0
Node;AmplifyShaderEditor.GetLocalVarNode;85;697.6964,112.9165;Inherit;False;82;Emiisive;1;0;OBJECT;;False;1;COLOR;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;99;935.6411,32.22744;Float;False;True;-1;2;ASEMaterialInspector;0;0;Unlit;DawnShader_V2/Energy;False;False;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;False;Back;0;False;;0;False;;False;0;False;;0;False;;False;0;Custom;1;True;True;0;True;Transparent;;AlphaTest;All;12;all;True;True;True;True;0;False;;False;0;False;;255;False;;255;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;0;False;;False;2;15;10;25;False;0.5;False;5;4;False;;1;False;;0;1;False;;1;False;;0;False;;0;False;;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;True;Relative;0;;6;-1;-1;-1;0;False;0;0;False;;-1;0;False;;0;0;0;False;0.1;False;;0;False;;False;15;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
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
WireConnection;99;2;85;0
WireConnection;99;9;86;0
WireConnection;99;11;87;0
ASEEND*/
//CHKSM=D14AD89E8568726FCB6FED440767E606DBF287A7