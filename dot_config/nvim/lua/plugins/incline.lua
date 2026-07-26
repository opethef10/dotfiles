return {
    "b0o/incline.nvim",
    event = "BufReadPre",
    enabled = true,
    config = function()
      -- local colors = require("tokyonight.colors").setup()
      require("incline").setup({
        -- highlight = {
        --   groups = {
        --     InclineNormal = { guibg = "#FC56B1", guifg = colors.black },
        --     InclineNormalNC = { guifg = "#FC56B1", guibg = colors.black },
        --   },
        -- },
        window = { margin = { vertical = 0, horizontal = 1 } },
        ignore = {
          floating_wins = false,
          wintypes = function (winid, wintype)
            local zen = package.loaded['snacks'].zen
            if zen.win and not zen.win.closed then
              return winid ~= zen.win.win
            end
            return wintype ~= ''
          end
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":.")
          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  }
