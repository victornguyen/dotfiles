-- Global mic mute
mic = hs.audiodevice.defaultInputDevice()

function getMicStatus()
  if mic:inputMuted() then
    return 'Muted'
  else
    return 'Unmuted!'
  end
end

function toggleMic()
  if mic:inputMuted() then
    mic:setInputMuted(false)
    hs.notify.show('Microphone', getMicStatus(), '')
  else
    mic:setInputMuted(true)
    hs.notify.show('Microphone', getMicStatus(), '')
  end
  indicator:setTitle(getMicStatus())
end

indicator = hs.menubar.new():setClickCallback(toggleMic):setTitle(getMicStatus())

-- TODO: bind this to something like F19 for the macropad
hs.hotkey.bind({ 'ctrl', 'shift' }, 'm', function()
  toggleMic()
end)

hs.fnutils.each(hs.application.runningApplications(), function(app)
  print(app:title())
end)

-- Done!
hs.notify.show('Hammerspoon', 'Config loaded', '')
