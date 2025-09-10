return {
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    config = function()
      require("copilot").setup({})
    end,
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      require("CopilotChat").setup({})
    end,
  },
}
