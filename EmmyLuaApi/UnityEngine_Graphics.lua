---@class Graphics : Object
---@field public activeColorBuffer RenderBuffer
---@field public activeDepthBuffer RenderBuffer
---@field public activeTier number
---@field public deviceName string
---@field public deviceVendor string
---@field public deviceVersion string
local Graphics = {}
---@public
---@param mesh Mesh
---@param position Vector3
---@param rotation Quaternion
---@param material Material
---@param layer Int32
---@param camera Camera
---@param submeshIndex Int32
---@param properties MaterialPropertyBlock
---@param castShadows bool
---@param receiveShadows bool
---@return void
function Graphics.DrawMesh(mesh, position, rotation, material, layer, camera, submeshIndex, properties, castShadows, receiveShadows) end
---@public
---@param mesh Mesh
---@param position Vector3
---@param rotation Quaternion
---@param material Material
---@param layer Int32
---@param camera Camera
---@param submeshIndex Int32
---@param properties MaterialPropertyBlock
---@param castShadows bool
---@return void
function Graphics.DrawMesh(mesh, position, rotation, material, layer, camera, submeshIndex, properties, castShadows) end
---@public
---@param mesh Mesh
---@param position Vector3
---@param rotation Quaternion
---@param material Material
---@param layer Int32
---@param camera Camera
---@param submeshIndex Int32
---@param properties MaterialPropertyBlock
---@return void
function Graphics.DrawMesh(mesh, position, rotation, material, layer, camera, submeshIndex, properties) end
---@public
---@param mesh Mesh
---@param position Vector3
---@param rotation Quaternion
---@param material Material
---@param layer Int32
---@param camera Camera
---@param submeshIndex Int32
---@return void
function Graphics.DrawMesh(mesh, position, rotation, material, layer, camera, submeshIndex) end
---@public
---@param mesh Mesh
---@param position Vector3
---@param rotation Quaternion
---@param material Material
---@param layer Int32
---@param camera Camera
---@return void
function Graphics.DrawMesh(mesh, position, rotation, material, layer, camera) end
---@public
---@param mesh Mesh
---@param position Vector3
---@param rotation Quaternion
---@param material Material
---@param layer Int32
---@return void
function Graphics.DrawMesh(mesh, position, rotation, material, layer) end
---@public
---@param mesh Mesh
---@param position Vector3
---@param rotation Quaternion
---@param material Material
---@param layer Int32
---@param camera Camera
---@param submeshIndex Int32
---@param properties MaterialPropertyBlock
---@param castShadows bool
---@param receiveShadows bool
---@param useLightProbes bool
---@return void
function Graphics.DrawMesh(mesh, position, rotation, material, layer, camera, submeshIndex, properties, castShadows, receiveShadows, useLightProbes) end
---@public
---@param mesh Mesh
---@param position Vector3
---@param rotation Quaternion
---@param material Material
---@param layer Int32
---@param camera Camera
---@param submeshIndex Int32
---@param properties MaterialPropertyBlock
---@param castShadows number
---@param receiveShadows bool
---@param probeAnchor Transform
---@return void
function Graphics.DrawMesh(mesh, position, rotation, material, layer, camera, submeshIndex, properties, castShadows, receiveShadows, probeAnchor) end
---@public
---@param mesh Mesh
---@param position Vector3
---@param rotation Quaternion
---@param material Material
---@param layer Int32
---@param camera Camera
---@param submeshIndex Int32
---@param properties MaterialPropertyBlock
---@param castShadows number
---@param receiveShadows bool
---@return void
function Graphics.DrawMesh(mesh, position, rotation, material, layer, camera, submeshIndex, properties, castShadows, receiveShadows) end
---@public
---@param mesh Mesh
---@param position Vector3
---@param rotation Quaternion
---@param material Material
---@param layer Int32
---@param camera Camera
---@param submeshIndex Int32
---@param properties MaterialPropertyBlock
---@param castShadows number
---@return void
function Graphics.DrawMesh(mesh, position, rotation, material, layer, camera, submeshIndex, properties, castShadows) end
---@public
---@param mesh Mesh
---@param position Vector3
---@param rotation Quaternion
---@param material Material
---@param layer Int32
---@param camera Camera
---@param submeshIndex Int32
---@param properties MaterialPropertyBlock
---@param castShadows number
---@param receiveShadows bool
---@param probeAnchor Transform
---@param useLightProbes bool
---@return void
function Graphics.DrawMesh(mesh, position, rotation, material, layer, camera, submeshIndex, properties, castShadows, receiveShadows, probeAnchor, useLightProbes) end
---@public
---@param mesh Mesh
---@param matrix Matrix4x4
---@param material Material
---@param layer Int32
---@param camera Camera
---@param submeshIndex Int32
---@param properties MaterialPropertyBlock
---@param castShadows bool
---@param receiveShadows bool
---@return void
function Graphics.DrawMesh(mesh, matrix, material, layer, camera, submeshIndex, properties, castShadows, receiveShadows) end
---@public
---@param mesh Mesh
---@param matrix Matrix4x4
---@param material Material
---@param layer Int32
---@param camera Camera
---@param submeshIndex Int32
---@param properties MaterialPropertyBlock
---@param castShadows bool
---@return void
function Graphics.DrawMesh(mesh, matrix, material, layer, camera, submeshIndex, properties, castShadows) end
---@public
---@param mesh Mesh
---@param matrix Matrix4x4
---@param material Material
---@param layer Int32
---@param camera Camera
---@param submeshIndex Int32
---@param properties MaterialPropertyBlock
---@return void
function Graphics.DrawMesh(mesh, matrix, material, layer, camera, submeshIndex, properties) end
---@public
---@param mesh Mesh
---@param matrix Matrix4x4
---@param material Material
---@param layer Int32
---@param camera Camera
---@param submeshIndex Int32
---@return void
function Graphics.DrawMesh(mesh, matrix, material, layer, camera, submeshIndex) end
---@public
---@param mesh Mesh
---@param matrix Matrix4x4
---@param material Material
---@param layer Int32
---@param camera Camera
---@return void
function Graphics.DrawMesh(mesh, matrix, material, layer, camera) end
---@public
---@param mesh Mesh
---@param matrix Matrix4x4
---@param material Material
---@param layer Int32
---@return void
function Graphics.DrawMesh(mesh, matrix, material, layer) end
---@public
---@param mesh Mesh
---@param matrix Matrix4x4
---@param material Material
---@param layer Int32
---@param camera Camera
---@param submeshIndex Int32
---@param properties MaterialPropertyBlock
---@param castShadows bool
---@param receiveShadows bool
---@param useLightProbes bool
---@return void
function Graphics.DrawMesh(mesh, matrix, material, layer, camera, submeshIndex, properties, castShadows, receiveShadows, useLightProbes) end
---@public
---@param mesh Mesh
---@param matrix Matrix4x4
---@param material Material
---@param layer Int32
---@param camera Camera
---@param submeshIndex Int32
---@param properties MaterialPropertyBlock
---@param castShadows number
---@param receiveShadows bool
---@param probeAnchor Transform
---@return void
function Graphics.DrawMesh(mesh, matrix, material, layer, camera, submeshIndex, properties, castShadows, receiveShadows, probeAnchor) end
---@public
---@param mesh Mesh
---@param matrix Matrix4x4
---@param material Material
---@param layer Int32
---@param camera Camera
---@param submeshIndex Int32
---@param properties MaterialPropertyBlock
---@param castShadows number
---@param receiveShadows bool
---@return void
function Graphics.DrawMesh(mesh, matrix, material, layer, camera, submeshIndex, properties, castShadows, receiveShadows) end
---@public
---@param mesh Mesh
---@param matrix Matrix4x4
---@param material Material
---@param layer Int32
---@param camera Camera
---@param submeshIndex Int32
---@param properties MaterialPropertyBlock
---@param castShadows number
---@return void
function Graphics.DrawMesh(mesh, matrix, material, layer, camera, submeshIndex, properties, castShadows) end
---@public
---@param mesh Mesh
---@param matrix Matrix4x4
---@param material Material
---@param layer Int32
---@param camera Camera
---@param submeshIndex Int32
---@param properties MaterialPropertyBlock
---@param castShadows number
---@param receiveShadows bool
---@param probeAnchor Transform
---@param useLightProbes bool
---@return void
function Graphics.DrawMesh(mesh, matrix, material, layer, camera, submeshIndex, properties, castShadows, receiveShadows, probeAnchor, useLightProbes) end
---@public
---@param topology number
---@param vertexCount Int32
---@param instanceCount Int32
---@return void
function Graphics.DrawProcedural(topology, vertexCount, instanceCount) end
---@public
---@param topology number
---@param vertexCount Int32
---@return void
function Graphics.DrawProcedural(topology, vertexCount) end
---@public
---@param topology number
---@param bufferWithArgs ComputeBuffer
---@param argsOffset Int32
---@return void
function Graphics.DrawProceduralIndirect(topology, bufferWithArgs, argsOffset) end
---@public
---@param topology number
---@param bufferWithArgs ComputeBuffer
---@return void
function Graphics.DrawProceduralIndirect(topology, bufferWithArgs) end
---@public
---@param mesh Mesh
---@param submeshIndex Int32
---@param material Material
---@param matrices Matrix4x4[]
---@param count Int32
---@param properties MaterialPropertyBlock
---@param castShadows number
---@param receiveShadows bool
---@param layer Int32
---@return void
function Graphics.DrawMeshInstanced(mesh, submeshIndex, material, matrices, count, properties, castShadows, receiveShadows, layer) end
---@public
---@param mesh Mesh
---@param submeshIndex Int32
---@param material Material
---@param matrices Matrix4x4[]
---@param count Int32
---@param properties MaterialPropertyBlock
---@param castShadows number
---@param receiveShadows bool
---@return void
function Graphics.DrawMeshInstanced(mesh, submeshIndex, material, matrices, count, properties, castShadows, receiveShadows) end
---@public
---@param mesh Mesh
---@param submeshIndex Int32
---@param material Material
---@param matrices Matrix4x4[]
---@param count Int32
---@param properties MaterialPropertyBlock
---@param castShadows number
---@return void
function Graphics.DrawMeshInstanced(mesh, submeshIndex, material, matrices, count, properties, castShadows) end
---@public
---@param mesh Mesh
---@param submeshIndex Int32
---@param material Material
---@param matrices Matrix4x4[]
---@param count Int32
---@param properties MaterialPropertyBlock
---@return void
function Graphics.DrawMeshInstanced(mesh, submeshIndex, material, matrices, count, properties) end
---@public
---@param mesh Mesh
---@param submeshIndex Int32
---@param material Material
---@param matrices Matrix4x4[]
---@param count Int32
---@return void
function Graphics.DrawMeshInstanced(mesh, submeshIndex, material, matrices, count) end
---@public
---@param mesh Mesh
---@param submeshIndex Int32
---@param material Material
---@param matrices Matrix4x4[]
---@return void
function Graphics.DrawMeshInstanced(mesh, submeshIndex, material, matrices) end
---@public
---@param mesh Mesh
---@param submeshIndex Int32
---@param material Material
---@param matrices Matrix4x4[]
---@param count Int32
---@param properties MaterialPropertyBlock
---@param castShadows number
---@param receiveShadows bool
---@param layer Int32
---@param camera Camera
---@return void
function Graphics.DrawMeshInstanced(mesh, submeshIndex, material, matrices, count, properties, castShadows, receiveShadows, layer, camera) end
---@public
---@param mesh Mesh
---@param submeshIndex Int32
---@param material Material
---@param matrices List
---@param properties MaterialPropertyBlock
---@param castShadows number
---@param receiveShadows bool
---@param layer Int32
---@return void
function Graphics.DrawMeshInstanced(mesh, submeshIndex, material, matrices, properties, castShadows, receiveShadows, layer) end
---@public
---@param mesh Mesh
---@param submeshIndex Int32
---@param material Material
---@param matrices List
---@param properties MaterialPropertyBlock
---@param castShadows number
---@param receiveShadows bool
---@return void
function Graphics.DrawMeshInstanced(mesh, submeshIndex, material, matrices, properties, castShadows, receiveShadows) end
---@public
---@param mesh Mesh
---@param submeshIndex Int32
---@param material Material
---@param matrices List
---@param properties MaterialPropertyBlock
---@param castShadows number
---@return void
function Graphics.DrawMeshInstanced(mesh, submeshIndex, material, matrices, properties, castShadows) end
---@public
---@param mesh Mesh
---@param submeshIndex Int32
---@param material Material
---@param matrices List
---@param properties MaterialPropertyBlock
---@return void
function Graphics.DrawMeshInstanced(mesh, submeshIndex, material, matrices, properties) end
---@public
---@param mesh Mesh
---@param submeshIndex Int32
---@param material Material
---@param matrices List
---@return void
function Graphics.DrawMeshInstanced(mesh, submeshIndex, material, matrices) end
---@public
---@param mesh Mesh
---@param submeshIndex Int32
---@param material Material
---@param matrices List
---@param properties MaterialPropertyBlock
---@param castShadows number
---@param receiveShadows bool
---@param layer Int32
---@param camera Camera
---@return void
function Graphics.DrawMeshInstanced(mesh, submeshIndex, material, matrices, properties, castShadows, receiveShadows, layer, camera) end
---@public
---@param mesh Mesh
---@param submeshIndex Int32
---@param material Material
---@param bounds Bounds
---@param bufferWithArgs ComputeBuffer
---@param argsOffset Int32
---@param properties MaterialPropertyBlock
---@param castShadows number
---@param receiveShadows bool
---@param layer Int32
---@return void
function Graphics.DrawMeshInstancedIndirect(mesh, submeshIndex, material, bounds, bufferWithArgs, argsOffset, properties, castShadows, receiveShadows, layer) end
---@public
---@param mesh Mesh
---@param submeshIndex Int32
---@param material Material
---@param bounds Bounds
---@param bufferWithArgs ComputeBuffer
---@param argsOffset Int32
---@param properties MaterialPropertyBlock
---@param castShadows number
---@param receiveShadows bool
---@return void
function Graphics.DrawMeshInstancedIndirect(mesh, submeshIndex, material, bounds, bufferWithArgs, argsOffset, properties, castShadows, receiveShadows) end
---@public
---@param mesh Mesh
---@param submeshIndex Int32
---@param material Material
---@param bounds Bounds
---@param bufferWithArgs ComputeBuffer
---@param argsOffset Int32
---@param properties MaterialPropertyBlock
---@param castShadows number
---@return void
function Graphics.DrawMeshInstancedIndirect(mesh, submeshIndex, material, bounds, bufferWithArgs, argsOffset, properties, castShadows) end
---@public
---@param mesh Mesh
---@param submeshIndex Int32
---@param material Material
---@param bounds Bounds
---@param bufferWithArgs ComputeBuffer
---@param argsOffset Int32
---@param properties MaterialPropertyBlock
---@return void
function Graphics.DrawMeshInstancedIndirect(mesh, submeshIndex, material, bounds, bufferWithArgs, argsOffset, properties) end
---@public
---@param mesh Mesh
---@param submeshIndex Int32
---@param material Material
---@param bounds Bounds
---@param bufferWithArgs ComputeBuffer
---@param argsOffset Int32
---@return void
function Graphics.DrawMeshInstancedIndirect(mesh, submeshIndex, material, bounds, bufferWithArgs, argsOffset) end
---@public
---@param mesh Mesh
---@param submeshIndex Int32
---@param material Material
---@param bounds Bounds
---@param bufferWithArgs ComputeBuffer
---@return void
function Graphics.DrawMeshInstancedIndirect(mesh, submeshIndex, material, bounds, bufferWithArgs) end
---@public
---@param mesh Mesh
---@param submeshIndex Int32
---@param material Material
---@param bounds Bounds
---@param bufferWithArgs ComputeBuffer
---@param argsOffset Int32
---@param properties MaterialPropertyBlock
---@param castShadows number
---@param receiveShadows bool
---@param layer Int32
---@param camera Camera
---@return void
function Graphics.DrawMeshInstancedIndirect(mesh, submeshIndex, material, bounds, bufferWithArgs, argsOffset, properties, castShadows, receiveShadows, layer, camera) end
---@public
---@param screenRect Rect
---@param texture Texture
---@param mat Material
---@return void
function Graphics.DrawTexture(screenRect, texture, mat) end
---@public
---@param screenRect Rect
---@param texture Texture
---@return void
function Graphics.DrawTexture(screenRect, texture) end
---@public
---@param screenRect Rect
---@param texture Texture
---@param mat Material
---@param pass Int32
---@return void
function Graphics.DrawTexture(screenRect, texture, mat, pass) end
---@public
---@param screenRect Rect
---@param texture Texture
---@param leftBorder Int32
---@param rightBorder Int32
---@param topBorder Int32
---@param bottomBorder Int32
---@param mat Material
---@return void
function Graphics.DrawTexture(screenRect, texture, leftBorder, rightBorder, topBorder, bottomBorder, mat) end
---@public
---@param screenRect Rect
---@param texture Texture
---@param leftBorder Int32
---@param rightBorder Int32
---@param topBorder Int32
---@param bottomBorder Int32
---@return void
function Graphics.DrawTexture(screenRect, texture, leftBorder, rightBorder, topBorder, bottomBorder) end
---@public
---@param screenRect Rect
---@param texture Texture
---@param leftBorder Int32
---@param rightBorder Int32
---@param topBorder Int32
---@param bottomBorder Int32
---@param mat Material
---@param pass Int32
---@return void
function Graphics.DrawTexture(screenRect, texture, leftBorder, rightBorder, topBorder, bottomBorder, mat, pass) end
---@public
---@param screenRect Rect
---@param texture Texture
---@param sourceRect Rect
---@param leftBorder Int32
---@param rightBorder Int32
---@param topBorder Int32
---@param bottomBorder Int32
---@param mat Material
---@return void
function Graphics.DrawTexture(screenRect, texture, sourceRect, leftBorder, rightBorder, topBorder, bottomBorder, mat) end
---@public
---@param screenRect Rect
---@param texture Texture
---@param sourceRect Rect
---@param leftBorder Int32
---@param rightBorder Int32
---@param topBorder Int32
---@param bottomBorder Int32
---@return void
function Graphics.DrawTexture(screenRect, texture, sourceRect, leftBorder, rightBorder, topBorder, bottomBorder) end
---@public
---@param screenRect Rect
---@param texture Texture
---@param sourceRect Rect
---@param leftBorder Int32
---@param rightBorder Int32
---@param topBorder Int32
---@param bottomBorder Int32
---@param mat Material
---@param pass Int32
---@return void
function Graphics.DrawTexture(screenRect, texture, sourceRect, leftBorder, rightBorder, topBorder, bottomBorder, mat, pass) end
---@public
---@param screenRect Rect
---@param texture Texture
---@param sourceRect Rect
---@param leftBorder Int32
---@param rightBorder Int32
---@param topBorder Int32
---@param bottomBorder Int32
---@param color Color
---@param mat Material
---@return void
function Graphics.DrawTexture(screenRect, texture, sourceRect, leftBorder, rightBorder, topBorder, bottomBorder, color, mat) end
---@public
---@param screenRect Rect
---@param texture Texture
---@param sourceRect Rect
---@param leftBorder Int32
---@param rightBorder Int32
---@param topBorder Int32
---@param bottomBorder Int32
---@param color Color
---@return void
function Graphics.DrawTexture(screenRect, texture, sourceRect, leftBorder, rightBorder, topBorder, bottomBorder, color) end
---@public
---@param screenRect Rect
---@param texture Texture
---@param sourceRect Rect
---@param leftBorder Int32
---@param rightBorder Int32
---@param topBorder Int32
---@param bottomBorder Int32
---@param color Color
---@param mat Material
---@param pass Int32
---@return void
function Graphics.DrawTexture(screenRect, texture, sourceRect, leftBorder, rightBorder, topBorder, bottomBorder, color, mat, pass) end
---@public
---@param buffer CommandBuffer
---@return void
function Graphics.ExecuteCommandBuffer(buffer) end
---@public
---@param source Texture
---@param dest RenderTexture
---@return void
function Graphics.Blit(source, dest) end
---@public
---@param source Texture
---@param dest RenderTexture
---@param mat Material
---@return void
function Graphics.Blit(source, dest, mat) end
---@public
---@param source Texture
---@param dest RenderTexture
---@param mat Material
---@param pass Int32
---@return void
function Graphics.Blit(source, dest, mat, pass) end
---@public
---@param source Texture
---@param mat Material
---@return void
function Graphics.Blit(source, mat) end
---@public
---@param source Texture
---@param mat Material
---@param pass Int32
---@return void
function Graphics.Blit(source, mat, pass) end
---@public
---@param source Texture
---@param dest RenderTexture
---@param mat Material
---@param offsets Vector2[]
---@return void
function Graphics.BlitMultiTap(source, dest, mat, offsets) end
---@public
---@param index Int32
---@param uav RenderTexture
---@return void
function Graphics.SetRandomWriteTarget(index, uav) end
---@public
---@param index Int32
---@param uav ComputeBuffer
---@return void
function Graphics.SetRandomWriteTarget(index, uav) end
---@public
---@param index Int32
---@param uav ComputeBuffer
---@param preserveCounterValue bool
---@return void
function Graphics.SetRandomWriteTarget(index, uav, preserveCounterValue) end
---@public
---@return void
function Graphics.ClearRandomWriteTargets() end
---@public
---@param rt RenderTexture
---@return void
function Graphics.SetRenderTarget(rt) end
---@public
---@param rt RenderTexture
---@param mipLevel Int32
---@return void
function Graphics.SetRenderTarget(rt, mipLevel) end
---@public
---@param rt RenderTexture
---@param mipLevel Int32
---@param face number
---@return void
function Graphics.SetRenderTarget(rt, mipLevel, face) end
---@public
---@param rt RenderTexture
---@param mipLevel Int32
---@param face number
---@param depthSlice Int32
---@return void
function Graphics.SetRenderTarget(rt, mipLevel, face, depthSlice) end
---@public
---@param colorBuffer RenderBuffer
---@param depthBuffer RenderBuffer
---@return void
function Graphics.SetRenderTarget(colorBuffer, depthBuffer) end
---@public
---@param colorBuffer RenderBuffer
---@param depthBuffer RenderBuffer
---@param mipLevel Int32
---@return void
function Graphics.SetRenderTarget(colorBuffer, depthBuffer, mipLevel) end
---@public
---@param colorBuffer RenderBuffer
---@param depthBuffer RenderBuffer
---@param mipLevel Int32
---@param face number
---@return void
function Graphics.SetRenderTarget(colorBuffer, depthBuffer, mipLevel, face) end
---@public
---@param colorBuffer RenderBuffer
---@param depthBuffer RenderBuffer
---@param mipLevel Int32
---@param face number
---@param depthSlice Int32
---@return void
function Graphics.SetRenderTarget(colorBuffer, depthBuffer, mipLevel, face, depthSlice) end
---@public
---@param colorBuffers RenderBuffer[]
---@param depthBuffer RenderBuffer
---@return void
function Graphics.SetRenderTarget(colorBuffers, depthBuffer) end
---@public
---@param setup RenderTargetSetup
---@return void
function Graphics.SetRenderTarget(setup) end
---@public
---@param src Texture
---@param dst Texture
---@return void
function Graphics.CopyTexture(src, dst) end
---@public
---@param src Texture
---@param srcElement Int32
---@param dst Texture
---@param dstElement Int32
---@return void
function Graphics.CopyTexture(src, srcElement, dst, dstElement) end
---@public
---@param src Texture
---@param srcElement Int32
---@param srcMip Int32
---@param dst Texture
---@param dstElement Int32
---@param dstMip Int32
---@return void
function Graphics.CopyTexture(src, srcElement, srcMip, dst, dstElement, dstMip) end
---@public
---@param src Texture
---@param srcElement Int32
---@param srcMip Int32
---@param srcX Int32
---@param srcY Int32
---@param srcWidth Int32
---@param srcHeight Int32
---@param dst Texture
---@param dstElement Int32
---@param dstMip Int32
---@param dstX Int32
---@param dstY Int32
---@return void
function Graphics.CopyTexture(src, srcElement, srcMip, srcX, srcY, srcWidth, srcHeight, dst, dstElement, dstMip, dstX, dstY) end
---@public
---@param src Texture
---@param dst Texture
---@return bool
function Graphics.ConvertTexture(src, dst) end
---@public
---@param src Texture
---@param srcElement Int32
---@param dst Texture
---@param dstElement Int32
---@return bool
function Graphics.ConvertTexture(src, srcElement, dst, dstElement) end
---@public
---@param mesh Mesh
---@param position Vector3
---@param rotation Quaternion
---@return void
function Graphics.DrawMeshNow(mesh, position, rotation) end
---@public
---@param mesh Mesh
---@param position Vector3
---@param rotation Quaternion
---@param materialIndex Int32
---@return void
function Graphics.DrawMeshNow(mesh, position, rotation, materialIndex) end
---@public
---@param mesh Mesh
---@param matrix Matrix4x4
---@return void
function Graphics.DrawMeshNow(mesh, matrix) end
---@public
---@param mesh Mesh
---@param matrix Matrix4x4
---@param materialIndex Int32
---@return void
function Graphics.DrawMeshNow(mesh, matrix, materialIndex) end
---@public
---@param mesh Mesh
---@param position Vector3
---@param rotation Quaternion
---@return void
function Graphics.DrawMesh(mesh, position, rotation) end
---@public
---@param mesh Mesh
---@param position Vector3
---@param rotation Quaternion
---@param materialIndex Int32
---@return void
function Graphics.DrawMesh(mesh, position, rotation, materialIndex) end
---@public
---@param mesh Mesh
---@param matrix Matrix4x4
---@return void
function Graphics.DrawMesh(mesh, matrix) end
---@public
---@param mesh Mesh
---@param matrix Matrix4x4
---@param materialIndex Int32
---@return void
function Graphics.DrawMesh(mesh, matrix, materialIndex) end
