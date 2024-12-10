local class = require('class')
local sandbox_client = require('sandbox/client')

local client, get = class('plugin_framework')

function client:init(original_client)
  self._plugin_name = self:asserts(
    self.plugin_name,
    'string',
    "Mismatch in type string on name"
  )

  self._target_bot_version = self:asserts(
    self.target_bot_version,
    'string',
    "Mismatch in type string on target bot version"
  )

  self._minimum_bot_version = self:asserts(
    self.minimum_bot_version,
    'string',
    "Mismatch in type string on target bot version"
  )

  self._client = sandbox_client(original_client)
end

function client:asserts(value, data_type, err_msg)
  if type(value) ~= data_type then
    error(err_msg)
  end
  return value
end

function client:load()
  error("This external client plugin doesn't have name")
end

function get:plugin_name()
  error("This external client plugin doesn't have name")
end

function get:target_bot_version()
  error("This external client plugin doesn't have target bot version")
end

function get:minimum_bot_version()
  error("This external client plugin doesn't have minimum bot version")
end

function get:fingerprint()
  return string.format('%s/LunaticSea/%s/%s/%s',
    self._plugin_name,
    self._target_bot_version,
    self._minimum_bot_version,
    self:__code_gen(12, 15052008)
  )
end

function client:__code_gen(length, seed)
  local chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
  local randomString = ''

  math.randomseed(seed)

  local charTable = {}
  for c in chars:gmatch"." do
    table.insert(charTable, c)
  end

  for i = 1, length do
    randomString = randomString .. charTable[math.random(1, #charTable)]
  end

  return randomString
end

return client