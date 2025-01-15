local persist_file = vim.fn.stdpath 'cache' .. '/persist_bg.lua'

-- Load the persisted background setting
local function load_background()
  local f = io.open(persist_file, 'r')
  if f then
    local bg = f:read '*l'
    f:close()
    if bg == 'light' or bg == 'dark' then
      vim.o.background = bg
    end
  end
end

-- Toggle background and persist it
local function toggle_background()
  print 'toggle...'
  vim.o.background = (vim.o.background == 'dark') and 'light' or 'dark'

  -- Persist the new setting
  local f = io.open(persist_file, 'w')
  if f then
    f:write(vim.o.background)
    f:close()
  end

  print('Background set to: ' .. vim.o.background)
end

load_background()

return {
  toggle_background = toggle_background,
}
