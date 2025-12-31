return {
  {
    "Pocco81/auto-save.nvim",
    event = "VeryLazy",
    opts = {
      debounce_delay = 500,
      trigger_events = {
        immediate_save = { "FocusLost" },
        defer_save = { "InsertLeave" },
      },
      execution_message = {
        enabled = false,
      },
    },
  },
}
