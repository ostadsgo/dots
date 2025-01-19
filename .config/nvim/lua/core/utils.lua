local M = {}

-- run code
function M.run_code()
  local file = vim.api.nvim_buf_get_name(0)
  if file:match("%.py$") then
    vim.cmd("!python3 " .. file)
  elseif file:match("%.lua$") then
    vim.cmd("!lua " .. file)
  elseif file:match("%.go$") then
    vim.cmd("!go run " .. file)
  elseif file:match("%.c$") then
    vim.cmd("!cc " .. file .. " && ./a.out")
  else
    print("Couldn't run the" .. file .. "file")
  end
end

-- format code with lsp
function M.format_code()
  vim.lsp.buf.format({ async = true })
end

function M.go_to_buffer(n)
  local buffers = vim.api.nvim_list_bufs()
  local active_buffers = {}

  for _, buf in ipairs(buffers) do
    if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_name(buf) ~= "" then
      table.insert(active_buffers, buf)
    end
  end
  if n > 0 and n <= #active_buffers then
    vim.api.nvim_set_current_buf(active_buffers[n])
  else
    return nil
  end
end

-- highlight on copy
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = "*",
})

return M
