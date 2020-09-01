---@class Camera : Behaviour
---@field public onPreCull CameraCallback
---@field public onPreRender CameraCallback
---@field public onPostRender CameraCallback
---@field public fov Single
---@field public near Single
---@field public far Single
---@field public fieldOfView Single
---@field public nearClipPlane Single
---@field public farClipPlane Single
---@field public renderingPath number
---@field public actualRenderingPath number
---@field public allowHDR bool
---@field public hdr bool
---@field public forceIntoRenderTexture bool
---@field public allowMSAA bool
---@field public orthographicSize Single
---@field public orthographic bool
---@field public opaqueSortMode number
---@field public transparencySortMode number
---@field public transparencySortAxis Vector3
---@field public depth Single
---@field public aspect Single
---@field public cullingMask Int32
---@field public eventMask Int32
---@field public backgroundColor Color
---@field public rect Rect
---@field public pixelRect Rect
---@field public targetTexture RenderTexture
---@field public activeTexture RenderTexture
---@field public pixelWidth Int32
---@field public pixelHeight Int32
---@field public cameraToWorldMatrix Matrix4x4
---@field public worldToCameraMatrix Matrix4x4
---@field public projectionMatrix Matrix4x4
---@field public nonJitteredProjectionMatrix Matrix4x4
---@field public useJitteredProjectionMatrixForTransparentRendering bool
---@field public velocity Vector3
---@field public clearFlags number
---@field public stereoEnabled bool
---@field public stereoSeparation Single
---@field public stereoConvergence Single
---@field public cameraType number
---@field public stereoMirrorMode bool
---@field public stereoTargetEye number
---@field public stereoActiveEye number
---@field public targetDisplay Int32
---@field public main Camera
---@field public current Camera
---@field public allCameras Camera[]
---@field public allCamerasCount Int32
---@field public useOcclusionCulling bool
---@field public cullingMatrix Matrix4x4
---@field public layerCullDistances Single[]
---@field public layerCullSpherical bool
---@field public depthTextureMode number
---@field public clearStencilAfterLightingPass bool
---@field public commandBufferCount Int32
---@field public isOrthoGraphic bool
---@field public mainCamera Camera
local Camera = {}
---@public
---@param colorBuffer RenderBuffer
---@param depthBuffer RenderBuffer
---@return void
function Camera:SetTargetBuffers(colorBuffer, depthBuffer) end
---@public
---@param colorBuffer RenderBuffer[]
---@param depthBuffer RenderBuffer
---@return void
function Camera:SetTargetBuffers(colorBuffer, depthBuffer) end
---@public
---@return void
function Camera:ResetWorldToCameraMatrix() end
---@public
---@return void
function Camera:ResetProjectionMatrix() end
---@public
---@return void
function Camera:ResetAspect() end
---@public
---@return void
function Camera:ResetFieldOfView() end
---@public
---@return Matrix4x4[]
function Camera:GetStereoViewMatrices() end
---@public
---@param eye number
---@return Matrix4x4
function Camera:GetStereoViewMatrix(eye) end
---@public
---@param leftMatrix Matrix4x4
---@param rightMatrix Matrix4x4
---@return void
function Camera:SetStereoViewMatrices(leftMatrix, rightMatrix) end
---@public
---@param eye number
---@param matrix Matrix4x4
---@return void
function Camera:SetStereoViewMatrix(eye, matrix) end
---@public
---@return void
function Camera:ResetStereoViewMatrices() end
---@public
---@return Matrix4x4[]
function Camera:GetStereoProjectionMatrices() end
---@public
---@param eye number
---@return Matrix4x4
function Camera:GetStereoProjectionMatrix(eye) end
---@public
---@param eye number
---@param matrix Matrix4x4
---@return void
function Camera:SetStereoProjectionMatrix(eye, matrix) end
---@public
---@param leftMatrix Matrix4x4
---@param rightMatrix Matrix4x4
---@return void
function Camera:SetStereoProjectionMatrices(leftMatrix, rightMatrix) end
---@public
---@param viewport Rect
---@param z Single
---@param eye number
---@param outCorners Vector3[]
---@return void
function Camera:CalculateFrustumCorners(viewport, z, eye, outCorners) end
---@public
---@return void
function Camera:ResetStereoProjectionMatrices() end
---@public
---@return void
function Camera:ResetTransparencySortSettings() end
---@public
---@param position Vector3
---@return Vector3
function Camera:WorldToScreenPoint(position) end
---@public
---@param position Vector3
---@return Vector3
function Camera:WorldToViewportPoint(position) end
---@public
---@param position Vector3
---@return Vector3
function Camera:ViewportToWorldPoint(position) end
---@public
---@param position Vector3
---@return Vector3
function Camera:ScreenToWorldPoint(position) end
---@public
---@param position Vector3
---@return Vector3
function Camera:ScreenToViewportPoint(position) end
---@public
---@param position Vector3
---@return Vector3
function Camera:ViewportToScreenPoint(position) end
---@public
---@param position Vector3
---@return Ray
function Camera:ViewportPointToRay(position) end
---@public
---@param position Vector3
---@return Ray
function Camera:ScreenPointToRay(position) end
---@public
---@param cameras Camera[]
---@return Int32
function Camera.GetAllCameras(cameras) end
---@public
---@return void
function Camera:Render() end
---@public
---@param shader Shader
---@param replacementTag string
---@return void
function Camera:RenderWithShader(shader, replacementTag) end
---@public
---@param shader Shader
---@param replacementTag string
---@return void
function Camera:SetReplacementShader(shader, replacementTag) end
---@public
---@return void
function Camera:ResetReplacementShader() end
---@public
---@return void
function Camera:ResetCullingMatrix() end
---@public
---@return void
function Camera:RenderDontRestore() end
---@public
---@param cur Camera
---@return void
function Camera.SetupCurrent(cur) end
---@public
---@param cubemap Cubemap
---@return bool
function Camera:RenderToCubemap(cubemap) end
---@public
---@param cubemap Cubemap
---@param faceMask Int32
---@return bool
function Camera:RenderToCubemap(cubemap, faceMask) end
---@public
---@param cubemap RenderTexture
---@return bool
function Camera:RenderToCubemap(cubemap) end
---@public
---@param cubemap RenderTexture
---@param faceMask Int32
---@return bool
function Camera:RenderToCubemap(cubemap, faceMask) end
---@public
---@param other Camera
---@return void
function Camera:CopyFrom(other) end
---@public
---@param evt number
---@param buffer CommandBuffer
---@return void
function Camera:AddCommandBuffer(evt, buffer) end
---@public
---@param evt number
---@param buffer CommandBuffer
---@return void
function Camera:RemoveCommandBuffer(evt, buffer) end
---@public
---@param evt number
---@return void
function Camera:RemoveCommandBuffers(evt) end
---@public
---@return void
function Camera:RemoveAllCommandBuffers() end
---@public
---@param evt number
---@return CommandBuffer[]
function Camera:GetCommandBuffers(evt) end
---@public
---@param clipPlane Vector4
---@return Matrix4x4
function Camera:CalculateObliqueMatrix(clipPlane) end
---@public
---@return Single
function Camera:GetScreenWidth() end
---@public
---@return Single
function Camera:GetScreenHeight() end
---@public
---@return void
function Camera:DoClear() end
