// Shader created with Shader Forge v1.38 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.38;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,cgin:,lico:1,lgpr:1,limd:1,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,imps:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:False,fgod:False,fgor:False,fgmd:0,fgcr:0.5,fgcg:0.5,fgcb:0.5,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,atwp:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:False,fnfb:False,fsmp:False;n:type:ShaderForge.SFN_Final,id:4013,x:33489,y:32745,varname:node_4013,prsc:2|emission-5498-OUT;n:type:ShaderForge.SFN_Color,id:1304,x:32398,y:33434,ptovrint:False,ptlb:Color,ptin:_Color,varname:node_1304,prsc:2,glob:False,taghide:False,taghdr:True,tagprd:False,tagnsco:False,tagnrm:False,c1:1,c2:1,c3:1,c4:1;n:type:ShaderForge.SFN_Tex2d,id:2085,x:32398,y:32882,ptovrint:False,ptlb:node_2085,ptin:_node_2085,varname:node_2085,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:51367dfeea6195443b62d62e70f7435b,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Tex2d,id:9859,x:32398,y:33245,ptovrint:False,ptlb:node_9859,ptin:_node_9859,varname:node_9859,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:3a32cefb24d9e094d8f8ee1184d4df6f,ntxv:0,isnm:False|UVIN-6966-UVOUT;n:type:ShaderForge.SFN_Tex2d,id:5166,x:32398,y:33066,ptovrint:False,ptlb:node_5166,ptin:_node_5166,varname:node_5166,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,tex:ee80125071e22ab4685edef8eacb1af3,ntxv:0,isnm:False|UVIN-4795-UVOUT;n:type:ShaderForge.SFN_Panner,id:4795,x:32241,y:33066,varname:node_4795,prsc:2,spu:1,spv:0|UVIN-7775-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:7775,x:32067,y:33066,varname:node_7775,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:6966,x:32241,y:33245,varname:node_6966,prsc:2,spu:1,spv:1|UVIN-7775-UVOUT,DIST-7614-OUT;n:type:ShaderForge.SFN_Add,id:5019,x:32994,y:33046,varname:node_5019,prsc:2|A-2085-RGB,B-1440-OUT,C-5946-OUT;n:type:ShaderForge.SFN_Multiply,id:5498,x:33280,y:32950,varname:node_5498,prsc:2|A-2475-RGB,B-5019-OUT,C-2475-A;n:type:ShaderForge.SFN_VertexColor,id:2475,x:32994,y:32899,varname:node_2475,prsc:2;n:type:ShaderForge.SFN_Multiply,id:1440,x:32695,y:33063,varname:node_1440,prsc:2|A-2085-RGB,B-5166-RGB;n:type:ShaderForge.SFN_Multiply,id:5946,x:32695,y:33198,varname:node_5946,prsc:2|A-2085-RGB,B-9859-RGB,C-1304-RGB;n:type:ShaderForge.SFN_Sin,id:7614,x:31906,y:33280,varname:node_7614,prsc:2|IN-2621-TDB;n:type:ShaderForge.SFN_Time,id:2621,x:31734,y:33280,varname:node_2621,prsc:2;proporder:1304-2085-9859-5166;pass:END;sub:END;*/

Shader "Shader Forge/jueseqiehuangguangzhu" {
    Properties {
        [HDR]_Color ("Color", Color) = (1,1,1,1)
        _node_2085 ("node_2085", 2D) = "white" {}
        _node_9859 ("node_9859", 2D) = "white" {}
        _node_5166 ("node_5166", 2D) = "white" {}
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend One One
            Cull Off
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform float4 _Color;
            uniform sampler2D _node_2085; uniform float4 _node_2085_ST;
            uniform sampler2D _node_9859; uniform float4 _node_9859_ST;
            uniform sampler2D _node_5166; uniform float4 _node_5166_ST;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = UnityObjectToClipPos( v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
////// Emissive:
                float4 _node_2085_var = tex2D(_node_2085,TRANSFORM_TEX(i.uv0, _node_2085));
                float4 node_9750 = _Time;
                float2 node_4795 = (i.uv0+node_9750.g*float2(1,0));
                float4 _node_5166_var = tex2D(_node_5166,TRANSFORM_TEX(node_4795, _node_5166));
                float4 node_2621 = _Time;
                float2 node_6966 = (i.uv0+sin(node_2621.b)*float2(1,1));
                float4 _node_9859_var = tex2D(_node_9859,TRANSFORM_TEX(node_6966, _node_9859));
                float3 emissive = (i.vertexColor.rgb*(_node_2085_var.rgb+(_node_2085_var.rgb*_node_5166_var.rgb)+(_node_2085_var.rgb*_node_9859_var.rgb*_Color.rgb))*i.vertexColor.a);
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG(i.fogCoord, finalRGBA);
                return finalRGBA;
            }
            ENDCG
        }
        Pass {
            Name "ShadowCaster"
            Tags {
                "LightMode"="ShadowCaster"
            }
            Offset 1, 1
            Cull Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_SHADOWCASTER
            #include "UnityCG.cginc"
            #include "Lighting.cginc"
            #pragma fragmentoption ARB_precision_hint_fastest
            #pragma multi_compile_shadowcaster
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            struct VertexInput {
                float4 vertex : POSITION;
            };
            struct VertexOutput {
                V2F_SHADOW_CASTER;
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.pos = UnityObjectToClipPos( v.vertex );
                TRANSFER_SHADOW_CASTER(o)
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
                SHADOW_CASTER_FRAGMENT(i)
            }
            ENDCG
        }
    }
    FallBack "Diffuse"
    CustomEditor "ShaderForgeMaterialInspector"
}
