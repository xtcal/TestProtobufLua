---@class Application : Object
---@field public isLoadingLevel bool
---@field public streamedBytes Int32
---@field public isPlaying bool
---@field public isFocused bool
---@field public isEditor bool
---@field public isWebPlayer bool
---@field public platform number
---@field public buildGUID string
---@field public isMobilePlatform bool
---@field public isConsolePlatform bool
---@field public runInBackground bool
---@field public isPlayer bool
---@field public dataPath string
---@field public streamingAssetsPath string
---@field public persistentDataPath string
---@field public temporaryCachePath string
---@field public srcValue string
---@field public absoluteURL string
---@field public unityVersion string
---@field public version string
---@field public installerName string
---@field public identifier string
---@field public installMode number
---@field public sandboxType number
---@field public productName string
---@field public companyName string
---@field public cloudProjectId string
---@field public webSecurityEnabled bool
---@field public webSecurityHostUrl string
---@field public targetFrameRate Int32
---@field public systemLanguage number
---@field public stackTraceLogType number
---@field public backgroundLoadingPriority number
---@field public internetReachability number
---@field public genuine bool
---@field public genuineCheckAvailable bool
---@field public isShowingSplashScreen bool
---@field public levelCount Int32
---@field public loadedLevel Int32
---@field public loadedLevelName string
---@field public absoluteUrl string
---@field public bundleIdentifier string
local Application = {}
---@public
---@param value LowMemoryCallback
---@return void
function Application.add_lowMemory(value) end
---@public
---@param value LowMemoryCallback
---@return void
function Application.remove_lowMemory(value) end
---@public
---@return void
function Application.Quit() end
---@public
---@return void
function Application.CancelQuit() end
---@public
---@return void
function Application.Unload() end
---@public
---@param levelIndex Int32
---@return Single
function Application.GetStreamProgressForLevel(levelIndex) end
---@public
---@param levelName string
---@return Single
function Application.GetStreamProgressForLevel(levelName) end
---@public
---@param levelIndex Int32
---@return bool
function Application.CanStreamedLevelBeLoaded(levelIndex) end
---@public
---@param levelName string
---@return bool
function Application.CanStreamedLevelBeLoaded(levelName) end
---@public
---@return String[]
function Application.GetBuildTags() end
---@public
---@param filename string
---@param superSize Int32
---@return void
function Application.CaptureScreenshot(filename, superSize) end
---@public
---@param filename string
---@return void
function Application.CaptureScreenshot(filename) end
---@public
---@return bool
function Application.HasProLicense() end
---@public
---@param mono Object
---@return void
function Application.DontDestroyOnLoad(mono) end
---@public
---@param functionName string
---@param args Object[]
---@return void
function Application.ExternalCall(functionName, args) end
---@public
---@param script string
---@return void
function Application.ExternalEval(script) end
---@public
---@param delegateMethod AdvertisingIdentifierCallback
---@return bool
function Application.RequestAdvertisingIdentifierAsync(delegateMethod) end
---@public
---@param url string
---@return void
function Application.OpenURL(url) end
---@public
---@param mode Int32
---@return void
function Application.ForceCrash(mode) end
---@public
---@param value LogCallback
---@return void
function Application.add_logMessageReceived(value) end
---@public
---@param value LogCallback
---@return void
function Application.remove_logMessageReceived(value) end
---@public
---@param value LogCallback
---@return void
function Application.add_logMessageReceivedThreaded(value) end
---@public
---@param value LogCallback
---@return void
function Application.remove_logMessageReceivedThreaded(value) end
---@public
---@param logType number
---@return number
function Application.GetStackTraceLogType(logType) end
---@public
---@param logType number
---@param stackTraceType number
---@return void
function Application.SetStackTraceLogType(logType, stackTraceType) end
---@public
---@param mode number
---@return AsyncOperation
function Application.RequestUserAuthorization(mode) end
---@public
---@param mode number
---@return bool
function Application.HasUserAuthorization(mode) end
---@public
---@param handler LogCallback
---@return void
function Application.RegisterLogCallback(handler) end
---@public
---@param handler LogCallback
---@return void
function Application.RegisterLogCallbackThreaded(handler) end
---@public
---@param index Int32
---@return void
function Application.LoadLevel(index) end
---@public
---@param name string
---@return void
function Application.LoadLevel(name) end
---@public
---@param index Int32
---@return void
function Application.LoadLevelAdditive(index) end
---@public
---@param name string
---@return void
function Application.LoadLevelAdditive(name) end
---@public
---@param index Int32
---@return AsyncOperation
function Application.LoadLevelAsync(index) end
---@public
---@param levelName string
---@return AsyncOperation
function Application.LoadLevelAsync(levelName) end
---@public
---@param index Int32
---@return AsyncOperation
function Application.LoadLevelAdditiveAsync(index) end
---@public
---@param levelName string
---@return AsyncOperation
function Application.LoadLevelAdditiveAsync(levelName) end
---@public
---@param index Int32
---@return bool
function Application.UnloadLevel(index) end
---@public
---@param scenePath string
---@return bool
function Application.UnloadLevel(scenePath) end
