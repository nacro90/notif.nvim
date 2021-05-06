local parser = require('notif.parser')

describe('Parsing duration with suffixes', function()

   it('Parse seconds to seconds', function()
      local duration_str = '71s'
      local actual = parser.parse_duration(duration_str)
      local expected = 71
      assert.are.equals(expected, actual)
   end)

   it('Parse minutes to seconds', function()
      local duration_str = '14m'
      local actual = parser.parse_duration(duration_str)
      local expected = 14 * 60
      assert.are.equals(expected, actual)
   end)

   it('Parse hours to seconds', function()
      local duration_str = '4h'
      local actual = parser.parse_duration(duration_str)
      local expected = 4 * 60 * 60
      assert.are.equals(expected, actual)
   end)

   it('Parse days to seconds', function()
      local duration_str = '4d'
      local actual = parser.parse_duration(duration_str)
      local expected = 4 * 60 * 60 * 24
      assert.are.equals(expected, actual)
   end)

   it('Parse with trailing and following spaces', function()
      local duration_str = ' 4s  '
      local actual = parser.parse_duration(duration_str)
      local expected = 4
      assert.are.equals(expected, actual)
   end)

   it('Parse invalid date str to nil', function()
      local duration_str = '7e'
      local actual = parser.parse_duration(duration_str)
      local expected = nil
      assert.are.equals(expected, actual)
   end)

   it('Parse invalid date str to nil', function()
      local duration_str = 'bmwbo'
      local actual = parser.parse_duration(duration_str)
      local expected = nil
      assert.are.equals(expected, actual)
   end)

   it('Parse duration with no suffix to seconds', function()
      local duration_str = '68'
      local actual = parser.parse_duration(duration_str)
      local expected = 68
      assert.are.equals(expected, actual)
   end)

end)
