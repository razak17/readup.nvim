local utils = require("readup")

describe("parse_plugin_name", function()
	it("extracts plugin name from full identifier", function()
		local result = utils.parse_plugin_name("author/plugin-name")
		assert.are.equal("plugin-name", result)
	end)

	it("returns the same name if no author part is provided", function()
		local result = utils.parse_plugin_name("plugin-name")
		assert.are.equal("plugin-name", result)
	end)

	it("handles empty string input", function()
		local result = utils.parse_plugin_name("")
		assert.are.equal("", result)
	end)

	it("returns input as-is for invalid format", function()
		local result = utils.parse_plugin_name("invalid-format")
		assert.are.equal("invalid-format", result)
	end)

	it("handles multiple slashes in input", function()
		local result = utils.parse_plugin_name("author/mid/plugin-name")
		assert.are.equal("plugin-name", result)
	end)

	it("handles special characters in plugin name", function()
		local result = utils.parse_plugin_name("author/plugin-name_v1")
		assert.are.equal("plugin-name_v1", result)
	end)
end)
