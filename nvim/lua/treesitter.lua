local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end


configs.setup {

highlight = {
    enable = true,
    disable = {""},
    additional_vim_regex_highlighting = true,
  },
  indent = {enable = true},
  autopairs = {
    enable = true,
  },
  rainbow = {
    enable = true,
  }

}
