require('copilot').setup({
  suggestion = {
    enabled = true,
    auto_trigger = true,
    keymap = {
      accept = "<C-j>",
    },
  },
  server = {
    type = "binary"
  }
})
