return {
  {
    "folke/sidekick.nvim",
    config = function()
      require("sidekick").setup()
      vim.lsp.enable("copilot-language-server")  -- manually enable built-in LSP so Sidekick integrates
    end,
  },
}
