---@class Mesh : Object
---@field public isReadable bool
---@field public blendShapeCount Int32
---@field public vertexBufferCount Int32
---@field public bounds Bounds
---@field public vertexCount Int32
---@field public subMeshCount Int32
---@field public boneWeights BoneWeight[]
---@field public bindposes Matrix4x4[]
---@field public uv1 Vector2[]
---@field public vertices Vector3[]
---@field public normals Vector3[]
---@field public tangents Vector4[]
---@field public uv Vector2[]
---@field public uv2 Vector2[]
---@field public uv3 Vector2[]
---@field public uv4 Vector2[]
---@field public colors Color[]
---@field public colors32 Color32[]
---@field public triangles Int32[]
local Mesh = {}
---@public
---@param keepVertexLayout bool
---@return void
function Mesh:Clear(keepVertexLayout) end
---@public
---@return void
function Mesh:Clear() end
---@public
---@param triangles Int32[]
---@param submesh Int32
---@return void
function Mesh:SetTriangles(triangles, submesh) end
---@public
---@param triangles Int32[]
---@param submesh Int32
---@param calculateBounds bool
---@return void
function Mesh:SetTriangles(triangles, submesh, calculateBounds) end
---@public
---@param triangles List
---@param submesh Int32
---@return void
function Mesh:SetTriangles(triangles, submesh) end
---@public
---@param triangles List
---@param submesh Int32
---@param calculateBounds bool
---@return void
function Mesh:SetTriangles(triangles, submesh, calculateBounds) end
---@public
---@param indices Int32[]
---@param topology number
---@param submesh Int32
---@return void
function Mesh:SetIndices(indices, topology, submesh) end
---@public
---@param indices Int32[]
---@param topology number
---@param submesh Int32
---@param calculateBounds bool
---@return void
function Mesh:SetIndices(indices, topology, submesh, calculateBounds) end
---@public
---@return void
function Mesh:ClearBlendShapes() end
---@public
---@param shapeIndex Int32
---@return string
function Mesh:GetBlendShapeName(shapeIndex) end
---@public
---@param shapeIndex Int32
---@return Int32
function Mesh:GetBlendShapeFrameCount(shapeIndex) end
---@public
---@param shapeIndex Int32
---@param frameIndex Int32
---@return Single
function Mesh:GetBlendShapeFrameWeight(shapeIndex, frameIndex) end
---@public
---@param shapeIndex Int32
---@param frameIndex Int32
---@param deltaVertices Vector3[]
---@param deltaNormals Vector3[]
---@param deltaTangents Vector3[]
---@return void
function Mesh:GetBlendShapeFrameVertices(shapeIndex, frameIndex, deltaVertices, deltaNormals, deltaTangents) end
---@public
---@param shapeName string
---@param frameWeight Single
---@param deltaVertices Vector3[]
---@param deltaNormals Vector3[]
---@param deltaTangents Vector3[]
---@return void
function Mesh:AddBlendShapeFrame(shapeName, frameWeight, deltaVertices, deltaNormals, deltaTangents) end
---@public
---@param bufferIndex Int32
---@return IntPtr
function Mesh:GetNativeVertexBufferPtr(bufferIndex) end
---@public
---@return IntPtr
function Mesh:GetNativeIndexBufferPtr() end
---@public
---@return void
function Mesh:RecalculateBounds() end
---@public
---@return void
function Mesh:RecalculateNormals() end
---@public
---@return void
function Mesh:RecalculateTangents() end
---@public
---@return void
function Mesh:Optimize() end
---@public
---@param submesh Int32
---@return number
function Mesh:GetTopology(submesh) end
---@public
---@param submesh Int32
---@return UInt32
function Mesh:GetIndexStart(submesh) end
---@public
---@param submesh Int32
---@return UInt32
function Mesh:GetIndexCount(submesh) end
---@public
---@param combine CombineInstance[]
---@param mergeSubMeshes bool
---@param useMatrices bool
---@param hasLightmapData bool
---@return void
function Mesh:CombineMeshes(combine, mergeSubMeshes, useMatrices, hasLightmapData) end
---@public
---@param combine CombineInstance[]
---@param mergeSubMeshes bool
---@param useMatrices bool
---@return void
function Mesh:CombineMeshes(combine, mergeSubMeshes, useMatrices) end
---@public
---@param combine CombineInstance[]
---@param mergeSubMeshes bool
---@return void
function Mesh:CombineMeshes(combine, mergeSubMeshes) end
---@public
---@param combine CombineInstance[]
---@return void
function Mesh:CombineMeshes(combine) end
---@public
---@return void
function Mesh:MarkDynamic() end
---@public
---@param markNoLogerReadable bool
---@return void
function Mesh:UploadMeshData(markNoLogerReadable) end
---@public
---@param blendShapeName string
---@return Int32
function Mesh:GetBlendShapeIndex(blendShapeName) end
---@public
---@param vertices List
---@return void
function Mesh:GetVertices(vertices) end
---@public
---@param inVertices List
---@return void
function Mesh:SetVertices(inVertices) end
---@public
---@param normals List
---@return void
function Mesh:GetNormals(normals) end
---@public
---@param inNormals List
---@return void
function Mesh:SetNormals(inNormals) end
---@public
---@param tangents List
---@return void
function Mesh:GetTangents(tangents) end
---@public
---@param inTangents List
---@return void
function Mesh:SetTangents(inTangents) end
---@public
---@param colors List
---@return void
function Mesh:GetColors(colors) end
---@public
---@param inColors List
---@return void
function Mesh:SetColors(inColors) end
---@public
---@param colors List
---@return void
function Mesh:GetColors(colors) end
---@public
---@param inColors List
---@return void
function Mesh:SetColors(inColors) end
---@public
---@param channel Int32
---@param uvs List
---@return void
function Mesh:SetUVs(channel, uvs) end
---@public
---@param channel Int32
---@param uvs List
---@return void
function Mesh:SetUVs(channel, uvs) end
---@public
---@param channel Int32
---@param uvs List
---@return void
function Mesh:SetUVs(channel, uvs) end
---@public
---@param channel Int32
---@param uvs List
---@return void
function Mesh:GetUVs(channel, uvs) end
---@public
---@param channel Int32
---@param uvs List
---@return void
function Mesh:GetUVs(channel, uvs) end
---@public
---@param channel Int32
---@param uvs List
---@return void
function Mesh:GetUVs(channel, uvs) end
---@public
---@param submesh Int32
---@return Int32[]
function Mesh:GetTriangles(submesh) end
---@public
---@param triangles List
---@param submesh Int32
---@return void
function Mesh:GetTriangles(triangles, submesh) end
---@public
---@param submesh Int32
---@return Int32[]
function Mesh:GetIndices(submesh) end
---@public
---@param indices List
---@param submesh Int32
---@return void
function Mesh:GetIndices(indices, submesh) end
---@public
---@param bindposes List
---@return void
function Mesh:GetBindposes(bindposes) end
---@public
---@param boneWeights List
---@return void
function Mesh:GetBoneWeights(boneWeights) end
