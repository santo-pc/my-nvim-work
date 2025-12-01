local M = {}

-- Core logic: buffer > global > default(true)
function M.should_format(bufnr)
  local b = vim.b[bufnr].autoformat
  local g = vim.g.autoformat

  -- buffer has absolute priority
  if b == false then
    return false
  end
  if b == true then
    return true
  end

  -- buffer = nil → global decides
  if g == false then
    return false
  end

  -- default yes if global == nil or true
  return true
end

-- Optional helper for your statusline
function M.status()
  local b = vim.b.autoformat
  local g = vim.g.autoformat

  if b ~= nil then
    return b and 'AF:on' or 'AF:off'
  end

  if g ~= nil then
    return g and 'AF:on' or 'AF:off'
  end

  return 'AF:on' -- default
end

return M
