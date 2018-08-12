struct VertexIn
{
    float3 Position : POSITION0;
    float3 Normal : NORMAL0;
    float4 Colour : COLOR0;
    float2 Texture : TEXCOORD0;
};

struct FragmentIn
{
    float4 fPosition : SV_Position;
    float4 fNormal : NORMAL0;
    float4 fColour : COLOR0;
    float2 fTexture : TEXCOORD0;
};

cbuffer Projection
{
    matrix Model;
    matrix View;
    matrix Projection;
};

FragmentIn main(VertexIn input)
{
    matrix tModel = transpose(Model);
    matrix tView = transpose(View);
    matrix tProjection = transpose(Projection);

    FragmentIn output;

    float4 position = float4(input.Position, 1);
    float4 normal = float4(input.Normal, 1);

    float4 modelPos = mul(position, tModel);
    float4 cameraPos = mul(modelPos, tView);
    float4 viewportPos = mul(cameraPos, tProjection);

    output.fPosition = viewportPos;
    output.fNormal = normal;
    output.fColour = input.Colour;
    output.fTexture = input.Texture;

    return output;
}
