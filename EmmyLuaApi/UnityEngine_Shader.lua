---@class Shader : Object
---@field public isSupported bool
---@field public maximumLOD Int32
---@field public globalMaximumLOD Int32
---@field public globalRenderPipeline string
---@field public renderQueue Int32
---@field public globalShaderHardwareTier number
local Shader = {}
---@public
---@param name string
---@return Shader
function Shader.Find(name) end
---@public
---@param keyword string
---@return void
function Shader.EnableKeyword(keyword) end
---@public
---@param keyword string
---@return void
function Shader.DisableKeyword(keyword) end
---@public
---@param keyword string
---@return bool
function Shader.IsKeywordEnabled(keyword) end
---@public
---@param nameID Int32
---@param buffer ComputeBuffer
---@return void
function Shader.SetGlobalBuffer(nameID, buffer) end
---@public
---@param name string
---@return Int32
function Shader.PropertyToID(name) end
---@public
---@return void
function Shader.WarmupAllShaders() end
---@public
---@param name string
---@param value Single
---@return void
function Shader.SetGlobalFloat(name, value) end
---@public
---@param nameID Int32
---@param value Single
---@return void
function Shader.SetGlobalFloat(nameID, value) end
---@public
---@param name string
---@param value Int32
---@return void
function Shader.SetGlobalInt(name, value) end
---@public
---@param nameID Int32
---@param value Int32
---@return void
function Shader.SetGlobalInt(nameID, value) end
---@public
---@param name string
---@param value Vector4
---@return void
function Shader.SetGlobalVector(name, value) end
---@public
---@param nameID Int32
---@param value Vector4
---@return void
function Shader.SetGlobalVector(nameID, value) end
---@public
---@param name string
---@param value Color
---@return void
function Shader.SetGlobalColor(name, value) end
---@public
---@param nameID Int32
---@param value Color
---@return void
function Shader.SetGlobalColor(nameID, value) end
---@public
---@param name string
---@param value Matrix4x4
---@return void
function Shader.SetGlobalMatrix(name, value) end
---@public
---@param nameID Int32
---@param value Matrix4x4
---@return void
function Shader.SetGlobalMatrix(nameID, value) end
---@public
---@param name string
---@param value Texture
---@return void
function Shader.SetGlobalTexture(name, value) end
---@public
---@param nameID Int32
---@param value Texture
---@return void
function Shader.SetGlobalTexture(nameID, value) end
---@public
---@param name string
---@param buffer ComputeBuffer
---@return void
function Shader.SetGlobalBuffer(name, buffer) end
---@public
---@param name string
---@param values List
---@return void
function Shader.SetGlobalFloatArray(name, values) end
---@public
---@param nameID Int32
---@param values List
---@return void
function Shader.SetGlobalFloatArray(nameID, values) end
---@public
---@param name string
---@param values Single[]
---@return void
function Shader.SetGlobalFloatArray(name, values) end
---@public
---@param nameID Int32
---@param values Single[]
---@return void
function Shader.SetGlobalFloatArray(nameID, values) end
---@public
---@param name string
---@param values List
---@return void
function Shader.SetGlobalVectorArray(name, values) end
---@public
---@param nameID Int32
---@param values List
---@return void
function Shader.SetGlobalVectorArray(nameID, values) end
---@public
---@param name string
---@param values Vector4[]
---@return void
function Shader.SetGlobalVectorArray(name, values) end
---@public
---@param nameID Int32
---@param values Vector4[]
---@return void
function Shader.SetGlobalVectorArray(nameID, values) end
---@public
---@param name string
---@param values List
---@return void
function Shader.SetGlobalMatrixArray(name, values) end
---@public
---@param nameID Int32
---@param values List
---@return void
function Shader.SetGlobalMatrixArray(nameID, values) end
---@public
---@param name string
---@param values Matrix4x4[]
---@return void
function Shader.SetGlobalMatrixArray(name, values) end
---@public
---@param nameID Int32
---@param values Matrix4x4[]
---@return void
function Shader.SetGlobalMatrixArray(nameID, values) end
---@public
---@param name string
---@return Single
function Shader.GetGlobalFloat(name) end
---@public
---@param nameID Int32
---@return Single
function Shader.GetGlobalFloat(nameID) end
---@public
---@param name string
---@return Int32
function Shader.GetGlobalInt(name) end
---@public
---@param nameID Int32
---@return Int32
function Shader.GetGlobalInt(nameID) end
---@public
---@param name string
---@return Vector4
function Shader.GetGlobalVector(name) end
---@public
---@param nameID Int32
---@return Vector4
function Shader.GetGlobalVector(nameID) end
---@public
---@param name string
---@return Color
function Shader.GetGlobalColor(name) end
---@public
---@param nameID Int32
---@return Color
function Shader.GetGlobalColor(nameID) end
---@public
---@param name string
---@return Matrix4x4
function Shader.GetGlobalMatrix(name) end
---@public
---@param nameID Int32
---@return Matrix4x4
function Shader.GetGlobalMatrix(nameID) end
---@public
---@param name string
---@return Texture
function Shader.GetGlobalTexture(name) end
---@public
---@param nameID Int32
---@return Texture
function Shader.GetGlobalTexture(nameID) end
---@public
---@param name string
---@param values List
---@return void
function Shader.GetGlobalFloatArray(name, values) end
---@public
---@param nameID Int32
---@param values List
---@return void
function Shader.GetGlobalFloatArray(nameID, values) end
---@public
---@param name string
---@return Single[]
function Shader.GetGlobalFloatArray(name) end
---@public
---@param nameID Int32
---@return Single[]
function Shader.GetGlobalFloatArray(nameID) end
---@public
---@param name string
---@param values List
---@return void
function Shader.GetGlobalVectorArray(name, values) end
---@public
---@param nameID Int32
---@param values List
---@return void
function Shader.GetGlobalVectorArray(nameID, values) end
---@public
---@param name string
---@return Vector4[]
function Shader.GetGlobalVectorArray(name) end
---@public
---@param nameID Int32
---@return Vector4[]
function Shader.GetGlobalVectorArray(nameID) end
---@public
---@param name string
---@param values List
---@return void
function Shader.GetGlobalMatrixArray(name, values) end
---@public
---@param nameID Int32
---@param values List
---@return void
function Shader.GetGlobalMatrixArray(nameID, values) end
---@public
---@param name string
---@return Matrix4x4[]
function Shader.GetGlobalMatrixArray(name) end
---@public
---@param nameID Int32
---@return Matrix4x4[]
function Shader.GetGlobalMatrixArray(nameID) end
---@public
---@param propertyName string
---@param mode number
---@return void
function Shader.SetGlobalTexGenMode(propertyName, mode) end
---@public
---@param propertyName string
---@param matrixName string
---@return void
function Shader.SetGlobalTextureMatrixName(propertyName, matrixName) end
