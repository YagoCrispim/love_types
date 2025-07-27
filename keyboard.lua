---@diagnostic disable: missing-return, undefined-doc-name, luadoc-miss-arg-name
---@---@class love.keyboard
---Provides an interface to the user's keyboard.
local m = {}

---Keyboard scancodes.
---
---Scancodes are keyboard layout-independent, so the scancode "w" will be generated if the key in the same place as the "w" key on an American QWERTY keyboard is pressed, no matter what the key is labelled or what the user's operating system settings are.
---
---Using scancodes, rather than keycodes, is useful because keyboards with layouts differing from the US/UK layout(s) might have keys that generate 'unknown' keycodes, but the scancodes will still be detected. This however would necessitate having a list for each keyboard layout one would choose to support.
---
---Gets the key corresponding to the given hardware scancode.
---
---Unlike key constants, Scancodes are keyboard layout-independent. For example the scancode 'w' will be generated if the key in the same place as the 'w' key on an American keyboard is pressed, no matter what the key is labelled or what the user's operating system settings are.
---
---Scancodes are useful for creating default controls that have the same physical locations on on all systems.
---@param scancode Scancode @The scancode to get the key from.
---@return KeyConstant
function m.getKeyFromScancode(scancode) end

---Gets the hardware scancode corresponding to the given key.
---
---Unlike key constants, Scancodes are keyboard layout-independent. For example the scancode 'w' will be generated if the key in the same place as the 'w' key on an American keyboard is pressed, no matter what the key is labelled or what the user's operating system settings are.
---
---Scancodes are useful for creating default controls that have the same physical locations on on all systems.
---@param key KeyConstant @The key to get the scancode from.
---@return Scancode
function m.getScancodeFromKey(key) end

---Gets whether key repeat is enabled.
---@return boolean
function m.hasKeyRepeat() end

---Gets whether screen keyboard is supported.
---@return boolean
function m.hasScreenKeyboard() end

---Gets whether text input events are enabled.
---@return boolean
function m.hasTextInput() end

---Checks whether a certain key is down. Not to be confused with love.keypressed or love.keyreleased.
---@param key KeyConstant @The key to check.
---@return boolean
---@overload fun(key:KeyConstant, ...:KeyConstant):boolean
function m.isDown(key) end

---Checks whether the specified Scancodes are pressed. Not to be confused with love.keypressed or love.keyreleased.
---
---Unlike regular KeyConstants, Scancodes are keyboard layout-independent. The scancode 'w' is used if the key in the same place as the 'w' key on an American keyboard is pressed, no matter what the key is labelled or what the user's operating system settings are.
---@param scancode Scancode @A Scancode to check.
---@param ... Scancode @Additional Scancodes to check.
---@return boolean
function m.isScancodeDown(scancode, ...) end

---Enables or disables key repeat for love.keypressed. It is disabled by default.
---@param enable boolean @Whether repeat keypress events should be enabled when a key is held down.
function m.setKeyRepeat(enable) end

---Enables or disables text input events. It is enabled by default on Windows, Mac, and Linux, and disabled by default on iOS and Android.
---
---On touch devices, this shows the system's native on-screen keyboard when it's enabled.
---@param enable boolean @Whether text input events should be enabled.
---@overload fun(enable:boolean, x:number, y:number, w:number, h:number):void
function m.setTextInput(enable) end

return m