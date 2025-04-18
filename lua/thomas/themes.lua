local M = {}

local function get_highlight(group)
  local ok, hl = pcall(vim.api.nvim_get_hl, 0, { name = group })
  return ok and hl or nil
end

local theme = {

  c = {
    ["@include"] = { fg = "#C586C0" },
    ["@type"] = { fg = "#4EC9B0" },
    ["@macro"] = { fg = "#569CD6" },
    ["@type.builtin"] = { fg = "#356dd4" },
    ["@class"] = { fg = "#3540d4" },
    ["@function"] = { fg = "#DCDCAA" },
    ["@function.call"] = { fg = "#DCDCAA" },
    ["@function.builtin"] = { fg = "#DCDCAA" },
    ["@constant"] = { fg = "#9CDCFE" },
    ["@constant.macro"] = { fg = "#f5d271" },
    ["@keyword"] = { fg = "#C586C0" },
    ["@keyword.return"] = { fg = "#C586C0" },
    ["@keyword.conditional"] = { fg = "#C586C0" },
    ["@keyword.modifier"] = { fg = "#356dd4" },
    ["@keyword.operator"] = { fg = "#C586C0" },
    ["PreProc"] = { fg = "#C586C0" },
    ["@string"] = { fg = "#CE9178" },
    ["@comment"] = { fg = "#6A9955", italic = true },
    ["@variable"] = { fg = "#9CDCFE" },
    ["@variable.parameter"] = { fg = "#7a7f87" },
    ["@local.variable"] = { fg = "#569CD6" },
    ["@property"] = { fg = "#c9cfd1" },
    ["@operator"] = { fg = "#D4D4D4" },
    ["@punctuation.delimiter"] = { fg = "#7a7f87" },
    ["@punctuation.bracket"] = { fg = "#7a7f87" },
    ["@_parent"] = { fg = "#7a7f87" },
    ["@number"] = { fg = "#B5CEA8" },
  },
  cpp = {
    ["@include"] = { fg = "#C586C0" },
    ["@type"] = { fg = "#4EC9B0" },
    ["@macro"] = { fg = "#569CD6" },
    ["@type.builtin"] = { fg = "#356dd4" },
    ["@class"] = { fg = "#3540d4" },
    ["@function"] = { fg = "#DCDCAA" },
    ["@function.call"] = { fg = "#DCDCAA" },
    ["@function.builtin"] = { fg = "#DCDCAA" },
    ["@constant"] = { fg = "#9CDCFE" },
    ["@constant.macro"] = { fg = "#f5d271" },
    ["@keyword"] = { fg = "#C586C0" },
    ["@keyword.return"] = { fg = "#C586C0" },
    ["@keyword.conditional"] = { fg = "#C586C0" },
    ["@keyword.modifier"] = { fg = "#356dd4" },
    ["@keyword.operator"] = { fg = "#C586C0" },
    ["PreProc"] = { fg = "#C586C0" },
    ["@string"] = { fg = "#CE9178" },
    ["@comment"] = { fg = "#6A9955", italic = true },
    ["@variable"] = { fg = "#9CDCFE" },
    ["@variable.parameter"] = { fg = "#7a7f87" },
    ["@local.variable"] = { fg = "#569CD6" },
    ["@property"] = { fg = "#c9cfd1" },
    ["@operator"] = { fg = "#D4D4D4" },
    ["@punctuation.delimiter"] = { fg = "#7a7f87" },
    ["@punctuation.bracket"] = { fg = "#7a7f87" },
    ["@_parent"] = { fg = "#7a7f87" },
    ["@number"] = { fg = "#B5CEA8" },
  },
  py = {
    ["@function"] = { fg = "#8E7DBE" },                -- lavender for def functions
    ["@variable"] = { fg = "#A6D6D6" },                -- aqua for variables
    ["@string"]   = { fg = "#F7CFD8" },                -- pink for strings
    ["@keyword"]  = { fg = "#8E7DBE" },                -- lavender for `def`, `if`, `return`, etc.
    ["@comment"]  = { fg = "#F4F8D3", italic = true }, -- cream comments
    ["@type"]     = { fg = "#A6D6D6" },                -- aqua for classes or type hints
    ["@constant"] = { fg = "#F7CFD8" },                -- pink for ALL_CAPS constants
    ["@operator"] = { fg = "#8E7DBE" },                -- lavender for `+`, `=`, etc.
  },
  lua = {
    ["@function"] = get_highlight("Function"),
    ["@variable"] = get_highlight("Identifier"),
    ["@string"] = get_highlight("String"),
    ["@keyword"] = get_highlight("Keyword"),
    ["@comment"] = vim.tbl_extend("force", get_highlight("Comment") or {}, { italic = true }),
    ["@type"] = get_highlight("Type"),
    ["@constant"] = get_highlight("Constant"),
    ["@operator"] = get_highlight("Operator"),
    ["@punctuation"] = get_highlight("Delimiter"),
  },
}

function M.apply(lang)
  local groups = theme[lang]
  if groups then
    for group, opts in pairs(groups) do
      vim.api.nvim_set_hl(0, group, opts)
    end
  end
end

return M
