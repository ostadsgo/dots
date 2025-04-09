vim.cmd("hi clear")
if vim.fn.exists("syntax_on") == 1 then
  vim.cmd("syntax reset")
end

vim.g.colors_name = "darkland"
local none = "none"
local white = "#ebebeb"
local fg = "#c1c1c1"
local bg = "#040404"
local line = "#212121"
local status = "#393939"
local gray = "#696969"
local gray_blue = "#708090"
local primary = "#789978"
local red = "#b6927b"
local warn = "#ab8550"
local error = "#984936"
local hint = "#7788aa"

local theme = {
  -- Line Indicators
  CursorLine = { bg = line },
  CursorColumn = { link = "CursorLine" },
  ColorColumn = { link = "CursorLine" },
  StatusLine = { bg = status, fg=fg},
  StatusLineNC = { bg = status, fg=bg },
  CursorLineNr = { fg = fg, bold = true },

  -- Normal aka white
  Normal = { fg = fg, bg = bg },
  NormalNC = { link = "Normal" },
  MsgArea = { link = "Normal" },
  MsgSeparator = { link = "Normal" },
  ModeMsg = { link = "Normal" },
  NormalFloat = { link = "Normal" },

  -- Text
  Identifier = { fg = fg },
  Function = { link = "Identifier" },
  Conceal = { link = "Identifier" },
  Operator = { link = "Identifier" },
  NonText = { link = "Identifier" },
  MoreMsg = { link = "Identifier" },
  Title = { link = "Identifier" },
  Question = { link = "Identifier" },
  Variable = { link = "Identifier" },
  Typedef = { link = "Identifier" },
  Label = { link = "Identifier" },
  Macro = { link = "Identifier" },
  Delimiter = { link = "Identifier" },
  PreProc = { link = "Identifier" },

  -- Statement
  Keyword = { fg = primary },
  Statement = { link = "Keyword" },
  Type = { link = "Keyword" },
  Structure = { link = "Keyword" },
  StorageClass = { link = "Keyword" },
  Conditional = { link = "Keyword" },
  Repeat = { link = "Keyword" },
  Include = { link = "Keyword" },
  Tag = { link = "Keyword" },
  SpecialKey = { link = "Keyword" },
  Exception = { link = "Keyword" },

  -- Number
  Number = { fg = red },
  Define = { link = "Number" },
  Boolean = { link = "Number" },
  Float = { link = "Number" },
  Debug = { link = "Number" },
  Constant = { link = "Number" },

  -- Comment / Gray
  Special = { fg = gray },
  Comment = { fg = gray },
  SpecialComment = { link = "Special" },
  LineNr = { link = "Special" },
  Whitespace = { link = "Special" },
  EndOfBuffer = { link = "Special" },
  PreCondit = { link = "Special" },

  -- String
  String = { fg = gray_blue },
  Character = { link = "String" },
  SpecialChar = { link = "String" },
  Directory = { link = "String" },

  -- Search
  Search = { fg = bg, bg = warn },
  IncSearch = { link = "Search" },
  Substitute = { link = "Search" },

  -- Error
  ErrorMsg = { fg = error },
  WarningMsg = { link = "ErrorMsg" },
  SpellBad = { sp = red, undercurl = true },
  SpellCap = { sp = error, undercurl = true },
  Todo = { bg = fg, bg = error, bold = true },

  -- Visual
  Visual = { bg = gray_blue, fg=bg },
  Pmenu = { fg = fg, bg = line },
  PmenuSel = { fg = bg, bg = gray_blue },

  

  -- Python
  pythonOperator = { link = "Keyword" },
  pythonExceptions = { link = "Identifier" },
  pythonFunction = { fg = white },
  pythonBuiltin = { fg = white },

  -- Lua
  luaTable = { link = "Identifier" },
  luaFunction = { link = "Statement" },

  -- LSP
  FloatBorder = { fg = gray },
  DiagnosticInfo = { fg = fg },
  DiagnosticWarn = { fg = warn },
  DiagnosticHint = { fg = warn },
  DiagnosticUnnecessary = { fg = gray },
  DiagnosticFloatingError = { fg = error },

  -- MiniPickBorder xxx links to FloatBorder
  -- MiniPickBorderBusy xxx links to DiagnosticFloatingWarn
  -- MiniPickBorderText xxx links to FloatTitle
  -- MiniPickCursor xxx cleared
  -- MiniPickIconDirectory xxx links to Directory
  -- MiniPickIconFile xxx links to MiniPickNormal
  -- MiniPickNormal xxx links to NormalFloat
  -- MiniPickHeader xxx links to DiagnosticFDiagnosticInfo DiagnosticInfo loatingHint
  -- MiniPickMatchCurrent xxx links to CursorLine
  -- MiniPickMatchMarked xxx links to Visual
  -- MiniPickMatchRanges xxx links to DiagnosticFloatingHint
  -- MiniPickPreviewLine xxx links to CursorLine
  -- MiniPickPreviewRegion xxx links to IncSearch
  -- MiniPickPrompt xxx links to DiagnosticFloatingInfo

  -- Treesitter
  ["@variable"] = { link = "Identifier" },
  ["@variable.memeber"] = { link = "Identifier" },
  ["@property"] = { link = "Identifier" },
  ["@function.builtin"] = { link = "Identifier" },
  ["@punctuation.bracket"] = { link = "Special" },
  ["@punctuation.delimiter"] = { link = "Special" },
}

for group, hl in pairs(theme) do
  vim.api.nvim_set_hl(0, group, hl)
end
