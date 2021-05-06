local parser = {}

local duration_seconds = {
   second = 1,
   minute = 60,
   hour = 60 * 60,
   day = 60 * 60 * 24,
}

local suffixes = {s = 'second', m = 'minute', h = 'hour', d = 'day'}

function parser.parse_duration(duration_str)
   local joined_suffixes = table.concat(vim.tbl_keys(suffixes))
   if not duration_str:find('^%s*%d+[' .. joined_suffixes .. ']?%s*$') then
      return nil
   end
   duration_str = vim.trim(duration_str)
   local suffix = duration_str:match('[' .. joined_suffixes .. ']')
   local unit_seconds = 1
   if suffix then
      local duration_type = suffixes[suffix]
      unit_seconds = duration_seconds[duration_type]
   end
   local coefficient = duration_str:match('%d+')
   return coefficient * unit_seconds
end

function parser.suffix_completion()
   return vim.tbl_keys(suffixes)
end

return parser
