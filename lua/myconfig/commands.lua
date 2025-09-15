local function insert_doxygen_boilerplate()
  local lines = {
    "/**",
    " * @brief Brief description.",
    " *",
    " * @param param1 Description of param1.",
    " * @param param2 Description of param2.",
    " * @return Description of return value.",
    " */",
  }
  local row = vim.api.nvim_win_get_cursor(0)[1]
  vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, lines)
end

vim.api.nvim_create_user_command(
  'Doxygen',
  insert_doxygen_boilerplate,
  { desc = 'Insert Doxygen boilerplate' }
)
