---@diagnostic disable: missing-return, undefined-doc-name
---@class love.audio
---Provides an interface to create noise with the user's speakers.
local m = {}

--region RecordingDevice
---@class RecordingDevice
---Represents an audio input device capable of recording sounds.
local RecordingDevice = {}
---Gets the number of bits per sample in the data currently being recorded.
---@return number
function RecordingDevice:getBitDepth() end

---Gets the number of channels currently being recorded (mono or stereo).
---@return number
function RecordingDevice:getChannelCount() end

---Gets all recorded audio SoundData stored in the device's internal ring buffer.
---
---The internal ring buffer is cleared when this function is called, so calling it again will only get audio recorded after the previous call. If the device's internal ring buffer completely fills up before getData is called, the oldest data that doesn't fit into the buffer will be lost.
---@return SoundData
function RecordingDevice:getData() end

---Gets the name of the recording device.
---@return string
function RecordingDevice:getName() end

---Gets the number of currently recorded samples.
---@return number
function RecordingDevice:getSampleCount() end

---Gets the number of samples per second currently being recorded.
---@return number
function RecordingDevice:getSampleRate() end

---Gets whether the device is currently recording.
---@return boolean
function RecordingDevice:isRecording() end

---Begins recording audio using this device.
---@param samplecount number @The maximum number of samples to store in an internal ring buffer when recording. RecordingDevice:getData clears the internal buffer when called.
---@param samplerate number @The number of samples per second to store when recording.
---@param bitdepth number @The number of bits per sample.
---@param channels number @Whether to record in mono or stereo. Most microphones don't support more than 1 channel.
---@return boolean
function RecordingDevice:start(samplecount, samplerate, bitdepth, channels) end

---Stops recording audio from this device. Any sound data currently in the device's buffer will be returned.
---@return SoundData
function RecordingDevice:stop() end

--endregion RecordingDevice
--region Source
---@class Source
---A Source represents audio you can play back.
---
---You can do interesting things with Sources, like set the volume, pitch, and its position relative to the listener. Please note that positional audio only works for mono (i.e. non-stereo) sources.
---
---The Source controls (play/pause/stop) act according to the following state table.
local Source = {}
---Creates an identical copy of the Source in the stopped state.
---
---Static Sources will use significantly less memory and take much less time to be created if Source:clone is used to create them instead of love.audio.newSource, so this method should be preferred when making multiple Sources which play the same sound.
---@return Source
function Source:clone() end

---Gets a list of the Source's active effect names.
---@return table
function Source:getActiveEffects() end

---Gets the amount of air absorption applied to the Source.
---
---By default the value is set to 0 which means that air absorption effects are disabled. A value of 1 will apply high frequency attenuation to the Source at a rate of 0.05 dB per meter.
---@return number
function Source:getAirAbsorption() end

---Gets the reference and maximum attenuation distances of the Source. The values, combined with the current DistanceModel, affect how the Source's volume attenuates based on distance from the listener.
---@return number, number
function Source:getAttenuationDistances() end

---Gets the number of channels in the Source. Only 1-channel (mono) Sources can use directional and positional effects.
---@return number
function Source:getChannelCount() end

---Gets the Source's directional volume cones. Together with Source:setDirection, the cone angles allow for the Source's volume to vary depending on its direction.
---@return number, number, number
function Source:getCone() end

---Gets the direction of the Source.
---@return number, number, number
function Source:getDirection() end

---Gets the duration of the Source. For streaming Sources it may not always be sample-accurate, and may return -1 if the duration cannot be determined at all.
---@param unit TimeUnit @The time unit for the return value.
---@return number
function Source:getDuration(unit) end

---Gets the filter settings associated to a specific effect.
---
---This function returns nil if the effect was applied with no filter settings associated to it.
---@param name string @The name of the effect.
---@param filtersettings table @An optional empty table that will be filled with the filter settings.
---@return table
function Source:getEffect(name, filtersettings) end

---Gets the filter settings currently applied to the Source.
---@return table
function Source:getFilter() end

---Gets the number of free buffer slots in a queueable Source. If the queueable Source is playing, this value will increase up to the amount the Source was created with. If the queueable Source is stopped, it will process all of its internal buffers first, in which case this function will always return the amount it was created with.
---@return number
function Source:getFreeBufferCount() end

---Gets the current pitch of the Source.
---@return number
function Source:getPitch() end

---Gets the position of the Source.
---@return number, number, number
function Source:getPosition() end

---Returns the rolloff factor of the source.
---@return number
function Source:getRolloff() end

---Gets the type of the Source.
---@return SourceType
function Source:getType() end

---Gets the velocity of the Source.
---@return number, number, number
function Source:getVelocity() end

---Gets the current volume of the Source.
---@return number
function Source:getVolume() end

---Returns the volume limits of the source.
---@return number, number
function Source:getVolumeLimits() end

---Returns whether the Source will loop.
---@return boolean
function Source:isLooping() end

---Returns whether the Source is playing.
---@return boolean
function Source:isPlaying() end

