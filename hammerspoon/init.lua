-- Config
config = {}
config.apps = {
  ['Kitty'] = {
    bundleID = 'net.kovidgoyal.kitty',
    key = 'space',
  },
  ['Chrome'] = {
    bundleID = 'com.google.Chrome',
    key = 'c',
  },
  ['Spotify'] = {
    bundleID = 'com.spotify.client',
    key = 'r',
  },
}

-- Bind application hotkeys
hs.fnutils.each(config.apps, function(app)
  hs.hotkey.bind({ 'ctrl', 'shift' }, app.key, function()
    hs.application.launchOrFocusByBundleID(app.bundleID)
  end)
end)

hs.hotkey.bind({ 'ctrl', 'shift' }, 'j', function()
  -- TODO: if is already open, create a new window

  -- local journal = hs.application.findWindow('vimwiki')

  -- local kitty = hs.application.find(config.apps['Kitty'].bundleID)

  -- if kitty then
  --   -- NOTE: this will only return for current Space. Use hs.window.filter instead
  --   local window = kitty:getWindow()
  -- else
  --   print('not found')
  -- end

  io.popen(
    '/Applications/kitty.app/Contents/MacOS/kitty --title=vimwiki --single-instance --instance-group=1 -d=~/Dropbox/vimwiki nvim +VimwikiIndex'
  )
end)

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
