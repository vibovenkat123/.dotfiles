require('neorg').setup {
  load = {
    ["core.defaults"] = {},
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          work = "~/work/notes",
          personal = "~/personal/notes",
        }
      },
      ["core.norg.concealer"] = {},
    }
  }
}
