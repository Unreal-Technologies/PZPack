xof 0302txt 0032
# Created by DodgeeSoftware's DirectX Model Exporter
# Website: www.dodgeesoftware.com
# Email: dodgeesoftware@gmail.com

template Header
{
    <3D82AB43-62DA-11cf-AB39-0020AF71E433>
    WORD major;
    WORD minor;
    DWORD flags;
}

template Vector
{
    <3D82AB5E-62DA-11cf-AB39-0020AF71E433>
    FLOAT x;
    FLOAT y;
    FLOAT z;
}

template Coords2d
{
    <F6F23F44-7686-11cf-8F52-0040333594A3>
    FLOAT u;
    FLOAT v;
}

template Matrix4x4
{
    <F6F23F45-7686-11cf-8F52-0040333594A3>
    array FLOAT matrix[16];
}

template ColorRGBA
{
    <35FF44E0-6C7C-11cf-8F52-0040333594A3>
    FLOAT red;
    FLOAT green;
    FLOAT blue;
    FLOAT alpha;
}

template ColorRGB
{
    <D3E16E81-7835-11cf-8F52-0040333594A3>
    FLOAT red;
    FLOAT green;
    FLOAT blue;
}

template TextureFilename
{
    <A42790E1-7810-11cf-8F52-0040333594A3>
    STRING filename;
}

template Material
{
    <3D82AB4D-62DA-11cf-AB39-0020AF71E433>
    ColorRGBA faceColor;
    FLOAT power;
    ColorRGB specularColor;
    ColorRGB emissiveColor;
    [...]
}

template MeshFace
{
    <3D82AB5F-62DA-11cf-AB39-0020AF71E433>
    DWORD nFaceVertexIndices;
    array DWORD faceVertexIndices[nFaceVertexIndices];
}

template MeshTextureCoords
{
    <F6F23F40-7686-11cf-8F52-0040333594A3>
    DWORD nTextureCoords;
    array Coords2d textureCoords[nTextureCoords];
}

template MeshMaterialList
{
    <F6F23F42-7686-11cf-8F52-0040333594A3>
    DWORD nMaterials;
    DWORD nFaceIndexes;
    array DWORD faceIndexes[nFaceIndexes];
    [Material]
}

template MeshNormals
{
    <F6F23F43-7686-11cf-8F52-0040333594A3>
    DWORD nNormals;
    array Vector normals[nNormals];
    DWORD nFaceNormals;
    array MeshFace faceNormals[nFaceNormals];
}

template Mesh
{
    <3D82AB44-62DA-11cf-AB39-0020AF71E433>
    DWORD nVertices;
    array Vector vertices[nVertices];
    DWORD nFaces;
    array MeshFace faces[nFaces];
    [...]
}

template FrameTransformMatrix
{
    <F6F23F41-7686-11cf-8F52-0040333594A3>
    Matrix4x4 frameMatrix;
}

template Frame
{
    <3D82AB46-62DA-11cf-AB39-0020AF71E433>
    [...]
}

template FloatKeys
{
    <10DD46A9-775B-11cf-8F52-0040333594A3>
    DWORD nValues;
    array FLOAT values[nValues];
}

template TimedFloatKeys
{
    <F406B180-7B3B-11cf-8F52-0040333594A3>
    DWORD time;
    FloatKeys tfkeys;
}

template AnimationKey
{
    <10DD46A8-775B-11cf-8F52-0040333594A3>
    DWORD keyType;
    DWORD nKeys;
    array TimedFloatKeys keys[nKeys];
}

template AnimationOptions
{
    <E2BF56C0-840F-11cf-8F52-0040333594A3>
    DWORD openclosed;
    DWORD positionquality;
}

template Animation
{
    <3D82AB4F-62DA-11cf-AB39-0020AF71E433>
    [...]
}

template AnimationSet
{
    <3D82AB50-62DA-11cf-AB39-0020AF71E433>
    [Animation]
}

template XSkinMeshHeader
{
    <3cf169ce-ff7c-44ab-93c0-f78f62d172e2>
    WORD nMaxSkinWeightsPerVertex;
    WORD nMaxSkinWeightsPerFace;
    WORD nBones;
}

