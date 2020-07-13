#!/bin/bash

get () {
  local option=$1
  local default_value=$2
  local option_value="$(tmux show-option -gqv "$option")"

  if [ -z "$option_value" ]; then
    echo "$default_value"
  else
    echo "$option_value"
  fi
}

set () {
  local option=$1
  local value=$2
  tmux set-option -gq "$option" "$value"
}

setw () {
  local option=$1
  local value=$2
  tmux set-window-option -gq "$option" "$value"
}

base_fg=$(get '@theme_base_fg' '#abb2bf')
base_bg=$(get '@theme_base_bg' '#282c34')
primary_fg=$(get '@theme_primary_fg' '#282c34')
primary_bg=$(get '@theme_primary_bg' '#98c379')
secondary_fg=$(get '@theme_secondary_fg' '#abb2bf')
secondary_bg=$(get '@theme_secondary_bg' '#3e4452')

set 'status' 'on'
set 'status-justify' 'left'
set 'status-left' "#[fg=$primary_fg,bg=$primary_bg] #S #[fg=$primary_bg,bg=$base_bg]"
set 'status-left-length' '100'
set 'status-right' "#[fg=$secondary_bg,bg=$base_bg]#[fg=$secondary_fg,bg=$secondary_bg] %Y-%m-%d %H:%M #[fg=$primary_bg,bg=$secondary_bg]#[fg=$primary_fg,bg=$primary_bg] #h "
set 'status-right-length' '100'
set 'status-style' "fg=$base_fg,bg=$base_bg"

set 'window-status-current-format' "#[fg=$base_bg,bg=$secondary_bg]#[fg=$secondary_fg,bg=$secondary_bg] #I  #W #[fg=$secondary_bg,bg=$base_bg]"
set 'window-status-format' "#[fg=$base_bg,bg=$base_bg]#[fg=$base_fg,bg=$base_bg] #I  #W #[fg=$base_bg,bg=$base_bg]"

setw 'window-status-separator' ''
