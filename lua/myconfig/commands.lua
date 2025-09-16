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
local function insert_codeforces_boilerplate()
  local lines = {
    "#include <cstdio>",
    "#include <iostream>",
    "using namespace std;",
    "",
    "void setIO() {",
    "    ios::sync_with_stdio(0);",
    "    cin.tie(0);",
    "    cout.tie(0);",
    "}",
    "",
    "int main() {",
    "    setIO();",
    "",
    "#ifndef ONLINE_JUDGE",
    "    freopen(\"input.txt\", \"r\", stdin);",
    "    freopen(\"output.txt\", \"w\", stdout);",
    "#endif",
    "",
    "    int T;",
    "    cin >> T;",
    "    while (T--) {",
    "        // Solve each test case",
    "    }",
    "",
    "    return 0;",
    "}",
  }
  local row = vim.api.nvim_win_get_cursor(0)[1]
  vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, lines)
end

vim.api.nvim_create_user_command(
  'Codeforces',
  insert_codeforces_boilerplate,
  { desc = 'Insert Codeforces boilerplate' }
)
local function insert_split_function()
  local lines = {
    "vector<string> split(const string& s, const string& delimiter) {",
    "    vector<string> tokens;",
    "    size_t start = 0;",
    "    size_t end = s.find(delimiter);",
    "",
    "    while (end != string::npos) {",
    "        tokens.push_back(s.substr(start, end - start));",
    "        start = end + delimiter.length();",
    "        end = s.find(delimiter, start);",
    "    }",
    "    tokens.push_back(s.substr(start)); // last token",
    "    return tokens;",
    "}",
    "",
  }
  local row = vim.api.nvim_win_get_cursor(0)[1]
  vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, lines)
end

vim.api.nvim_create_user_command(
  'Split',
  insert_split_function,
  { desc = 'Insert C++ split function' }
)
