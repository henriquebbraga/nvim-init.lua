return {
  settings = {

    Lua = {
      diagnostics = {
        globals = { "vim", 'hs' },
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
          ["/Users/henriquebraga/.hammerspoon/Spoons/EmmyLua.spoon/annotations"] = true
        },
      },
    },
  },
}
