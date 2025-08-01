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
40;
0.011066;0.011520;0.02647712;,
-0.008597;0.011520;0.02025512;,
-0.008976;0.011520;-0.04087412;,
0.010808;0.011520;-0.03461312;,
0.010808;0.000189;-0.03461312;,
0.010808;0.011520;-0.03461312;,
-0.008976;0.011520;-0.04087412;,
-0.008976;0.000189;-0.04087412;,
-0.008976;0.000189;-0.04087412;,
-0.008976;0.011520;-0.04087412;,
-0.008597;0.011520;0.02025512;,
-0.008597;0.000189;0.02025512;,
-0.008597;0.000189;0.02025512;,
0.011066;0.000189;0.02647712;,
0.010808;0.000189;-0.03461312;,
-0.008976;0.000189;-0.04087412;,
0.011066;0.000189;0.02647712;,
0.011066;0.011520;0.02647712;,
0.010808;0.011520;-0.03461312;,
0.010808;0.000189;-0.03461312;,
0.011066;0.011520;0.02647712;,
0.011066;0.000189;0.02647712;,
0.003308;0.002035;0.03748112;,
0.003308;0.009674;0.03748112;,
-0.008581;0.002035;0.03371912;,
-0.008581;0.009674;0.03371912;,
0.003308;0.009674;0.03748112;,
0.003308;0.002035;0.03748112;,
-0.008597;0.000189;0.02025512;,
-0.008597;0.011520;0.02025512;,
-0.008581;0.009674;0.03371912;,
-0.008581;0.002035;0.03371912;,
0.011066;0.000189;0.02647712;,
-0.008597;0.000189;0.02025512;,
-0.008581;0.002035;0.03371912;,
0.003308;0.002035;0.03748112;,
-0.008597;0.011520;0.02025512;,
0.011066;0.011520;0.02647712;,
0.003308;0.009674;0.03748112;,
-0.008581;0.009674;0.03371912;;

10;
4;3,2,1,0;,
4;7,6,5,4;,
4;11,10,9,8;,
4;15,14,13,12;,
4;19,18,17,16;,
4;23,22,21,20;,
4;27,26,25,24;,
4;31,30,29,28;,
4;35,34,33,32;,
4;39,38,37,36;;

MeshNormals 
{
40;
0.000000;1.000000;-0.000000;,
0.000000;1.000000;-0.000000;,
0.000000;1.000000;-0.000000;,
0.000000;1.000000;-0.000000;,
0.301684;0.000000;-0.953408;,
0.301684;0.000000;-0.953408;,
0.301684;0.000000;-0.953408;,
0.301684;0.000000;-0.953408;,
-0.999981;0.000000;0.006202;,
-0.999981;0.000000;0.006202;,
-0.999981;0.000000;0.006202;,
-0.999981;0.000000;0.006202;,
0.000000;-1.000000;0.000000;,
0.000000;-1.000000;0.000000;,
0.000000;-1.000000;0.000000;,
0.000000;-1.000000;0.000000;,
0.999991;0.000000;-0.004224;,
0.999991;0.000000;-0.004224;,
0.999991;0.000000;-0.004224;,
0.999991;0.000000;-0.004224;,
0.817292;0.000000;0.576224;,
0.817292;0.000000;0.576224;,
0.817292;0.000000;0.576224;,
0.817292;0.000000;0.576224;,
-0.301684;0.000000;0.953408;,
-0.301684;0.000000;0.953408;,
-0.301684;0.000000;0.953408;,
-0.301684;0.000000;0.953408;,
-0.999999;0.000000;0.001183;,
-0.999999;0.000000;0.001183;,
-0.999999;0.000000;0.001183;,
-0.999999;0.000000;0.001183;,
-0.042946;-0.989816;0.135723;,
-0.042946;-0.989816;0.135723;,
-0.042946;-0.989816;0.135723;,
-0.042946;-0.989816;0.135723;,
-0.042946;0.989816;0.135723;,
-0.042946;0.989816;0.135723;,
-0.042946;0.989816;0.135723;,
-0.042946;0.989816;0.135723;;

10;
4;3,2,1,0;,
4;7,6,5,4;,
4;11,10,9,8;,
4;15,14,13,12;,
4;19,18,17,16;,
4;23,22,21,20;,
4;27,26,25,24;,
4;31,30,29,28;,
4;35,34,33,32;,
4;39,38,37,36;;
}
# UVMap
MeshTextureCoords 
{
40;
0.203486;0.179109;,
0.255338;0.179109;,
0.255338;0.127257;,
0.203486;0.127257;,
0.151633;0.127257;,
0.203486;0.127257;,
0.203486;0.075404;,
0.151633;0.075404;,
0.151633;0.282815;,
0.203486;0.282815;,
0.203486;0.230962;,
0.151633;0.230962;,
0.099780;0.179109;,
0.151633;0.179109;,
0.151633;0.127257;,
0.099780;0.127257;,
0.151633;0.179109;,
0.203486;0.179109;,
0.203486;0.127257;,
0.151633;0.127257;,
0.203486;0.179109;,
0.151633;0.179109;,
0.151633;0.179109;,
0.203486;0.179109;,
0.151633;0.230962;,
0.203486;0.230962;,
0.203486;0.179109;,
0.151633;0.179109;,
0.151633;0.230962;,
0.203486;0.230962;,
0.203486;0.230962;,
0.151633;0.230962;,
0.151633;0.179109;,
0.099780;0.179109;,
0.099780;0.179109;,
0.151633;0.179109;,
0.255338;0.179109;,
0.203486;0.179109;,
0.203486;0.179109;,
0.255338;0.179109;;
}
MeshMaterialList
{
1;
10;
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


