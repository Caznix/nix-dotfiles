{ pkgs,... }:
{
programs.vscode = {
    enable = true;
    enableUpdateCheck = false;
    enableExtensionUpdateCheck = false;
    mutableExtensionsDir = false;
    extensions = (with pkgs.vscode-extensions; [
            rust-lang.rust-analyzer
            svelte.svelte-vscode
            bradlc.vscode-tailwindcss
            ms-vsliveshare.vsliveshare
            ms-vscode.cmake-tools
            ms-python.python
            bierner.markdown-preview-github-styles
            bierner.markdown-checkbox
            bierner.markdown-emoji
            bierner.markdown-footnotes
            bierner.markdown-mermaid
            denoland.vscode-deno
            geequlim.godot-tools
            gruntfuggly.todo-tree
            mhutchie.git-graph
            fill-labs.dependi
            (pkgs.vscode-utils.buildVscodeMarketplaceExtension {
                mktplcRef = {
                  name = "darcula-solid";
                  publisher = "jussiemion";
                  version = "1.2.1";
                  hash = "sha256-tIfCkOR1Z/uRWiZhrBfOQCZT3Cu6yNjAnxjn0UJFO2U=";
                };
            })
        ]);

    userSettings = {
            "editor.cursorSmoothCaretAnimation" = "on";
            "editor.smoothScrolling" = true;
            "editor.cursorBlinking" = "expand";
            "workbench.colorTheme" = "Darcula Solid";
        };
    };
}
