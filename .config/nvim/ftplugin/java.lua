local config = {
  cmd = { '/usr/share/java/jdtls/bin/jdtls' },
  root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw', 'run' }, { upward = true })[1]),
  settings = {
    java = {
      project = {
        referencedLibraries = {
          '/opt/processing-4.3.4/core/library/core.jar',
        },
      }
    }
  }
}

require('jdtls').start_or_attach(config)


vim.keymap.set('n', '<leader>r', '<cmd>!../run<cr>')
