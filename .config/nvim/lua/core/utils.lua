local M = {}

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

function M.format_code()
    vim.lsp.buf.format({ async = true })
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
