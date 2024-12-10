local class = require('class')

local sandbox_client, get = class('sandbox_client')

function sandbox_client:init(client)
  self._logd = client._logd
	self._is_test_mode = client._is_test_mode
	self._project_tree = client._project_tree
	-- Will make a sandbox class
	-- self._config = require('../utils/config.lua')
	-- Will make a sandbox class
	-- self._i18n = require('../utils/i18n.lua')(self)
	self._bot_owner = client._bot_owner
	self._commands = client._commands
	self._total_commands = client._total_commands
	self._command_categories = client._command_categories
	self._alias = {}
		-- Will make another way to access database class secure
	-- self._database = {}
	self._icons = client._icons
end

function get:logd()
	return self._logd
end

function get:is_test_mode()
	return self._is_test_mode
end

function get:project_tree()
	return self._project_tree
end

function get:bot_owner()
	return self._bot_owner
end

function get:icons()
	return self._icons
end

return sandbox_client
