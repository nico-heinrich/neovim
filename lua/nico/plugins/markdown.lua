return {
    "iamcco/markdown-preview.nvim",
    config = function()
      vim.cmd[[cnoreabbrev mp MarkdownPreview]] -- :sft => :setfiletype
    end,
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
}
