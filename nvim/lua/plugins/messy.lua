return {
  -- Colorscheme
  --{ "tanvirtin/monokai.nvim",
  --  lazy=false, priority=9001,
  --  config = function() require("monokai").setup {} end
  --},
  { "fenetikm/falcon",
      lazy=false, priority=9001,
      config = function() vim.cmd([[colorscheme falcon]]) end,
  },

  -- R
  { "jalvesaq/Nvim-R",
      dependencies = {"chrisbra/csv.vim"},
      config = function()
        vim.g["R_auto_start"] = 1
        vim.g["R_objbr_auto_start"] = 1
        vim.g["R_rconsole_width"] = 0
        vim.g["r_syntax_folding"] = 1
        vim.g["Rout_more_colors"] = 1
        vim.g["rout_follow_colorscheme"] = 1
      end,
  },
}
