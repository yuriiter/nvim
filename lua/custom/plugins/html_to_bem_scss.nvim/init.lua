local M = {}

local function get_indent(level)
  local expandtab = vim.bo.expandtab
  local shiftwidth = vim.bo.shiftwidth
  local tabstop = vim.bo.tabstop
  local indent_size = shiftwidth > 0 and shiftwidth or tabstop
  local indent_unit = expandtab and string.rep(' ', indent_size) or '\t'
  return string.rep(indent_unit, level)
end

local function parse_class_string(class_string)
  local classes = {}
  -- Remove quotes and normalize whitespace
  local cleaned = class_string:gsub('["\']', ''):gsub('%s+', ' '):match '^%s*(.-)%s*$'

  -- Split by whitespace and filter valid BEM classes
  for class in cleaned:gmatch '%S+' do
    if #class > 0 and not class:find '[{}$:]' then
      table.insert(classes, class)
    end
  end
  return classes
end

local function extract_from_text(text_lines)
  local extracted = {}
  local full_text = table.concat(text_lines, '\n')

  -- Patterns for class and className attributes
  local patterns = {
    'class%s*=%s*["\']([^"\']*)["\']',
    'className%s*=%s*["\']([^"\']*)["\']',
    'class%s*=%s*{[^}]*["\']([^"\']*)["\'][^}]*}', -- JSX expressions
    'className%s*=%s*{[^}]*["\']([^"\']*)["\'][^}]*}',
  }

  for _, pattern in ipairs(patterns) do
    for class_value in full_text:gmatch(pattern) do
      local classes = parse_class_string(class_value)
      for _, class in ipairs(classes) do
        table.insert(extracted, class)
      end
    end
  end

  -- Remove duplicates
  local unique = {}
  local seen = {}
  for _, class in ipairs(extracted) do
    if not seen[class] then
      seen[class] = true
      table.insert(unique, class)
    end
  end

  return unique
end

local function class_to_bem_components(class)
  -- Match patterns in order from most specific to least specific.

  -- 1. Handle element with modifier: block__element--modifier
  local block, element, modifier = class:match '^([^_]+)__([^-]+)%-%-(.+)$'
  if block and element and modifier then
    return { block = block, element = element, modifier = modifier, type = 'element-modifier' }
  end

  -- 2. Handle block with modifier: block--modifier
  block, modifier = class:match '^([^_]+)%-%-(.+)$'
  if block and modifier then
    return { block = block, modifier = modifier, type = 'block-modifier' }
  end

  -- 3. Handle element: block__element
  block, element = class:match '^([^_]+)__(.+)$'
  if block and element then
    return { block = block, element = element, type = 'element' }
  end

  -- 4. Plain block (if it doesn't contain BEM separators)
  if not class:find '__' and not class:find '%-%-' then
    return { block = class, type = 'block' }
  end

  -- Fallback for non-BEM classes or unhandled cases
  return { type = 'unknown', original = class }
end

local function group_by_block(classes)
  local groups = {}
  for _, class_str in ipairs(classes) do
    local components = class_to_bem_components(class_str)
    if components.block then
      if not groups[components.block] then
        groups[components.block] = {}
      end
      table.insert(groups[components.block], components)
    end
  end
  return groups
end

local function generate_scss_for_block(block, classes)
  local elements = {}
  local block_mods = {}
  local element_mods = {}

  -- Collect all components
  for _, data in ipairs(classes) do
    if data.type == 'element' then
      elements[data.element] = true
    elseif data.type == 'block-modifier' then
      block_mods[data.modifier] = true
    elseif data.type == 'element-modifier' then
      elements[data.element] = true
      if not element_mods[data.element] then
        element_mods[data.element] = {}
      end
      element_mods[data.element][data.modifier] = true
    end
  end

  local indent1 = get_indent(1)
  local indent2 = get_indent(2)
  local output = { string.format('.%s {', block) }

  -- Add block modifiers
  local sorted_block_mods = {}
  for m in pairs(block_mods) do
    table.insert(sorted_block_mods, m)
  end
  table.sort(sorted_block_mods)

  for _, mod in ipairs(sorted_block_mods) do
    table.insert(output, string.format('%s&--%s {', indent1, mod))
    table.insert(output, string.format('%s}', indent1))
  end

  -- Add elements
  local sorted_elements = {}
  for e in pairs(elements) do
    table.insert(sorted_elements, e)
  end
  table.sort(sorted_elements)

  for _, elem in ipairs(sorted_elements) do
    table.insert(output, string.format('%s&__%s {', indent1, elem))

    -- Add element modifiers
    if element_mods[elem] then
      local sorted_elem_mods = {}
      for m in pairs(element_mods[elem]) do
        table.insert(sorted_elem_mods, m)
      end
      table.sort(sorted_elem_mods)

      for _, mod in ipairs(sorted_elem_mods) do
        table.insert(output, string.format('%s&--%s {', indent2, mod))
        table.insert(output, string.format('%s}', indent2))
      end
    end

    table.insert(output, string.format('%s}', indent1))
  end

  table.insert(output, '}')
  return table.concat(output, '\n')
end

M.copy_bem_scss = function(start_line, end_line)
  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
  local classes = extract_from_text(lines)

  if #classes == 0 then
    print 'No BEM classes found.'
    return
  end

  local groups = group_by_block(classes)
  local output = { '/* Generated BEM SCSS */' }

  -- Sort blocks alphabetically
  local sorted_blocks = {}
  for b in pairs(groups) do
    table.insert(sorted_blocks, b)
  end
  table.sort(sorted_blocks)

  for _, block in ipairs(sorted_blocks) do
    table.insert(output, generate_scss_for_block(block, groups[block]))
  end

  local scss_output = table.concat(output, '\n\n')
  vim.fn.setreg('+', scss_output)
  vim.fn.setreg('"', vim.fn.getreg '+')

  print(string.format('BEM SCSS copied to clipboard! (%d classes found)', #classes))
end

M.setup = function()
  vim.api.nvim_create_user_command('BemScssCopy', function(args)
    M.copy_bem_scss(args.line1, args.line2)
  end, { desc = 'Extract BEM SCSS from selection or buffer', range = '%' })
end

-- Auto-setup
if not M._setup_called then
  M.setup()
  M._setup_called = true
end

return M