template VertexDuplicationIndices
{
    <b8d65549-d7c9-4995-89cf-53a9a8b031e3>
    DWORD nIndices;
    DWORD nOriginalVertices;
    array DWORD indices[nIndices];
}

template SkinWeights
{
    <6f0d123b-bad2-4167-a0d0-80224f25fabb>
    STRING transformNodeName;
    DWORD nWeights;
    array DWORD vertexIndices[nWeights];
    array FLOAT weights[nWeights];
    Matrix4x4 matrixOffset;
}

# Cube
Frame
{
FrameTransformMatrix
{
1.000000,0.000000,0.000000,0.000000,
0.000000,1.000000,0.000000,0.000000,
0.000000,0.000000,1.000000,0.000000,
0.000000,0.000000,0.000000,1.000000;;
}
Mesh Cube.001
{
50;
-0.000001;-0.000007;-0.00005413;,
0.004210;-0.000007;0.00707213;,
0.007288;-0.000007;0.00000613;,
-0.000001;-0.000007;-0.00005413;,
-0.004212;-0.000007;-0.00724013;,
-0.007291;-0.000007;0.00000613;,
0.004210;-0.000007;0.00707213;,
-0.004212;-0.000007;0.00707213;,
-0.004213;0.057338;0.00707213;,
0.004209;0.057338;0.00707213;,
-0.004212;-0.000007;-0.00724013;,
0.004210;-0.000007;-0.00724013;,
0.004209;0.057338;-0.00723913;,
-0.004213;0.057338;-0.00723913;,
-0.000001;-0.000007;-0.00005413;,
0.007288;-0.000007;0.00000613;,
0.004210;-0.000007;-0.00724013;,
-0.000001;-0.000007;-0.00005413;,
0.004210;-0.000007;-0.00724013;,
-0.004212;-0.000007;-0.00724013;,
-0.000001;-0.000007;-0.00005413;,
-0.004212;-0.000007;0.00707213;,
0.004210;-0.000007;0.00707213;,
-0.000001;-0.000007;-0.00005413;,
-0.007291;-0.000007;0.00000613;,
-0.004212;-0.000007;0.00707213;,
0.004209;0.057338;-0.00723913;,
0.007288;0.057338;0.00000713;,
-0.007291;0.057338;0.00000713;,
-0.004213;0.057338;-0.00723913;,
-0.007291;0.057338;0.00000713;,
0.007288;0.057338;0.00000713;,
0.004209;0.057338;0.00707213;,
-0.004213;0.057338;0.00707213;,
-0.004212;-0.000007;0.00707213;,
-0.007291;-0.000007;0.00000613;,
-0.007291;0.057338;0.00000713;,
-0.004213;0.057338;0.00707213;,
-0.007291;-0.000007;0.00000613;,
-0.004212;-0.000007;-0.00724013;,
-0.004213;0.057338;-0.00723913;,
-0.007291;0.057338;0.00000713;,
0.007288;-0.000007;0.00000613;,
0.004210;-0.000007;0.00707213;,
0.004209;0.057338;0.00707213;,
0.007288;0.057338;0.00000713;,
0.004210;-0.000007;-0.00724013;,
0.007288;-0.000007;0.00000613;,
0.007288;0.057338;0.00000713;,
0.004209;0.057338;-0.00723913;;

14;
3;2,1,0;,
3;5,4,3;,
4;9,8,7,6;,
4;13,12,11,10;,
3;16,15,14;,
3;19,18,17;,
3;22,21,20;,
3;25,24,23;,
4;29,28,27,26;,
4;33,32,31,30;,
4;37,36,35,34;,
4;41,40,39,38;,
4;45,44,43,42;,
4;49,48,47,46;;

MeshNormals 
{
50;
-0.000010;-1.000000;-0.000004;,
-0.000010;-1.000000;-0.000004;,
-0.000010;-1.000000;-0.000004;,
0.000010;-1.000000;0.000014;,
0.000010;-1.000000;0.000014;,
0.000010;-1.000000;0.000014;,
-0.000000;-0.000010;1.000000;,
-0.000000;-0.000010;1.000000;,
-0.000000;-0.000010;1.000000;,
-0.000000;-0.000010;1.000000;,
-0.000000;0.000010;-1.000000;,
-0.000000;0.000010;-1.000000;,
-0.000000;0.000010;-1.000000;,
-0.000000;0.000010;-1.000000;,
-0.000010;-1.000000;-0.000035;,
-0.000010;-1.000000;-0.000035;,
-0.000010;-1.000000;-0.000035;,
0.000042;-1.000000;-0.000005;,
0.000042;-1.000000;-0.000005;,
0.000042;-1.000000;-0.000005;,
0.000008;-1.000000;-0.000015;,
0.000008;-1.000000;-0.000015;,
0.000008;-1.000000;-0.000015;,
0.000010;-1.000000;-0.000014;,
0.000010;-1.000000;-0.000014;,
0.000010;-1.000000;-0.000014;,
-0.000014;1.000000;0.000012;,
-0.000014;1.000000;0.000012;,
-0.000014;1.000000;0.000012;,
-0.000014;1.000000;0.000012;,
-0.000003;1.000000;0.000005;,
-0.000003;1.000000;0.000005;,
-0.000003;1.000000;0.000005;,
-0.000003;1.000000;0.000005;,
-0.916772;-0.000015;0.399410;,
-0.916772;-0.000015;0.399410;,
-0.916772;-0.000015;0.399410;,
-0.916772;-0.000015;0.399410;,
-0.920391;-0.000008;-0.390999;,
-0.920391;-0.000008;-0.390999;,
-0.920391;-0.000008;-0.390999;,
-0.920391;-0.000008;-0.390999;,
0.916766;0.000008;0.399424;,
0.916766;0.000008;0.399424;,
0.916766;0.000008;0.399424;,
0.916766;0.000008;0.399424;,
0.920391;0.000015;-0.391000;,
0.920391;0.000015;-0.391000;,
0.920391;0.000015;-0.391000;,
0.920391;0.000015;-0.391000;;

14;
3;2,1,0;,
3;5,4,3;,
4;9,8,7,6;,
4;13,12,11,10;,
3;16,15,14;,
3;19,18,17;,
3;22,21,20;,
3;25,24,23;,
4;29,28,27,26;,
4;33,32,31,30;,
4;37,36,35,34;,
4;41,40,39,38;,
4;45,44,43,42;,
4;49,48,47,46;;
}
# UVMap
MeshTextureCoords 
{
50;
0.500012;0.750071;,
0.631380;0.527767;,
0.727417;0.748194;,
0.500012;0.750071;,
0.368638;0.974251;,
0.272605;0.748193;,
0.016356;0.001113;,
0.016355;0.001113;,
0.983639;0.001093;,
0.983641;0.001093;,
0.016355;0.523976;,
0.016361;0.523976;,
0.983645;0.523956;,
0.983639;0.523956;,
0.500012;0.750071;,
0.727417;0.748194;,
0.631384;0.974251;,
0.500012;0.750071;,
0.631384;0.974251;,
0.368638;0.974251;,
0.500012;0.750071;,
0.368638;0.527767;,
0.631380;0.527767;,
0.500012;0.750071;,
0.272605;0.748193;,
0.368638;0.527767;,
0.631362;0.974233;,
0.727395;0.748176;,
0.272583;0.748176;,
0.368616;0.974233;,
0.272583;0.748176;,
0.727395;0.748176;,
0.631357;0.527749;,
0.368616;0.527749;,
0.016355;0.001113;,
0.016356;0.259248;,
0.983641;0.259227;,
0.983639;0.001093;,
0.016356;0.259248;,
0.016355;0.523976;,
0.983639;0.523956;,
0.983641;0.259227;,
0.016356;0.259248;,
0.016356;0.001113;,
0.983641;0.001093;,
0.983641;0.259227;,
0.016361;0.523976;,
0.016356;0.259248;,
0.983641;0.259227;,
0.983645;0.523956;;
}
MeshMaterialList
{
1;
14;
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0,
0;
Material Material.001
{
# Exporter deliberately and only supports the Specular Material Node in the Shader Graph 
1.000000;1.000000;1.000000;1.000000;;
200.000000;
1.000000;1.000000;1.000000;;
0.000000;0.000000;0.000000;;
}
}
}
}


