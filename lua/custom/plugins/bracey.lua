return {
  'lethc/bracey.vim',
  -- load only when you’re editing web files or call a Bracey cmd
  ft = { 'html', 'css', 'javascript', 'typescript' },
  cmd = { 'Bracey', 'BraceyStop', 'BraceyReload', 'BraceyEval' },
  -- pulls the Node deps Bracey needs
  build = 'npm install --prefix server',
  init = function()
    -- optional, but handy defaults
    vim.g.bracey_auto_start_browser = 1 -- open browser on :Bracey
    vim.g.bracey_refresh_on_save = 1 -- reload page on save
    -- vim.g.bracey_eval_on_save = 1      -- eval JS buffer on save (default)
    -- vim.g.bracey_server_port = 0       -- let Bracey choose a port
  end,
  keys = {
    { '<leader>bo', ':Bracey<CR>', desc = 'Bracey: start / open' },
    { '<leader>bx', ':BraceyStop<CR>', desc = 'Bracey: stop' },
    { '<leader>br', ':BraceyReload<CR>', desc = 'Bracey: reload page' },
  },
}
