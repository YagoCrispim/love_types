---@diagnostic disable: missing-return, undefined-doc-name, luadoc-miss-arg-name
---@class love.event
---Manages events, like keypresses.
local m = {}

---Clears the event queue.
function m.clear() end

---Returns an iterator for messages in the event queue.
---@return function
function m.poll() end

---Pump events into the event queue.
---
---This is a low-level function, and is usually not called by the user, but by love.run.
---
---Note that this does need to be called for any OS to think you're still running,
---
---and if you want to handle OS-generated events at all (think callbacks).
function m.pump() end

---Adds an event to the event queue.
---
---From 0.10.0 onwards, you may pass an arbitrary amount of arguments with this function, though the default callbacks don't ever use more than six.
---@param n Event @The name of the event.
---@param a Variant @First event argument.
---@param b Variant @Second event argument.
---@param c Variant @Third event argument.
---@param d Variant @Fourth event argument.
---@param e Variant @Fifth event argument.
---@param f Variant @Sixth event argument.
---@param ... Variant @Further event arguments may follow.
function m.push(n, a, b, c, d, e, f, ...) end

---Adds the quit event to the queue.
---
---The quit event is a signal for the event handler to close LÖVE. It's possible to abort the exit process with the love.quit callback.
---@param exitstatus number @The program exit status to use when closing the application.
---@overload fun('restart':string):void
function m.quit(exitstatus) end

---Like love.event.poll(), but blocks until there is an event in the queue.
---@return Event, Variant, Variant, Variant, Variant, Variant, Variant, Variant
function m.wait() end

return m