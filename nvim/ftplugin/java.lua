local root_markers = { 'gradlew', '.git' }
local root_dir = require('jdtls.setup').find_root(root_markers)
local home = os.getenv('HOME')
local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
local config = {
  cmd = { '/Users/sooryakiranponnath/Code/jdt-language-server/bin/jdtls', '-data', workspace_folder },
}
require('jdtls').start_or_attach(config)
