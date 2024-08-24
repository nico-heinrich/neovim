local colors = {
    bg = '#304b4f',
    bg_highlight = '#3d5d65', -- generated from cursor color & opacity
    bg_cursor = '#a8ff00', -- generated from cursor color & opacity
    bg_popup = '#294145', -- generated from bg & contrast
    bg_popup_highlight = '#304f54', -- generated from bg_popup & opacity
    fg = '#f4f8f8',
    fg_light = '#5f9ea8', -- generated from fg & opacity
    error = '#ff6384',
    error_bg = '#a00831',
    warn = '#f3b225',
    warn_bg = '#a08f00',
    info = '#00e4de',
    info_bg = '#008f8a',
    hint = '#b8ade4',
    hint_bg = '#5f4f8a',
    ok = '#00e676',
    ok_bg = '#008a3e',
    accent1 = '#94b1ea',
    accent2 = '#2ff0b9',
    accent3 = '#faa09b',
    accent4 = '#f9f586',
    search = '#00af28',
}

vim.cmd('highlight clear')
vim.cmd('syntax reset')

-- Set background and foreground
vim.cmd('highlight Normal guifg='..colors.fg..' guibg='..colors.bg) -- Normal text
vim.cmd('highlight NonText guifg='..colors.bg..' guibg='..colors.bg) -- Non-text
vim.cmd('highlight Directory guifg='..colors.fg) -- Directory
vim.cmd('highlight NormalFloat guifg='..colors.fg..' guibg='..colors.bg_popup) -- Floating windows
vim.cmd('highlight Pmenu guifg='..colors.fg..' guibg='..colors.bg_popup) -- Popup menu
vim.cmd('highlight PmenuSbar guifg='..colors.fg..' guibg='..colors.bg_popup) -- Popup menu scrollbar
vim.cmd('highlight PmenuSel guifg='..colors.fg..' guibg='..colors.bg_popup_highlight) -- Selected item in popup menu
vim.cmd('highlight LineNr guifg='..colors.fg_light..' guibg='..colors.bg) -- Line number
vim.cmd('highlight CursorLineNr guifg='..colors.fg..' guibg='..colors.bg) -- Cursor line number
vim.cmd('highlight StatusLine guifg='..colors.bg..' guibg='..colors.fg) -- Status line
vim.cmd('highlight SignColumn guifg='..colors.fg..' guibg='..colors.bg) -- Sign column
vim.cmd('highlight Search guifg='..colors.fg..' guibg='..colors.search) -- Search

-- Cursor & Selection
vim.cmd('highlight CursorLine guibg='..colors.bg_highlight) -- Cursor line
vim.cmd('highlight Visual guibg='..colors.bg_highlight) -- Visual selection

-- Highlight groups
vim.cmd('highlight Comment guifg='..colors.fg_light) -- Comment
vim.cmd('highlight Constant guifg='..colors.accent1) -- Constant
vim.cmd('highlight Identifier guifg='..colors.accent2) -- Identifier
vim.cmd('highlight Statement guifg='..colors.accent1) -- Statement
vim.cmd('highlight PreProc guifg='..colors.accent1) -- Preprocessor
vim.cmd('highlight Type guifg='..colors.accent2) -- Type
vim.cmd('highlight Special guifg='..colors.fg) -- Special
vim.cmd('highlight Underlined guifg='..colors.accent1) -- Underlined
vim.cmd('highlight String guifg='..colors.accent3) -- String
vim.cmd('highlight Number guifg='..colors.accent4) -- Number
vim.cmd('highlight Ignore guifg='..colors.bg) -- Ignore

-- Messages
vim.cmd('highlight DiagnosticError guifg='..colors.error..' guibg='..colors.error_bg) -- Error
vim.cmd('highlight DiagnosticSignError guifg='..colors.error) -- Error sign
vim.cmd('highlight DiagnosticWarn guifg='..colors.warn..' guibg='..colors.warn_bg) -- Warning
vim.cmd('highlight DiagnosticSignWarn guifg='..colors.warn) -- Warning sign
vim.cmd('highlight DiagnosticInfo guifg='..colors.info..' guibg='..colors.info_bg) -- Info
vim.cmd('highlight DiagnosticSignInfo guifg='..colors.info) -- Info sign
vim.cmd('highlight DiagnosticHint guifg='..colors.hint..' guibg='..colors.hint_bg) -- Hint
vim.cmd('highlight DiagnosticSignHint guifg='..colors.hint) -- Hint sign
vim.cmd('highlight DiagnosticOk guifg='..colors.ok..' guibg='..colors.ok_bg) -- Ok
vim.cmd('highlight DiagnosticSignOk guifg='..colors.ok) -- Ok sign

-- Copilot
vim.cmd('highlight CopilotSuggestion guifg='..colors.fg_light) -- Copilot suggestion
