﻿Shader "Custom/texture"
{
    Properties
    {
        _MainTex("Texture", 2D) = "white"{}
    }
    SubShader
    {
        Tags { "RenderType"="Opaque" }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard fullforwardshadows

        // Use shader model 3.0 target, to get nicer looking lighting
        #pragma target 3.0

        struct Input
        {
            float2 uv_MainTex;
        };

        sampler2D _MainTex;
        float _Ratio;
        float _Alpha;

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            fixed4 color = tex2D(_MainTex, IN.uv_MainTex);
            float garayScale = color.r * 0.3 + color.g * 0.6 + color.b * 0.1;

            o.Albedo = fixed3(garayScale, garayScale, garayScale);
        }
        ENDCG
    }
    FallBack "Diffuse"
}
