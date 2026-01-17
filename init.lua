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
	require 'plugins.lspconfigs',
	require 'plugins.telescope',
	require 'plugins.nvimcmp',
	require 'plugins.alpha',
	require 'plugins.autopairs',
	require 'plugins.blankline',
	require 'plugins.ft-header',
	require 'plugins.theme',
    {
        "jackplus-xyz/binary.nvim",
        opts = {
          style = "system",
          colors = {
            fg = "#E1C7E5",
            bg = "#0A0A0A",
          },
          -- Customize the reversed groups
          reversed_group = {
            Title = true,  -- Add a new reversed group
            Search = false, -- Disable a default reversed group
          },
        },
    }
})
