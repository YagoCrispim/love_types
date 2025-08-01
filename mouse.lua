---@diagnostic disable: missing-return, undefined-doc-name, luadoc-miss-arg-name
---@class love.mouse
---Provides an interface to the user's mouse.
local m = {}

--region Cursor
---@class Cursor
---Represents a hardware cursor.
local Cursor = {}
---Gets the type of the Cursor.
---@return CursorType
function Cursor:getType() end

--endregion Cursor
---Gets the current Cursor.
---@return Cursor
function m.getCursor() end

---Returns the current position of the mouse.
---@return number, number
function m.getPosition() end

---Gets whether relative mode is enabled for the mouse.
---
---If relative mode is enabled, the cursor is hidden and doesn't move when the mouse does, but relative mouse motion events are still generated via love.mousemoved. This lets the mouse move in any direction indefinitely without the cursor getting stuck at the edges of the screen.
---
---The reported position of the mouse is not updated while relative mode is enabled, even when relative mouse motion events are generated.
---@return boolean
function m.getRelativeMode() end

---Gets a Cursor object representing a system-native hardware cursor.
---
---Hardware cursors are framerate-independent and work the same way as normal operating system cursors. Unlike drawing an image at the mouse's current coordinates, hardware cursors never have visible lag between when the mouse is moved and when the cursor position updates, even at low framerates.
---@param ctype CursorType @The type of system cursor to get.
---@return Cursor
function m.getSystemCursor(ctype) end

---Returns the current x-position of the mouse.
---@return number
function m.getX() end

---Returns the current y-position of the mouse.
---@return number
function m.getY() end

---Gets whether cursor functionality is supported.
---
---If it isn't supported, calling love.mouse.newCursor and love.mouse.getSystemCursor will cause an error. Mobile devices do not support cursors.
---@return boolean
function m.isCursorSupported() end

---Checks whether a certain mouse button is down.
---
---This function does not detect mouse wheel scrolling; you must use the love.wheelmoved (or love.mousepressed in version 0.9.2 and older) callback for that.
---@param button number @The index of a button to check. 1 is the primary mouse button, 2 is the secondary mouse button and 3 is the middle button. Further buttons are mouse dependant.
---@param ... number @Additional button numbers to check.
---@return boolean
function m.isDown(button, ...) end

---Checks if the mouse is grabbed.
---@return boolean
function m.isGrabbed() end

---Checks if the cursor is visible.
---@return boolean
function m.isVisible() end

---Creates a new hardware Cursor object from an image file or ImageData.
---
---Hardware cursors are framerate-independent and work the same way as normal operating system cursors. Unlike drawing an image at the mouse's current coordinates, hardware cursors never have visible lag between when the mouse is moved and when the cursor position updates, even at low framerates.
---
---The hot spot is the point the operating system uses to determine what was clicked and at what position the mouse cursor is. For example, the normal arrow pointer normally has its hot spot at the top left of the image, but a crosshair cursor might have it in the middle.
---@param imageData ImageData @The ImageData to use for the new Cursor.
---@param hotx number @The x-coordinate in the ImageData of the cursor's hot spot.
---@param hoty number @The y-coordinate in the ImageData of the cursor's hot spot.
---@return Cursor
---@overload fun(filename:string, hotx:number, hoty:number):Cursor
---@overload fun(fileData:FileData, hotx:number, hoty:number):Cursor
function m.newCursor(imageData, hotx, hoty) end

---Sets the current mouse cursor.
---@param cursor Cursor @The Cursor object to use as the current mouse cursor.
function m.setCursor(cursor) end

---Grabs the mouse and confines it to the window.
---@param grab boolean @True to confine the mouse, false to let it leave the window.
function m.setGrabbed(grab) end

---Sets the current position of the mouse. Non-integer values are floored.
---@param x number @The new position of the mouse along the x-axis.
---@param y number @The new position of the mouse along the y-axis.
function m.setPosition(x, y) end

---Sets whether relative mode is enabled for the mouse.
---
---When relative mode is enabled, the cursor is hidden and doesn't move when the mouse does, but relative mouse motion events are still generated via love.mousemoved. This lets the mouse move in any direction indefinitely without the cursor getting stuck at the edges of the screen.
---
---The reported position of the mouse may not be updated while relative mode is enabled, even when relative mouse motion events are generated.
---@param enable boolean @True to enable relative mode, false to disable it.
function m.setRelativeMode(enable) end

---Sets the current visibility of the cursor.
---@param visible boolean @True to set the cursor to visible, false to hide the cursor.
function m.setVisible(visible) end

---Sets the current X position of the mouse.
---
---Non-integer values are floored.
---@param x number @The new position of the mouse along the x-axis.
function m.setX(x) end

---Sets the current Y position of the mouse.
---
---Non-integer values are floored.
---@param y number @The new position of the mouse along the y-axis.
function m.setY(y) end

return m
