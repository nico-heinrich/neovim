-- Color palette
local colors = {
    bg = '#304b4f',
    bg_highlight = '#3d5d65',
    bg_highlight2 = '#4a6d75',
    bg_popup = '#294145',
    bg_popup_highlight = '#304f54',
    search = '#4d7681',
    fg = '#8fe7f0',
    fg_light = '#63acb7',
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
    syntax_a = '#94b1ea',
    syntax_b = '#2ff0b9',
    syntax_c = '#f9f586',
    syntax_d = '#faa09b',
    syntax_e = '#ff695d',
    syntax_f = '#706aff',
}

-- Clear existing highlights and reset syntax
vim.cmd('highlight clear')
vim.cmd('syntax reset')

-- General UI elements
vim.cmd('highlight Normal guifg=' .. colors.fg .. ' guibg=' .. colors.bg) -- Normal text
vim.cmd('highlight NonText guifg=' .. colors.bg .. ' guibg=' .. colors.bg) -- Non-text
vim.cmd('highlight Directory guifg=' .. colors.fg) -- Directory
vim.cmd('highlight NormalFloat guifg=' .. colors.fg .. ' guibg=' .. colors.bg_popup) -- Floating windows
vim.cmd('highlight Pmenu guifg=' .. colors.fg .. ' guibg=' .. colors.bg_popup) -- Popup menu
vim.cmd('highlight PmenuSbar guifg=' .. colors.fg .. ' guibg=' .. colors.bg_popup_highlight) -- Popup menu scrollbar
vim.cmd('highlight PmenuSel guifg=' .. colors.fg .. ' guibg=' .. colors.bg_popup_highlight) -- Selected item in popup menu
vim.cmd('highlight LineNr guifg=' .. colors.fg_light .. ' guibg=' .. colors.bg) -- Line number
vim.cmd('highlight CursorLineNr guifg=' .. colors.fg .. ' guibg=' .. colors.bg) -- Cursor line number
vim.cmd('highlight StatusLine guifg=' .. colors.bg .. ' guibg=' .. colors.fg) -- Status line
vim.cmd('highlight SignColumn guifg=' .. colors.fg .. ' guibg=' .. colors.bg) -- Sign column
vim.cmd('highlight Search guifg=' .. colors.fg .. ' guibg=' .. colors.search) -- Search
vim.cmd('highlight Cursor guifg=' .. colors.bg .. ' guibg=' .. colors.fg) -- Cursor
vim.cmd('highlight CursorColumn guifg=' .. colors.bg .. ' guibg=' .. colors.fg) -- Cursor column
vim.cmd('highlight CursorLine guibg=' .. colors.bg_highlight) -- Cursor line
vim.cmd('highlight Visual guibg=' .. colors.bg_highlight) -- Visual selection
vim.cmd('highlight MatchParen guifg=' .. colors.fg .. ' guibg=' .. colors.bg_highlight2) -- Matching parentheses

-- Syntax highlighting
vim.cmd('highlight Constant guifg=' .. colors.syntax_a) -- Constant
vim.cmd('highlight Tag guifg=' .. colors.syntax_a) -- Tag
vim.cmd('highlight String guifg=' .. colors.syntax_b) -- String
vim.cmd('highlight Identifier gui=None guifg=' .. colors.syntax_c) -- Identifier
vim.cmd('highlight @tag.attribute guifg=' .. colors.syntax_c) -- Tag attribute
vim.cmd('highlight Statement gui=None guifg=' .. colors.syntax_d) -- Statement
vim.cmd('highlight Type gui=None guifg=' .. colors.syntax_e) -- Type
vim.cmd('highlight @tag.delimiter guifg=' .. colors.fg) -- Tag delimiter
vim.cmd('highlight Special guifg=' .. colors.fg) -- Special
vim.cmd('highlight Operator guifg=' .. colors.fg) -- Operator
vim.cmd('highlight Comment guifg=' .. colors.fg_light) -- Comment
vim.cmd('highlight Ignore guifg=' .. colors.bg) -- Ignore
vim.cmd('highlight Todo guifg=' .. colors.warn) -- Todo

-- Diagnostics
vim.cmd('highlight DiagnosticError guifg=' .. colors.error .. ' guibg=' .. colors.error_bg) -- Error
vim.cmd('highlight DiagnosticSignError guifg=' .. colors.error) -- Error sign
vim.cmd('highlight DiagnosticWarn guifg=' .. colors.warn .. ' guibg=' .. colors.warn_bg) -- Warning
vim.cmd('highlight DiagnosticSignWarn guifg=' .. colors.warn) -- Warning sign
vim.cmd('highlight DiagnosticInfo guifg=' .. colors.info .. ' guibg=' .. colors.info_bg) -- Info
vim.cmd('highlight DiagnosticSignInfo guifg=' .. colors.info) -- Info sign
vim.cmd('highlight DiagnosticHint guifg=' .. colors.hint .. ' guibg=' .. colors.hint_bg) -- Hint
vim.cmd('highlight DiagnosticSignHint guifg=' .. colors.hint) -- Hint sign
vim.cmd('highlight DiagnosticOk guifg=' .. colors.ok .. ' guibg=' .. colors.ok_bg) -- Ok
vim.cmd('highlight DiagnosticSignOk guifg=' .. colors.ok) -- Ok sign

-- Plugin specific
vim.cmd('highlight CopilotSuggestion guifg=' .. colors.fg_light) -- Copilot suggestion
vim.cmd('highlight TelescopeSelection guibg=' .. colors.bg_highlight) -- Telescope selection
