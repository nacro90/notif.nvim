local notif = {}

local log = require('notif.log')
local parser = require('notif.parser')

local uv = vim.loop
local cmd = vim.cmd
local api = vim.api
local fn = vim.fn

local opts = {create_commands = true, message_highlight = 'WarningMsg'}

function notif.setup(custom_opts)
   if custom_opts then opts = vim.tbl_extend('force', opts, custom_opts) end
   if opts.create_commands then
      cmd [[command! -nargs=+ Notif lua require('notif').notify(<f-args>)]]
   end
end

local function set_timer(duration, callback)
   log.debug('set_timer(), when:', duration)
   local seconds = parser.parse_duration(duration)
   local timer = uv.new_timer()
   timer:start(seconds * 1000, 0, function()
      vim.schedule(callback)
      timer:stop()
      timer:close()
   end)
end

function notif.notify(duration, message)
   log.debug('set_timer(), duration:', duration, ', message:', message)
   if not message then
      message = fn.input('Message: ')
      log.info('message set:', message)
   end
   set_timer(duration, function()
      api.nvim_echo({{message, opts.message_highlight}}, true, {})
   end)

end

return notif
