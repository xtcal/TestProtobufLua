---@class GL : Object
---@field public TRIANGLES Int32
---@field public TRIANGLE_STRIP Int32
---@field public QUADS Int32
---@field public LINES Int32
---@field public LINE_STRIP Int32
---@field public modelview Matrix4x4
---@field public wireframe bool
---@field public sRGBWrite bool
---@field public invertCulling bool
local GL = {}
---@public
---@param x Single
---@param y Single
---@param z Single
---@return void
function GL.Vertex3(x, y, z) end
---@public
---@param v Vector3
---@return void
function GL.Vertex(v) end
---@public
---@param c Color
---@return void
function GL.Color(c) end
---@public
---@param v Vector3
---@return void
function GL.TexCoord(v) end
---@public
---@param x Single
---@param y Single
---@return void
function GL.TexCoord2(x, y) end
---@public
---@param x Single
---@param y Single
---@param z Single
---@return void
function GL.TexCoord3(x, y, z) end
---@public
---@param unit Int32
---@param x Single
---@param y Single
---@return void
function GL.MultiTexCoord2(unit, x, y) end
---@public
---@param unit Int32
---@param x Single
---@param y Single
---@param z Single
---@return void
function GL.MultiTexCoord3(unit, x, y, z) end
---@public
---@param unit Int32
---@param v Vector3
---@return void
function GL.MultiTexCoord(unit, v) end
---@public
---@param mode Int32
---@return void
function GL.Begin(mode) end
---@public
---@return void
function GL.End() end
---@public
---@return void
function GL.PushMatrix() end
---@public
---@return void
function GL.PopMatrix() end
---@public
---@return void
function GL.LoadIdentity() end
---@public
---@return void
function GL.LoadOrtho() end
---@public
---@return void
function GL.LoadPixelMatrix() end
---@public
---@param left Single
---@param right Single
---@param bottom Single
---@param top Single
---@return void
function GL.LoadPixelMatrix(left, right, bottom, top) end
---@public
---@param pixelRect Rect
---@return void
function GL.Viewport(pixelRect) end
---@public
---@param mat Matrix4x4
---@return void
function GL.LoadProjectionMatrix(mat) end
---@public
---@param mat Matrix4x4
---@return void
function GL.MultMatrix(mat) end
---@public
---@param proj Matrix4x4
---@param renderIntoTexture bool
---@return Matrix4x4
function GL.GetGPUProjectionMatrix(proj, renderIntoTexture) end
---@public
---@param revertBackFaces bool
---@return void
function GL.SetRevertBackfacing(revertBackFaces) end
---@public
---@param clearDepth bool
---@param clearColor bool
---@param backgroundColor Color
---@return void
function GL.Clear(clearDepth, clearColor, backgroundColor) end
---@public
---@param clearDepth bool
---@param clearColor bool
---@param backgroundColor Color
---@param depth Single
---@return void
function GL.Clear(clearDepth, clearColor, backgroundColor, depth) end
---@public
---@param clearDepth bool
---@param camera Camera
---@return void
function GL.ClearWithSkybox(clearDepth, camera) end
---@public
---@return void
function GL.Flush() end
---@public
---@return void
function GL.InvalidateState() end
---@public
---@param eventID Int32
---@return void
function GL.IssuePluginEvent(eventID) end
---@public
---@param callback IntPtr
---@param eventID Int32
---@return void
function GL.IssuePluginEvent(callback, eventID) end
---@public
---@return void
function GL.RenderTargetBarrier() end
