vim.cmd.highlight('clear')
vim.g.colors_name = "darkshade"

if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

-- hi
local function hi(group, hl)
  vim.api.nvim_set_hl(0, group, hl)
end

-- pallet
local fg =  "#E0E2EA"
local bg = "#000000"
local alt_bg = "#151515"
local green = "#B4F6C0"
local red = "#984936"
local gray = "#9B9EA4"

-- Groups
hi("Defualt", { fg = fg })
hi("Gray", { fg = gray })
hi("Green", { fg = green })
hi("Red", { fg = red })

hi("Normal", {fg=fg, bg=bg})
-- UI
hi("Added", { link = "Defualt" })
hi("Changed", { link = "Defualt" })
hi("Conceal", { link = "Defualt" })
hi("CurSearch", { bg = red, fg = "#ffffff" })
hi("CursorColumn", { bg = alt_bg })
hi("CursorLine", { bg = alt_bg })
hi("DiffAdd", { link = "Green" })
hi("DiffChange", { link = "Green" })
hi("DiffDelete", { link = "Red" })
hi("DiffText", { link = "Defualt" })
hi("Directory", { fg = fg, bold = true })
hi("ErrorMsg", { link = "Red" })
hi("FloatShadow", { bg = bg })
hi("FloatShadowThrough", { bg = bg })
hi("Folded", { link = "Defualt" })
hi("LineNr", { link = "Gray" })
hi("MatchParen", { bg = gray, fg = bg })
hi("ModeMsg", { link = "Defualt" })
hi("MoreMsg", { link = "Defualt" })
hi("NonText", { link = "Gray" })
hi("NormalFloat", { bg = alt_bg })
hi("Pmenu", { bg = alt_bg })
hi("PmenuSel", { bg = gray , fg = bg })
hi("PmenuThumb", { bg = bg })
hi("Question", { link = "Defualt" })
hi("QuickFixLine", { link = "Defualt" })
hi("RedrawDebugClear", { bg = bg })
hi("RedrawDebugComposed", { bg = bg })
hi("RedrawDebugRecompose", { bg = bg })
hi("Removed", { link = "Defualt" })
hi("Search", { bg = red })
hi("SignColumn", { link = "Defualt" })
hi("SpecialKey", { link = "Defualt" })
hi("SpellBad", { sp = fg })
hi("SpellCap", { sp = fg })
hi("SpellLocal", { sp = fg })
hi("SpellRare", { sp = fg })
hi("StatusLine", { link = "Defualt" })
hi("StatusLineNC", { link = "Defualt" })
hi("Title", { link = "Defualt" })
hi("Visual", { bg = gray, fg = bg })
hi("WarningMsg", { link = "Defualt" })
hi("WinBar", { link = "Defualt" })
hi("WinBarNC", { link = "Defualt" })
hi("WinSeparator", { link = "Gray" })

-- Syntax
hi("Constant", { link = "Defualt" })
hi("Operator", { link = "Defualt" })
hi("PreProc", { link = "Defualt" })
hi("Type", { link = "Defualt" })
hi("Delimiter", { link = "Defualt" })

hi("Comment", { link = "Gray" })
hi("String", { link = "Green" })
hi("Identifier", { link = "Defualt" })
hi("Function", { link = "Defualt" })
hi("Statement", { fg = fg , bold = true })
hi("Special", { link = "Defualt" })
hi("Error", { link = "Red" })
hi("Todo", { fg = red, bold = true })
hi("YankHighlight", { bg = red, fg = fg })

-- Diagnostic
hi("DiagnosticError", { link = "Defualt" })
hi("DiagnosticWarn", { link = "Defualt" })
hi("DiagnosticInfo", { link = "Defualt" })
hi("DiagnosticHint", { link = "Defualt" })
hi("DiagnosticOk", { link = "Defualt" })
hi("DiagnosticUnderlineError", { sp = fg })
hi("DiagnosticUnderlineWarn", { sp = fg })
hi("DiagnosticUnderlineInfo", { sp = fg })
hi("DiagnosticUnderlineHint", { sp = fg })
hi("DiagnosticUnderlineOk", { sp = fg })
hi("DiagnosticDeprecated", { sp = fg })
