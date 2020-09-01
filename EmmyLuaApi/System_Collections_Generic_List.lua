---@class List : Object
---@field public Capacity Int32
---@field public Count Int32
---@field public Item Int32
local List = {}
---@public
---@param item Int32
---@return void
function List:Add(item) end
---@public
---@param collection IEnumerable
---@return void
function List:AddRange(collection) end
---@public
---@return ReadOnlyCollection
function List:AsReadOnly() end
---@public
---@param item Int32
---@return Int32
function List:BinarySearch(item) end
---@public
---@param item Int32
---@param comparer IComparer
---@return Int32
function List:BinarySearch(item, comparer) end
---@public
---@param index Int32
---@param count Int32
---@param item Int32
---@param comparer IComparer
---@return Int32
function List:BinarySearch(index, count, item, comparer) end
---@public
---@return void
function List:Clear() end
---@public
---@param item Int32
---@return bool
function List:Contains(item) end
---@public
---@param array Int32[]
---@return void
function List:CopyTo(array) end
---@public
---@param array Int32[]
---@param arrayIndex Int32
---@return void
function List:CopyTo(array, arrayIndex) end
---@public
---@param index Int32
---@param array Int32[]
---@param arrayIndex Int32
---@param count Int32
---@return void
function List:CopyTo(index, array, arrayIndex, count) end
---@public
---@param match Predicate
---@return bool
function List:Exists(match) end
---@public
---@param match Predicate
---@return Int32
function List:Find(match) end
---@public
---@param match Predicate
---@return List
function List:FindAll(match) end
---@public
---@param match Predicate
---@return Int32
function List:FindIndex(match) end
---@public
---@param startIndex Int32
---@param match Predicate
---@return Int32
function List:FindIndex(startIndex, match) end
---@public
---@param startIndex Int32
---@param count Int32
---@param match Predicate
---@return Int32
function List:FindIndex(startIndex, count, match) end
---@public
---@param match Predicate
---@return Int32
function List:FindLast(match) end
---@public
---@param match Predicate
---@return Int32
function List:FindLastIndex(match) end
---@public
---@param startIndex Int32
---@param match Predicate
---@return Int32
function List:FindLastIndex(startIndex, match) end
---@public
---@param startIndex Int32
---@param count Int32
---@param match Predicate
---@return Int32
function List:FindLastIndex(startIndex, count, match) end
---@public
---@param action Action
---@return void
function List:ForEach(action) end
---@public
---@return Enumerator
function List:GetEnumerator() end
---@public
---@param index Int32
---@param count Int32
---@return List
function List:GetRange(index, count) end
---@public
---@param item Int32
---@return Int32
function List:IndexOf(item) end
---@public
---@param item Int32
---@param index Int32
---@return Int32
function List:IndexOf(item, index) end
---@public
---@param item Int32
---@param index Int32
---@param count Int32
---@return Int32
function List:IndexOf(item, index, count) end
---@public
---@param index Int32
---@param item Int32
---@return void
function List:Insert(index, item) end
---@public
---@param index Int32
---@param collection IEnumerable
---@return void
function List:InsertRange(index, collection) end
---@public
---@param item Int32
---@return Int32
function List:LastIndexOf(item) end
---@public
---@param item Int32
---@param index Int32
---@return Int32
function List:LastIndexOf(item, index) end
---@public
---@param item Int32
---@param index Int32
---@param count Int32
---@return Int32
function List:LastIndexOf(item, index, count) end
---@public
---@param item Int32
---@return bool
function List:Remove(item) end
---@public
---@param match Predicate
---@return Int32
function List:RemoveAll(match) end
---@public
---@param index Int32
---@return void
function List:RemoveAt(index) end
---@public
---@param index Int32
---@param count Int32
---@return void
function List:RemoveRange(index, count) end
---@public
---@return void
function List:Reverse() end
---@public
---@param index Int32
---@param count Int32
---@return void
function List:Reverse(index, count) end
---@public
---@return void
function List:Sort() end
---@public
---@param comparer IComparer
---@return void
function List:Sort(comparer) end
---@public
---@param comparison Comparison
---@return void
function List:Sort(comparison) end
---@public
---@param index Int32
---@param count Int32
---@param comparer IComparer
---@return void
function List:Sort(index, count, comparer) end
---@public
---@return Int32[]
function List:ToArray() end
---@public
---@return void
function List:TrimExcess() end
---@public
---@param match Predicate
---@return bool
function List:TrueForAll(match) end
