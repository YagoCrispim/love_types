---@diagnostic disable: missing-return, undefined-doc-name, luadoc-miss-arg-name
---@class love.image
---Provides an interface to decode encoded image data.
local m = {}

--region CompressedImageData
---@class CompressedImageData
---Represents compressed image data designed to stay compressed in RAM.
---
---CompressedImageData encompasses standard compressed texture formats such as  DXT1, DXT5, and BC5 / 3Dc.
---
---You can't draw CompressedImageData directly to the screen. See Image for that.
local CompressedImageData = {}
---Gets the width and height of the CompressedImageData.
---@return number, number
---@overload fun(level:number):number, number
function CompressedImageData:getDimensions() end

---Gets the format of the CompressedImageData.
---@return CompressedImageFormat
function CompressedImageData:getFormat() end

---Gets the height of the CompressedImageData.
---@return number
---@overload fun(level:number):number
function CompressedImageData:getHeight() end

---Gets the number of mipmap levels in the CompressedImageData. The base mipmap level (original image) is included in the count.
---@return number
function CompressedImageData:getMipmapCount() end

---Gets the width of the CompressedImageData.
---@return number
---@overload fun(level:number):number
function CompressedImageData:getWidth() end

--endregion CompressedImageData
--region ImageData
---@class ImageData
---Raw (decoded) image data.
---
---You can't draw ImageData directly to screen. See Image for that.
local ImageData = {}
---Encodes the ImageData and optionally writes it to the save directory.
---@param format ImageFormat @The format to encode the image as.
---@param filename string @The filename to write the file to. If nil, no file will be written but the FileData will still be returned.
---@return FileData
---@overload fun(outFile:string):void
---@overload fun(outFile:string, format:ImageFormat):void
function ImageData:encode(format, filename) end

---Gets the width and height of the ImageData in pixels.
---@return number, number
function ImageData:getDimensions() end

---Gets the height of the ImageData in pixels.
---@return number
function ImageData:getHeight() end

---Gets the color of a pixel at a specific position in the image.
---
---Valid x and y values start at 0 and go up to image width and height minus 1. Non-integer values are floored.
---
---In versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.
---@param x number @The position of the pixel on the x-axis.
---@param y number @The position of the pixel on the y-axis.
---@return number, number, number, number
function ImageData:getPixel(x, y) end

---Gets the width of the ImageData in pixels.
---@return number
function ImageData:getWidth() end

---Transform an image by applying a function to every pixel.
---
---This function is a higher-order function. It takes another function as a parameter, and calls it once for each pixel in the ImageData.
---
---The passed function is called with six parameters for each pixel in turn. The parameters are numbers that represent the x and y coordinates of the pixel and its red, green, blue and alpha values. The function should return the new red, green, blue, and alpha values for that pixel.
---
---function pixelFunction(x, y, r, g, b, a)
---
---    -- template for defining your own pixel mapping function
---
---    -- perform computations giving the new values for r, g, b and a
---
---    -- ...
---
---    return r, g, b, a
---
---end
---
---In versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.
---@param pixelFunction function @Function to apply to every pixel.
---@param x number @The x-axis of the top-left corner of the area within the ImageData to apply the function to.
---@param y number @The y-axis of the top-left corner of the area within the ImageData to apply the function to.
---@param width number @The width of the area within the ImageData to apply the function to.
---@param height number @The height of the area within the ImageData to apply the function to.
function ImageData:mapPixel(pixelFunction, x, y, width, height) end

---Paste into ImageData from another source ImageData.
---@param source ImageData @Source ImageData from which to copy.
---@param dx number @Destination top-left position on x-axis.
---@param dy number @Destination top-left position on y-axis.
---@param sx number @Source top-left position on x-axis.
---@param sy number @Source top-left position on y-axis.
---@param sw number @Source width.
---@param sh number @Source height.
function ImageData:paste(source, dx, dy, sx, sy, sw, sh) end

---Sets the color of a pixel at a specific position in the image.
---
---Valid x and y values start at 0 and go up to image width and height minus 1.
---
---In versions prior to 11.0, color component values were within the range of 0 to 255 instead of 0 to 1.
---@param x number @The position of the pixel on the x-axis.
---@param y number @The position of the pixel on the y-axis.
---@param r number @The red component (0-1).
---@param g number @The green component (0-1).
---@param b number @The blue component (0-1).
---@param a number @The alpha component (0-1).
---@overload fun(x:number, y:number, color:table):void
function ImageData:setPixel(x, y, r, g, b, a) end

---Gets the pixel format of the ImageData.
---@return PixelFormat
function ImageData:getFormat() end

--endregion ImageData

---Determines whether a file can be loaded as CompressedImageData.
---@param filename string @The filename of the potentially compressed image file.
---@return boolean
---@overload fun(fileData:FileData):boolean
function m.isCompressed(filename) end

---Create a new CompressedImageData object from a compressed image file. LÖVE supports several compressed texture formats, enumerated in the CompressedImageFormat page.
---@param filename string @The filename of the compressed image file.
---@return CompressedImageData
---@overload fun(fileData:FileData):CompressedImageData
function m.newCompressedData(filename) end

---Creates a new ImageData object.
---@param width number @The width of the ImageData.
---@param height number @The height of the ImageData.
---@return ImageData
---@overload fun(width:number, height:number, format:PixelFormat, data:string):ImageData
---@overload fun(width:number, height:number, data:string):ImageData
---@overload fun(filename:string):ImageData
---@overload fun(filedata:FileData):ImageData
function m.newImageData(width, height) end

return m