---Gets whether the Source's position, velocity, direction, and cone angles are relative to the listener.
---@return boolean
function Source:isRelative() end

---Pauses the Source.
function Source:pause() end

---Starts playing the Source.
---@return boolean
function Source:play() end

---Queues SoundData for playback in a queueable Source.
---
---This method requires the Source to be created via love.audio.newQueueableSource.
---@param sounddata SoundData @The data to queue. The SoundData's sample rate, bit depth, and channel count must match the Source's.
---@return boolean
function Source:queue(sounddata) end

---Sets the currently playing position of the Source.
---@param offset number @The position to seek to.
---@param unit TimeUnit @The unit of the position value.
function Source:seek(offset, unit) end

---Sets the amount of air absorption applied to the Source.
---
---By default the value is set to 0 which means that air absorption effects are disabled. A value of 1 will apply high frequency attenuation to the Source at a rate of 0.05 dB per meter.
---
---Air absorption can simulate sound transmission through foggy air, dry air, smoky atmosphere, etc. It can be used to simulate different atmospheric conditions within different locations in an area.
---@param amount number @The amount of air absorption applied to the Source. Must be between 0 and 10.
function Source:setAirAbsorption(amount) end

---Sets the reference and maximum attenuation distances of the Source. The parameters, combined with the current DistanceModel, affect how the Source's volume attenuates based on distance.
---
---Distance attenuation is only applicable to Sources based on mono (rather than stereo) audio.
---@param ref number @The new reference attenuation distance. If the current DistanceModel is clamped, this is the minimum attenuation distance.
---@param max number @The new maximum attenuation distance.
function Source:setAttenuationDistances(ref, max) end

---Sets the Source's directional volume cones. Together with Source:setDirection, the cone angles allow for the Source's volume to vary depending on its direction.
---@param innerAngle number @The inner angle from the Source's direction, in radians. The Source will play at normal volume if the listener is inside the cone defined by this angle.
---@param outerAngle number @The outer angle from the Source's direction, in radians. The Source will play at a volume between the normal and outer volumes, if the listener is in between the cones defined by the inner and outer angles.
---@param outerVolume number @The Source's volume when the listener is outside both the inner and outer cone angles.
function Source:setCone(innerAngle, outerAngle, outerVolume) end

---Sets the direction vector of the Source. A zero vector makes the source non-directional.
---@param x number @The X part of the direction vector.
---@param y number @The Y part of the direction vector.
---@param z number @The Z part of the direction vector.
function Source:setDirection(x, y, z) end

---Applies an audio effect to the Source.
---
---The effect must have been previously defined using love.audio.setEffect.
---@param name string @The name of the effect previously set up with love.audio.setEffect.
---@param enable boolean @If false and the given effect name was previously enabled on this Source, disables the effect.
---@return boolean
---@overload fun(name:string, filtersettings:table):boolean
function Source:setEffect(name, enable) end

---Sets a low-pass, high-pass, or band-pass filter to apply when playing the Source.
---@param settings table @The filter settings to use for this Source, with the following fields:
---@return boolean
function Source:setFilter(settings) end

---Sets whether the Source should loop.
---@param loop boolean @True if the source should loop, false otherwise.
function Source:setLooping(loop) end

---Sets the pitch of the Source.
---@param pitch number @Calculated with regard to 1 being the base pitch. Each reduction by 50 percent equals a pitch shift of -12 semitones (one octave reduction). Each doubling equals a pitch shift of 12 semitones (one octave increase). Zero is not a legal value.
function Source:setPitch(pitch) end

---Sets the position of the Source. Please note that this only works for mono (i.e. non-stereo) sound files!
---@param x number @The X position of the Source.
---@param y number @The Y position of the Source.
---@param z number @The Z position of the Source.
function Source:setPosition(x, y, z) end

---Sets whether the Source's position, velocity, direction, and cone angles are relative to the listener, or absolute.
---
---By default, all sources are absolute and therefore relative to the origin of love's coordinate system 0, 0. Only absolute sources are affected by the position of the listener. Please note that positional audio only works for mono (i.e. non-stereo) sources. 
---@param enable boolean @True to make the position, velocity, direction and cone angles relative to the listener, false to make them absolute.
function Source:setRelative(enable) end

---Sets the rolloff factor which affects the strength of the used distance attenuation.
---
---Extended information and detailed formulas can be found in the chapter '3.4. Attenuation By Distance' of OpenAL 1.1 specification.
---@param rolloff number @The new rolloff factor.
function Source:setRolloff(rolloff) end

---Sets the velocity of the Source.
---
---This does '''not''' change the position of the Source, but lets the application know how it has to calculate the doppler effect.
---@param x number @The X part of the velocity vector.
---@param y number @The Y part of the velocity vector.
---@param z number @The Z part of the velocity vector.
function Source:setVelocity(x, y, z) end

---Sets the current volume of the Source.
---@param volume number @The volume for a Source, where 1.0 is normal volume. Volume cannot be raised above 1.0.
function Source:setVolume(volume) end

