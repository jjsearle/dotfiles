require('luasnip.session.snippet_collection').clear_snippets 'all'

local luasnip = require 'luasnip'
local s = luasnip.snippet
local t = luasnip.text_node

-- Function to return the current date
local function date()
  return os.date '%Y-%m-%d'
end

luasnip.add_snippets('all', {
  s('hi', {
    t 'hello, world',
  }),
  s('date', {
    f(date, {}),
  }),
  s('name', {
    t 'Joe Searle',
  }),
  s('email1', {
    t 'joe@dmcip.com',
  }),
  s('email2', {
    t 'joe@jsearle.net',
  }),
})
