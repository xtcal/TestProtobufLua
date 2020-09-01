---@class TextGenerator : Object
---@field public verts IList
---@field public characters IList
---@field public lines IList
---@field public rectExtents Rect
---@field public vertexCount Int32
---@field public characterCount Int32
---@field public characterCountVisible Int32
---@field public lineCount Int32
---@field public fontSizeUsedForBestFit Int32
local TextGenerator = {}
---@public
---@return void
function TextGenerator:Invalidate() end
---@public
---@param characters List
---@return void
function TextGenerator:GetCharacters(characters) end
---@public
---@param lines List
---@return void
function TextGenerator:GetLines(lines) end
---@public
---@param vertices List
---@return void
function TextGenerator:GetVertices(vertices) end
---@public
---@param str string
---@param settings TextGenerationSettings
---@return Single
function TextGenerator:GetPreferredWidth(str, settings) end
---@public
---@param str string
---@param settings TextGenerationSettings
---@return Single
function TextGenerator:GetPreferredHeight(str, settings) end
---@public
---@param str string
---@param settings TextGenerationSettings
---@param context GameObject
---@return bool
function TextGenerator:PopulateWithErrors(str, settings, context) end
---@public
---@param str string
---@param settings TextGenerationSettings
---@return bool
function TextGenerator:Populate(str, settings) end
---@public
---@return UIVertex[]
function TextGenerator:GetVerticesArray() end
---@public
---@return UICharInfo[]
function TextGenerator:GetCharactersArray() end
---@public
---@return UILineInfo[]
function TextGenerator:GetLinesArray() end
