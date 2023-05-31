return {
  -- Autocompletion
  'hrsh7th/nvim-cmp',
  dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  event = "InsertEnter",
  config = function()
    local cmp = require 'cmp'
    local ls = require 'luasnip'
    local snip = ls.snippet
    local text = ls.text_node
    local insert = ls.insert_node
    local func = ls.function_node

    local date = function() return { os.date('%Y-%m-%d') } end

    ls.add_snippets(nil, {
      all = {
        snip({
          trig = "date",
          namr = "Date",
          dscr = "Date in the form of YYYY-MM-DD",
        }, {
          func(date, {}),
        }),
        snip({
          trig = "b",
          namr = "Bullet",
          dscr = "Bullet point",
        }, {
          text("• "),
          insert(1),
        }),
        snip({
          trig = "ch",
          namr = "Checkmark",
          dscr = "Checkmark",
        }, {
          text("✓ "),
          insert(1),
        }),
        -- heart
        snip({
          trig = "hrt",
          namr = "Heart",
          dscr = "Heart",
        }, {
          text("♥ "),
          insert(1),
        }),
      },
    })
    cmp.setup {
      snippet = {
        expand = function(args)
          ls.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert {
        ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ['<C-Space>'] = cmp.mapping.complete {},
        ['<C-y>'] = cmp.mapping.confirm {
          behavior = cmp.ConfirmBehavior.Replace,
          select = true,
        },
      },
      sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
      },
    }
  end
}
