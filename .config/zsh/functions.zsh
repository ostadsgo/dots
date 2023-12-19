# Function to source files if they exist
function zsh_add_file() {
    [ -f "$ZDOTDIR/$1" ] && source "$ZDOTDIR/$1"
}

function zsh_add_plugin() {
    PLUGIN_NAME=$(echo $1 | cut -d "/" -f 2)
    if [[ -d "$ZDIR/plugins/$PLUGIN_NAME" ]]; then
        source "$ZDIR/plugins/$PLUGIN_NAME/$PLUGIN_NAME.plugin.zsh" || \
        source "$ZDIR/plugins/$PLUGIN_NAME/$PLUGIN_NAME.zsh"
    else
        echo "\nInstalling plugin $PLUGIN_NAME"
        git clone "https://github.com/$1.git" "$ZDIR/plugins/$PLUGIN_NAME"
    fi
}


