---@diagnostic disable: missing-return, undefined-doc-name, luadoc-miss-arg-name
---@class love.thread
---Allows you to work with threads.
---
---Threads are separate Lua environments, running in parallel to the main code. As their code runs separately, they can be used to compute complex operations without adversely affecting the frame rate of the main thread. However, as they are separate environments, they cannot access the variables and functions of the main thread, and communication between threads is limited.
---
---All LOVE objects (userdata) are shared among threads so you'll only have to send their references across threads. You may run into concurrency issues if you manipulate an object on multiple threads at the same time.
---
---When a Thread is started, it only loads the love.thread module. Every other module has to be loaded with require.
local m = {}

--region Channel
---@class Channel
---An object which can be used to send and receive data between different threads.
local Channel = {}
---Clears all the messages in the Channel queue.
function Channel:clear() end

---Retrieves the value of a Channel message and removes it from the message queue.
---
---It waits until a message is in the queue then returns the message value.
---@return Variant
---@overload fun(timeout:number):Variant
function Channel:demand() end

---Retrieves the number of messages in the thread Channel queue.
---@return number
function Channel:getCount() end

---Gets whether a pushed value has been popped or otherwise removed from the Channel.
---@param id number @An id value previously returned by Channel:push.
---@return boolean
function Channel:hasRead(id) end

---Retrieves the value of a Channel message, but leaves it in the queue.
---
---It returns nil if there's no message in the queue.
---@return Variant
function Channel:peek() end

---Executes the specified function atomically with respect to this Channel.
---
---Calling multiple methods in a row on the same Channel is often useful. However if multiple Threads are calling this Channel's methods at the same time, the different calls on each Thread might end up interleaved (e.g. one or more of the second thread's calls may happen in between the first thread's calls.)
---
---This method avoids that issue by making sure the Thread calling the method has exclusive access to the Channel until the specified function has returned.
---@param func function @The function to call, the form of function(channel, arg1, arg2, ...) end. The Channel is passed as the first argument to the function when it is called.
---@param ... any @Additional arguments that the given function will receive when it is called.
---@return any, any
function Channel:performAtomic(func, ...) end

---Retrieves the value of a Channel message and removes it from the message queue.
---
---It returns nil if there are no messages in the queue.
---@return Variant
function Channel:pop() end

---Send a message to the thread Channel.
---
---See Variant for the list of supported types.
---@param value Variant @The contents of the message.
---@return number
function Channel:push(value) end

---Send a message to the thread Channel and wait for a thread to accept it.
---
---See Variant for the list of supported types.
---@param value Variant @The contents of the message.
---@return boolean
---@overload fun(value:Variant, timeout:number):boolean
function Channel:supply(value) end

--endregion Channel
--region Thread
---@class Thread
---A Thread is a chunk of code that can run in parallel with other threads. Data can be sent between different threads with Channel objects.
local Thread = {}
---Retrieves the error string from the thread if it produced an error.
---@return string
function Thread:getError() end

---Returns whether the thread is currently running.
---
---Threads which are not running can be (re)started with Thread:start.
---@return boolean
function Thread:isRunning() end

---Starts the thread.
---
---Beginning with version 0.9.0, threads can be restarted after they have completed their execution.
---@overload fun(...:Variant):void
function Thread:start() end

---Wait for a thread to finish.
---
---This call will block until the thread finishes.
function Thread:wait() end

--endregion Thread
---Creates or retrieves a named thread channel.
---@param name string @The name of the channel you want to create or retrieve.
---@return Channel
function m.getChannel(name) end

---Create a new unnamed thread channel.
---
---One use for them is to pass new unnamed channels to other threads via Channel:push on a named channel.
---@return Channel
function m.newChannel() end

---Creates a new Thread from a filename, string or FileData object containing Lua code.
---@param filename string @The name of the Lua file to use as the source.
---@return Thread
---@overload fun(fileData:FileData):Thread
---@overload fun(codestring:string):Thread
function m.newThread(filename) end

return m