---Sets the volume limits of the source. The limits have to be numbers from 0 to 1.
---@param min number @The minimum volume.
---@param max number @The maximum volume.
function Source:setVolumeLimits(min, max) end

---Stops a Source.
function Source:stop() end

---Gets the currently playing position of the Source.
---@param unit TimeUnit @The type of unit for the return value.
---@return number
function Source:tell(unit) end

--endregion Source
---Gets a list of the names of the currently enabled effects.
---@return table
function m.getActiveEffects() end

---Gets the current number of simultaneously playing sources.
---@return number
function m.getActiveSourceCount() end

---Returns the distance attenuation model.
---@return DistanceModel
function m.getDistanceModel() end

---Gets the current global scale factor for velocity-based doppler effects.
---@return number
function m.getDopplerScale() end

---Gets the settings associated with an effect.
---@param name string @The name of the effect.
---@return table
function m.getEffect(name) end

---Gets the maximum number of active effects supported by the system.
---@return number
function m.getMaxSceneEffects() end

---Gets the maximum number of active Effects in a single Source object, that the system can support.
---@return number
function m.getMaxSourceEffects() end

---Returns the orientation of the listener.
---@return number, number, number, number, number, number
function m.getOrientation() end

---Returns the position of the listener. Please note that positional audio only works for mono (i.e. non-stereo) sources.
---@return number, number, number
function m.getPosition() end

---Gets a list of RecordingDevices on the system.
---
---The first device in the list is the user's default recording device. The list may be empty if there are no microphones connected to the system.
---
---Audio recording is currently not supported on iOS.
---@return table
function m.getRecordingDevices() end

---Returns the velocity of the listener.
---@return number, number, number
function m.getVelocity() end

---Returns the master volume.
---@return number
function m.getVolume() end

---Gets whether audio effects are supported in the system.
---@return boolean
function m.isEffectsSupported() end

---Creates a new Source usable for real-time generated sound playback with Source:queue.
---@param samplerate number @Number of samples per second when playing.
---@param bitdepth number @Bits per sample (8 or 16).
---@param channels number @1 for mono or 2 for stereo.
---@param buffercount number @The number of buffers that can be queued up at any given time with Source:queue. Cannot be greater than 64. A sensible default (~8) is chosen if no value is specified.
---@return Source
function m.newQueueableSource(samplerate, bitdepth, channels, buffercount) end

---Creates a new Source from a filepath, File, Decoder or SoundData.
---
---Sources created from SoundData are always static.
---@param filename string @The filepath to the audio file.
---@param type SourceType @Streaming or static source.
---@return Source
---@overload fun(file:File, type:SourceType):Source
---@overload fun(decoder:Decoder, type:SourceType):Source
---@overload fun(data:FileData, type:SourceType):Source
---@overload fun(data:SoundData):Source
function m.newSource(filename, type) end

---Pauses specific or all currently played Sources.
---@return table
---@overload fun(source:Source, ...:Source):void
---@overload fun(sources:table):void
function m.pause() end

---Plays the specified Source.
---@param source Source @The Source to play.
---@overload fun(sources:table):void
---@overload fun(source1:Source, source2:Source, ...:Source):void
function m.play(source) end

---Sets the distance attenuation model.
---@param model DistanceModel @The new distance model.
function m.setDistanceModel(model) end

---Sets a global scale factor for velocity-based doppler effects. The default scale value is 1.
---@param scale number @The new doppler scale factor. The scale must be greater than 0.
function m.setDopplerScale(scale) end

---Defines an effect that can be applied to a Source.
---
---Not all system supports audio effects. Use love.audio.isEffectsSupported to check.
---@param name string @The name of the effect.
---@param settings table @The settings to use for this effect, with the following fields:
---@return boolean
---@overload fun(name:string, enabled:boolean):boolean
function m.setEffect(name, settings) end

---Sets whether the system should mix the audio with the system's audio.
---@param mix boolean @True to enable mixing, false to disable it.
---@return boolean
function m.setMixWithSystem(mix) end

---Sets the orientation of the listener.
---@param fx any, fy, fz number @Forward vector of the listener orientation.
---@param ux any, uy, uz number @Up vector of the listener orientation.
function m.setOrientation(fx, fy, fz, ux, uy, uz) end

---Sets the position of the listener, which determines how sounds play.
---@param x number @The x position of the listener.
---@param y number @The y position of the listener.
---@param z number @The z position of the listener.
function m.setPosition(x, y, z) end

---Sets the velocity of the listener.
---@param x number @The X velocity of the listener.
---@param y number @The Y velocity of the listener.
---@param z number @The Z velocity of the listener.
function m.setVelocity(x, y, z) end

---Sets the master volume.
---@param volume number @1.0 is max and 0.0 is off.
function m.setVolume(volume) end

---Stops currently played sources.
---@overload fun(source:Source):void
---@overload fun(source1:Source, source2:Source, ...:Source):void
---@overload fun(sources:table):void
function m.stop() end

return m