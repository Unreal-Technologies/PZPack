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
Mesh Cube
{
24;
0.029244;0.055698;0.0479448;,
-0.029244;0.055698;0.0479448;,
-0.029244;0.055698;-0.0479448;,
0.029244;0.055698;-0.0479448;,
0.029244;-0.000540;-0.0479448;,
0.029244;0.055698;-0.0479448;,
-0.029244;0.055698;-0.0479448;,
-0.029244;-0.000540;-0.0479448;,
-0.029244;-0.000540;-0.0479448;,
-0.029244;0.055698;-0.0479448;,
-0.029244;0.055698;0.0479448;,
-0.029244;-0.000540;0.0479448;,
-0.029244;-0.000540;0.0479448;,
0.029244;-0.000540;0.0479448;,
0.029244;-0.000540;-0.0479448;,
-0.029244;-0.000540;-0.0479448;,
0.029244;-0.000540;0.0479448;,
0.029244;0.055698;0.0479448;,
0.029244;0.055698;-0.0479448;,
0.029244;-0.000540;-0.0479448;,
-0.029244;-0.000540;0.0479448;,
-0.029244;0.055698;0.0479448;,
0.029244;0.055698;0.0479448;,
0.029244;-0.000540;0.0479448;;

6;
4;3,2,1,0;,
4;7,6,5,4;,
4;11,10,9,8;,
4;15,14,13,12;,
4;19,18,17,16;,
4;23,22,21,20;;

MeshNormals 
{
24;
0.000000;1.000000;-0.000000;,
0.000000;1.000000;-0.000000;,
0.000000;1.000000;-0.000000;,
0.000000;1.000000;-0.000000;,
0.000000;0.000000;-1.000000;,
0.000000;0.000000;-1.000000;,
0.000000;0.000000;-1.000000;,
0.000000;0.000000;-1.000000;,
-1.000000;0.000000;-0.000000;,
-1.000000;0.000000;-0.000000;,
-1.000000;0.000000;-0.000000;,
-1.000000;0.000000;-0.000000;,
0.000000;-1.000000;0.000000;,
0.000000;-1.000000;0.000000;,
0.000000;-1.000000;0.000000;,
0.000000;-1.000000;0.000000;,
1.000000;0.000000;-0.000000;,
1.000000;0.000000;-0.000000;,
1.000000;0.000000;-0.000000;,
1.000000;0.000000;-0.000000;,
0.000000;0.000000;1.000000;,
0.000000;0.000000;1.000000;,
0.000000;0.000000;1.000000;,
0.000000;0.000000;1.000000;;

6;
4;3,2,1,0;,
4;7,6,5,4;,
4;11,10,9,8;,
4;15,14,13,12;,
4;19,18,17,16;,
4;23,22,21,20;;
}
# UVMap
MeshTextureCoords 
{
24;
0.490840;0.733602;,
0.490840;0.505060;,
0.008560;0.505059;,
0.008560;0.733602;,
0.104614;0.665219;,
0.104614;0.534546;,
0.041497;0.534546;,
0.041497;0.665219;,
0.008560;0.734739;,
0.008560;0.578957;,
0.494340;0.578957;,
0.494340;0.734739;,
0.490840;0.505060;,
0.490840;0.733602;,
0.008560;0.733602;,
0.008560;0.505059;,
0.494340;0.734739;,
0.494340;0.578957;,
0.008560;0.578957;,
0.008560;0.734739;,
0.041497;0.665219;,
0.041497;0.534546;,
0.104614;0.534546;,
0.104614;0.665219;;
}
MeshMaterialList
{
1;
6;
0,
0,
0,
0,
0,
0;
Material Material
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


