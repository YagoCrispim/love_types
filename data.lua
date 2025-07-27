---@diagnostic disable: missing-return, undefined-doc-name
---@class love.data
---Provides functionality for creating and transforming data.
local m = {}

--region ByteData
---@class ByteData
---Data object containing arbitrary bytes in an contiguous memory.
---
---There are currently no LÖVE functions provided for manipulating the contents of a ByteData, but Data:getPointer can be used with LuaJIT's FFI to access and write to the contents directly.
local ByteData = {}
--endregion ByteData
--region CompressedData
---@class CompressedData
---Represents byte data compressed using a specific algorithm.
---
---love.data.decompress can be used to de-compress the data (or love.math.decompress in 0.10.2 or earlier).
local CompressedData = {}
---Gets the compression format of the CompressedData.
---@return CompressedDataFormat
function CompressedData:getFormat() end

--endregion CompressedData
---Compresses a string or data using a specific compression algorithm.
---@param container ContainerType @What type to return the compressed data as.
---@param format CompressedDataFormat @The format to use when compressing the string.
---@param rawstring string @The raw (un-compressed) string to compress.
---@param level number @The level of compression to use, between 0 and 9. -1 indicates the default level. The meaning of this argument depends on the compression format being used.
---@return CompressedData or string
---@overload fun(container:ContainerType, format:CompressedDataFormat, data:Data, level:number):CompressedData or string
function m.compress(container, format, rawstring, level) end

---Decode Data or a string from any of the EncodeFormats to Data or string.
---@param container ContainerType @What type to return the decoded data as.
---@param format EncodeFormat @The format of the input data.
---@param sourceString string @The raw (encoded) data to decode.
---@return ByteData or string
---@overload fun(container:ContainerType, format:EncodeFormat, sourceData:Data):ByteData or string
function m.decode(container, format, sourceString) end

---Decompresses a CompressedData or previously compressed string or Data object.
---@param container ContainerType @What type to return the decompressed data as.
---@param compressedData CompressedData @The compressed data to decompress.
---@return Data or string
---@overload fun(container:ContainerType, format:CompressedDataFormat, compressedString:string):Data or string
---@overload fun(container:ContainerType, format:CompressedDataFormat, data:Data):Data or string
function m.decompress(container, compressedData) end

---Encode Data or a string to a Data or string in one of the EncodeFormats.
---@param container ContainerType @What type to return the encoded data as.
---@param format EncodeFormat @The format of the output data.
---@param sourceString string @The raw data to encode.
---@param linelength number @The maximum line length of the output. Only supported for base64, ignored if 0.
---@return ByteData or string
---@overload fun(container:ContainerType, format:EncodeFormat, sourceData:Data, linelength:number):ByteData or string
function m.encode(container, format, sourceString, linelength) end

---Gets the size in bytes that a given format used with love.data.pack will use.
---
---This function behaves the same as Lua 5.3's string.packsize.
---@param format string @A string determining how the values are packed. Follows the rules of Lua 5.3's string.pack format strings.
---@return number
function m.getPackedSize(format) end

---Compute the message digest of a string using a specified hash algorithm.
---@param hashFunction HashFunction @Hash algorithm to use.
---@param string string @String to hash.
---@return string
---@overload fun(hashFunction:HashFunction, data:Data):string
function m.hash(hashFunction, string) end

---Creates a new Data object containing arbitrary bytes.
---
---Data:getPointer along with LuaJIT's FFI can be used to manipulate the contents of the ByteData object after it has been created.
---@param datastring string @The byte string to copy.
---@return ByteData
---@overload fun(Data:Data, offset:number, size:number):ByteData
---@overload fun(size:number):ByteData
function m.newByteData(datastring) end

---Creates a new Data referencing a subsection of an existing Data object.
---@param data Data @The Data object to reference.
---@param offset number @The offset of the subsection to reference, in bytes.
---@param size number @The size in bytes of the subsection to reference.
---@return Data
function m.newDataView(data, offset, size) end

---Packs (serializes) simple Lua values.
---
---This function behaves the same as Lua 5.3's string.pack.
---@param container ContainerType @What type to return the encoded data as.
---@param format string @A string determining how the values are packed. Follows the rules of Lua 5.3's string.pack format strings.
---@param v1 number or boolean or string @The first value (number, boolean, or string) to serialize.
---@param ... number or boolean or string @Additional values to serialize.
---@return Data or string
function m.pack(container, format, v1, ...) end

---Unpacks (deserializes) a byte-string or Data into simple Lua values.
---
---This function behaves the same as Lua 5.3's string.unpack.
---@param format string @A string determining how the values were packed. Follows the rules of Lua 5.3's string.pack format strings.
---@param datastring string @A string containing the packed (serialized) data.
---@param pos number @Where to start reading in the string. Negative values can be used to read relative from the end of the string.
---@return number or boolean or string, number or boolean or string, number
---@overload fun(format:string, data:Data, pos:number):number or boolean or string, number or boolean or string, number
function m.unpack(format, datastring, pos) end

return m