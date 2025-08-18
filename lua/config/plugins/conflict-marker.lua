return {
  "rhysd/conflict-marker.vim",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    -- Enable conflict marker highlighting
    vim.g.conflict_marker_enable_highlight = 1
    
    -- Enable automatic jump to conflict markers
    vim.g.conflict_marker_enable_mappings = 1
    
    -- Set highlight colors
    vim.g.conflict_marker_highlight_group_ours = "DiffAdd"
    vim.g.conflict_marker_highlight_group_theirs = "DiffDelete"
    vim.g.conflict_marker_highlight_group_base = "DiffChange"
    
    -- Enable automatic jump to next/previous conflict
    vim.g.conflict_marker_enable_mappings = 1
  end,
}
