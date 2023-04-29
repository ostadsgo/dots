local colorscheme = "tokyonight"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end

-- gruvbox colorscheme config
if colorscheme == "gruvbox" then
    vim.o.background = "dark"
    require("gruvbox").setup({
    palette_overrides = {
        dark0 = "#1d2021",
    }
})
end

-- for background transparency which is not work right now!!
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

