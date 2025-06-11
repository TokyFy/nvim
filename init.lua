-- ************************************************************************** --
--                                                                            --
--                                                        :::      ::::::::   --
--   init.lua                                           :+:      :+:    :+:   --
--                                                    +:+ +:+         +:+     --
--   By: franaivo <franaivo@student.42antananarivo  +#+  +:+       +#+        --
--                                                +#+#+#+#+#+   +#+           --
--   Created: 2025/06/11 14:41:39 by franaivo          #+#    #+#             --
--   Updated: 2025/06/11 14:41:57 by franaivo         ###   ########.fr       --
--                                                                            --
-- ************************************************************************** --

require 'core.options'
require 'core.keymaps'

local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end

local rtp = vim.opt.rtp
rtp:prepend(lazypath)

require('lazy').setup({
    require 'plugins.neotree',
    require 'plugins.theme',
    require 'plugins.lspconfigs',
    require 'plugins.telescope' ,
    {
        "goolord/alpha-nvim",
        -- dependencies = { 'echasnovski/mini.icons' },
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
          local startify = require("alpha.themes.startify")
          -- available: devicons, mini, default is mini
          -- if provider not loaded and enabled is true, it will try to use another provider
          startify.file_icons.provider = "devicons"
          require("alpha").setup(
            startify.config
          )
        end,
    },
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
        -- use opts = {} for passing setup options
        -- this is equivalent to setup({}) function
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        ---@module "ibl"
        ---@type ibl.config
        opts = {},
    },
    {
        "Diogo-ss/42-header.nvim",
        cmd = { "Stdheader" },
        keys = { "<F1>" },
        opts = {
            default_map = true, -- Default mapping <F1> in normal mode.
            auto_update = true, -- Update header when saving.
            user = "franaivo", -- Your user.
            mail = "franaivo@student.42antananarivo.mg", -- Your mail.
            -- add other options.
        },
        config = function(_, opts)
            require("42header").setup(opts)
        end,
}
})

