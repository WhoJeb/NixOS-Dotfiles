{ lib, ... }:

{
  programs.nvf = {
    enable = true;

    settings = {
      vim = {
        globals.mapleader = " ";
        options.tabstop = 2;
        options.shiftwidth = 2;
        options.autoindent = true;

        diagnostics = {
          enable = true;
          config = {
            virtual_lines = true;
            signs.text = lib.generators.mkLuaInline ''
              {
                [vim.diagnostic.severity.ERROR] = " ",
                [vim.diagnostic.severity.WARN] = " ",
              }
            '';
          };
        };

        # Startify Dashboard
        dashboard.startify = {
          enable = true;
          #  bookmarks = {
          #     c = "~/.vimrc";
          #  };

          lists = [
            # {
            #   header = [ "MRU" ];
            #   type = "files";
            # }
            {
              header = [ "MRU Current Directory" ];
              type = "dir";
            }
            {
              header = [ "Sessions" ];
              type = "sessions";
            }
            {
              header = [ "Bookmarks" ];
              type = "bookmarks";
            }
            {
              header = [ "Commands" ];
              type = "commands";
            }
          ];
        };

        # Undotree
        utility.undotree.enable = true;

        # Fancy status line
        statusline.lualine.enable = true;

        # Lsp Stuff
        telescope.enable = true;

        # Autocomplete
        autocomplete.nvim-cmp.enable = true;

        # File Browser
        filetree.neo-tree.enable = true;

        # Leetcode
        utility.leetcode-nvim.enable = true;
        utility.leetcode-nvim.setupOpts.lang = "cpp"; # Availible opts [“cpp”, “java”, “python”, “python3”, “c”, “csharp”, “javascript”, “typescript”, “php”, “swift”, “kotlin”, “dart”, “golang”, “ruby”, “scala”, “rust”, “racket”, “erlang”, “elixir”, “bash”]

        # Neotree
        filetree.neo-tree.setupOpts = {
          enable_cursor_hijack = true;
          enable_git_status = true;
          git_status_async = true;
          enable_modified_markers = true;
          enable_opened_markers = true;
          enable_refresh_on_write = true;
        };

        # Whitespace highlighting
        # mini.trailspace.enable = true;

        # Vim Keybind Alterations
        keymaps = [
          # Remap normal neovim explore
          {
            mode = "n";
            key = "<leader>pv";
            action = ":Texplore toggle<CR>"; # the <CR> tag stands for 'Carriage Return' and is what runs the command that was written out
            # options = {
            #   noremap = true;
            #   silent = true;
            # };
          }

          # Map open new tab
          {
            mode = "n";
            key = "<leader>to";
            action = ":tabnew<CR>"; # the <CR> tag stands for 'Carriage Return' and is what runs the command that was written out
          }

          # Map close tab
          {
            mode = "n";
            key = "<leader>tc";
            action = ":tabclose<CR>"; # the <CR> tag stands for 'Carriage Return' and is what runs the command that was written out
          }

          # Map close all except current tab
          {
            mode = "n";
            key = "<leader>tC";
            action = ":.tabonly<CR>"; # the <CR> tag stands for 'Carriage Return' and is what runs the command that was written out
          }

          # Map go to next tab
          {
            mode = "n";
            key = "<leader>tn";
            action = ":+tabnext<CR>"; # the <CR> tag stands for 'Carriage Return' and is what runs the command that was written out
          }

          # Map go to prev tab
          {
            mode = "n";
            key = "<leader>tb";
            action = ":-tabnext<CR>"; # the <CR> tag stands for 'Carriage Return' and is what runs the command that was written out
          }

          # Map go to first tab
          {
            mode = "n";
            key = "<leader>tf";
            action = ":tabfirst<CR>"; # the <CR> tag stands for 'Carriage Return' and is what runs the command that was written out
          }

          # Map go to last tab
          {
            mode = "n";
            key = "<leader>tl";
            action = ":tablast<CR>"; # the <CR> tag stands for 'Carriage Return' and is what runs the command that was written out
          }

          # Map move tab right
          {
            mode = "n";
            key = "<leader>tN";
            action = ":+tabmove<CR>"; # the <CR> tag stands for 'Carriage Return' and is what runs the command that was written out
          }

          # Map move tab left
          {
            mode = "n";
            key = "<leader>tB";
            action = ":-tabmove<CR>"; # the <CR> tag stands for 'Carriage Return' and is what runs the command that was written out
          }

          # Remap Neo-Tree
          {
            mode = "n";
            key = "<C-n>";
            action = ":Neotree toggle<CR>"; # the <CR> tag stands for 'Carriage Return' and is what runs the command that was written out
          }

          # Remap Neorg TOC
          {
            mode = "n";
            key = "<localleader>o";
            action = ":Neorg toc<CR>"; # the <CR> tag stands for 'Carriage Return' and is what runs the command that was written out
          }

          # Remap Neorg TOC qflist
          {
            mode = "n";
            key = "<localleader>q";
            action = ":Neorg toc qflist<CR>"; # the <CR> tag stands for 'Carriage Return' and is what runs the command that was written out
          }

          # Better Paste
          # {
          #   mode = "x";
          #   key = "<leader>p";
          #   action = "'\'_dP"; # the <CR> tag stands for 'Carriage Return' and is what runs the command that was written out
          # }

          # Remap Undo-Tree
          {
            mode = "n";
            key = "<C-u>";
            action = ":UndotreeToggle<CR>"; # the <CR> tag stands for 'Carriage Return' and is what runs the command that was written out
          }

          # Go To Definition
          {
            mode = "n";
            key = "gd";
            action = ":tab split | lua vim.lsp.buf.definition()<CR>"; # the <CR> tag stands for 'Carriage Return' and is what runs the command that was written out
          }

          # Man Page
          # {
          #   mode = "n";
          #   key = "<C-h>";
          #   action = ":WhichKey<CR>"; # the <CR> tag stands for 'Carriage Return' and is what runs the command that was written out
          # }
        ];

        # ui.noice.enable = true; # Cmdline n stuff (Whether to enable noice.nvim UI modification library)
        ui.borders = {
          enable = true;
          # globalStyle = "";
          plugins.lspsaga.enable = true;
          plugins.nvim-cmp.enable = true;
          plugins.which-key.enable = true;
          plugins.lsp-signature.enable = true;
        };

        snippets.luasnip.enable = true;

        theme = {
          enable = true;
          name = "catppuccin";
          style = "mocha";
          transparent = true;
        };

        statusline.lualine.theme = "pywal";
      };

      vim.terminal.toggleterm = {
        enable = true;
        lazygit.enable = true;
      };

      vim.lsp = {
        enable = true;
        lspsaga.enable = true; # Fancy lsp menu
        lspkind.enable = true; # Icons in lsp menu
        null-ls.enable = true;
        inlayHints.enable = true;
        lspSignature.enable = true;
        formatOnSave = false;

        nvim-docs-view = {
          enable = true; # Whether to enable nvim-docs-view, for displaying lsp hover documentation in a side panel
          mappings = {
            viewToggle = "<leader>lvt"; # Open or close the docs view panel
            viewUpdate = "<leader>lvu"; # Manually update the docs view panel
          };
        };

        otter-nvim = {
          enable = true; # Whether to enable lsp features and a code completion source for code embedded in other documents [otter-nvim]
          mappings.toggle = "<leader>lo";
        };

        trouble = {
          enable = false; # Whether to enable trouble diagnostics viewer
          mappings = {
            workspaceDiagnostics = "<leader>lwd"; # Workspace diagnostics [trouble]
            documentDiagnostics = "<leader>ld"; # Document diagnostics [trouble]
            lspReferences = "<leader>lr"; # LSP References [trouble]
            quickfix = "<leader>xq"; # QuickFix [trouble]
            symbols = "<leader>xs"; # Symbols [trouble]
            locList = "<leader>xl"; # LOCList [trouble]
          };
        };

        mappings = {
          hover = "<leader>lh";
          format = "<leader>lf";
          codeAction = "<leader>la";

          goToType = "<leader>lgt";
          goToDefinition = "<leader>lgd";
          goToDeclaration = "<leader>lgD";

          listReferences = "<leader>lgr";
          listImplementations = "<leader>lgi";

          listWorkspaceFolders = "<leader>lwl";
          addWorkspaceFolder = "<leader>lwa";
          removeWorkspaceFolder = "<leader>lwr";

          signatureHelp = "<leader>ls"; # Honestly idk what this does

          openDiagnosticFloat = "<leader>le"; # explains current error or warning
        };
      };

      vim.treesitter.textobjects.enable = true; # text object related vim motions
      vim.languages = {
        enableDAP = true;
        enableTreesitter = true;

        nix.enable = true;
        nix.lsp.enable = true;

        rust.enable = true;

        python.enable = true;
        python.lsp.enable = true;

        assembly.enable = true;

        bash.enable = true;
        bash.lsp.enable = true;

        css.enable = true;
        html.enable = true;

        markdown.enable = true;
        markdown.lsp.enable = true;

        clang.enable = true;
        clang.cHeader = true;
        clang.dap.enable = true;
        clang.lsp.server = "ccls";
        clang.lsp.enable = true;
        clang.treesitter.enable = true;

        lua.enable = true;
        lua.lsp.enable = true;

        yaml.enable = true;
        yaml.lsp.enable = true;

        csharp.enable = true;
        csharp.lsp.enable = true;

        go.enable = true;
        go.lsp.enable = true;

        zig.enable = true;
        zig.lsp.enable = true;

        ruby.enable = true;
        ruby.lsp.enable = true;

        java.enable = true;
        java.lsp.enable = true;

        # php.enable = true;
        # r.enable = true;
        # sql.enable = true;

        ts.enable = true;
        ts.lsp.enable = true;
      };

      vim.debugger.nvim-dap = {
        enable = true;
        ui.enable = true;
      };

      vim.binds = {
        cheatsheet.enable = true;
        whichKey.enable = true;
        # Vim keybinds changed in flake.lock
      };

      vim.notes.neorg = {
        enable = true;
        setupOpts = {
          load."core.defaults".enable = true;
          load."core.tangle".enable = true;
          load."core.concealer" = {
            enable = true;
            config = {
              icon_preset = "diamond";
            };
          };

          load."core.dirman" = {
            enable = true;
            config = {
              workspaces = {
                notes = "~/Documents/notes";
                # life = "~/Documents/notes/Life";
              };
              default_workspace = "notes";
            };
          };

          load."core.summary" = {
            enable = true;
            config = {
              strategy = "by_path";
            };
          };

          load."core.completion" = {
            enable = true;
            config = {
              engine = "nvim-cmp";
            };
          };
          # load."core.keybinds".enable = true;
          # load."core.promo".enable = true;
          load."core.ui.calendar".enable = true;
          load."core.latex.renderer".enable = true;
          load."core.integrations.image".enable = true;
        };
        treesitter = {
          enable = true;
        };
      };

      vim.utility.images.image-nvim = {
        enable = true;
        setupOpts = {
          backend = "kitty";
          integrations = {
            markdown = {
              enable = true;
              clearInInsertMode = true;
              downloadRemoteImages = true;
            };

            neorg = {
              enable = true;
              clearInInsertMode = true;
              downloadRemoteImages = true;
              filetypes = [
                "neorg"
                "norg"
              ];
            };
          };
        };
      };
    };
  };
}
