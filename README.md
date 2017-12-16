# dotfiles

You know what they do.

# Notes to self

## keybindings.dconf

Contains GNOME keybindings dumped with:

    dconf dump /org/gnome/desktop/wm/keybindings/ > keybindings.dconf

Load them with:
    dconf load /org/gnome/desktop/wm/keybindings/ < keybindings.dconf
