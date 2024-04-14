# If this module depends on an external Tmux plugin, say so in a comment.
# E.g.: Requires https://github.com/aaronpowell/tmux-weather

show_git() { # This function name must match the module name!
  local index icon color text module

  index=$1 # This variable is used internally by the module loader in order to know the position of this module

  icon="$(  get_tmux_option "@catppuccin_git_name>_icon"  ""           )"
  color="$( get_tmux_option "@catppuccin_git_name>_color" "$thm_orange" )"
  text="$(  get_tmux_option "@catppuccin_git_name>_text"  "#(git rev-parse --git-dir > /dev/null 2>&1 && git branch --show-current || echo 'No Git')" )"

  module=$( build_status_module "$index" "$icon" "$color" "$text" )

  echo "$module"
}
