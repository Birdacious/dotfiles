return {
  -- ### Colorscheme ###
  { "fenetikm/falcon",
    lazy=false, priority=9001,
    config = function()
      vim.g["falcon_background"] = 0 -- Reqs falcon tmux conf too
      vim.g["falcon_inactive"] = 1 -- Reqs falcon tmux conf too
      vim.cmd([[colorscheme falcon]])
      vim.cmd([[set termguicolors]])
     end,
  },
  --{ "tanvirtin/monokai.nvim",
  --  lazy=false, priority=9001,
  --  config = function() require("monokai").setup {} end
  --},
  --{ "aktersnurra/no-clown-fiesta.nvim",
  --  config = function() vim.cmd([[colorscheme no-clown-fiesta]]) end
  --},
  --FAILED
  --{ "altercation/vim-colors-solarized",
  --  lazy=false, priority=9001,
  --  config = function()
  --    vim.g["solarized_termcolors"] = 256
  --    --vim.cmd([[set termguicolors]])
  --    vim.cmd([[syntax enable]])
  --    vim.cmd([[set background=light]])
  --    vim.cmd([[colorscheme solarized]])
  --  end
  --},
  --{ "shaunsingh/solarized.nvim",
  --  lazy=false, priority=9001,
  --  config = function() require('solarized').set() end
  --},
  --{ "ayu-theme/ayu-vim",
  --  lazy=false, priority=9001,
  --  config = function()
  --    vim.cmd([[set termguicolors]])
  --    vim.g["ayucolor"]="light"
  --    vim.cmd([[colorscheme ayu]])
  --  end
  --},
  --{ "nordtheme/vim",
  --  lazy=false, priority=9001,
  --  config = function() vim.cmd([[colorscheme nord]]) end
  --},

  -- ### Actually useful stuff ###
  { "lbrayner/vim-rzip" },
  { "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    build = function() require("nvim-treesitter.install").update { with_sync = true } end,
    config = function() require("nvim-treesitter.configs").setup {
      highlight={enable=true},
      ensure_installed = {"markdown","markdown_inline","r","rnoweb"}
    } end
  },
  { "R-nvim/R.nvim",
    lazy=false,
    config = function()
      require("r").setup({
        auto_start = "on_startup",
        objbr_auto_start = true,
        hl_term = false,
        --Rout_more_colors = true,
        --rout_follow_colorscheme = true,
        rconsole_width = 0,
        buffer_opts = "winfixwidth nobuflisted",
        rmdchunk = 0,
        csv_app = "tmux new-window vd",
        clear_line = true,
        rmd_fenced_languages = {"r", "python"},
        markdown_fenced_languages = {"r", "python"},
        R_filetypes = {"r", "rmd", "rrst", "rnoweb", "quarto", "rhelp", "qmd"},
        hook = { on_filetype = function()
          vim.api.nvim_buf_set_keymap(0, "n", "<LocalLeader>h",
            "<Cmd>lua require('r.run').action('head')<CR>",
          {})
          --vim.api.nvim_buf_set_keymap(0, "n", "<LocalLeader>rv",
          --  "<Cmd>lua require('r.run').action('(function(df) { cat(cbind(names(df),t(df)), sep=c(rep(\\\'\\\\t\\\',ncol(df)-1),\\\'\\\\n\\\'), file=\\\"|vd\\\")) })')<CR>",
          --{})
        end }
      })
      -- maybe replace w/ quarto_render_args and quarto_preview_args and rmarkdown_args? See https://github.com/R-nvim/R.nvim/blob/35e17323568afe3d42ed571960244e230549b697/doc/R.nvim.txt#L1368
      vim.cmd([[nmap <silent> <LocalLeader>pr :call g:SendCmdToR('params <- lapply(knitr::knit_params(readLines("' . expand("%") . '")), function(x) x$value); class(params) <- "knit_param_list"')<CR>]]) -- For knitr params on press <LL>pr. See https://github.com/jalvesaq/Nvim-R/issues/425
      vim.cmd([[nmap <silent> <LocalLeader>qg :call g:SendCmdToR('quarto::quarto_serve("' . expand("%") . '", browse=function(url) utils::browseURL(url,browser="firefox"))')<CR>]])
    end
  },
  { "R-nvim/cmp-r",
    config = function()
      local cmp = require("cmp")
      cmp.setup({
        enabled = function() return vim.g.cmptoggle end,
        sources = {{ name = "cmp_r" }},
        mapping = cmp.mapping.preset.insert({
	        ['<CR>'] = cmp.mapping.confirm({ select = false }),
	        ['<Tab>'] = cmp.mapping(function(fallback) -- During auto-completion, press <Tab> to select the next item.
	          if cmp.visible() then cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
	          else fallback() end
	        end, { 'i', 's' }),
	        ['<S-Tab>'] = cmp.mapping(function(fallback)
	          if cmp.visible() then cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
	          else fallback() end
	        end, { 'i', 's' })
	      })
      })
      vim.keymap.set("n", "<LocalLeader>tc", "<cmd>lua vim.g.cmptoggle = not vim.g.cmptoggle<CR>", { desc = "toggle nvim-cmp" }) -- github.com/hrsh7th/nvim-cmp/issues/261
      require("cmp_r").setup({})
    end
  },
  { "hrsh7th/nvim-cmp",
    config = function()
      require("cmp").setup({ sources = {{ name = "cmp_r" }}})
      require("cmp_r").setup({})
    end,
  },



  -- ### OLD ###
  --{ "jalvesaq/Nvim-R",
  --    dependencies = {"chrisbra/csv.vim"},
  --    config = function()
  --      vim.g["R_path"] = '/usr/local/bin/'
  --      vim.g["R_assign"] = 0
  --      vim.g["R_rmdchunk"] = 0
  --      vim.g["R_auto_start"] = 1
  --      vim.g["R_objbr_auto_start"] = 1
  --      vim.g["R_rconsole_width"] = 0
  --      vim.g["r_syntax_folding"] = 1
  --      vim.g["Rout_more_colors"] = 1
  --      vim.g["rout_follow_colorscheme"] = 1
  --      vim.g["R_filetypes"] = {"r", "rmd", "rrst", "rnoweb", "quarto", "rhelp", "qmd"}
  --      vim.g["markdown_fenced_languages"] = {"r", "python"}
  --      vim.g["rmd_fenced_languages"] = {"r", "python"}
  --      vim.cmd([[nmap <silent> <LocalLeader>pr :call g:SendCmdToR('params <- lapply(knitr::knit_params(readLines("' . expand("%") . '")), function(x) x$value); class(params) <- "knit_param_list"')<CR>]]) -- For knitr params on press <LL>pr. See https://github.com/jalvesaq/Nvim-R/issues/425
  --      vim.cmd([[nmap <silent> <LocalLeader>qg :call g:SendCmdToR('quarto::quarto_serve("' . expand("%") . '", browse=function(url) utils::browseURL(url,browser="firefox"))')<CR>]]) -- For knitr params on press <LL>pr. See https://github.com/jalvesaq/Nvim-R/issues/425
  --    end,
  --},
}
