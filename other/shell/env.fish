# locales {{{1

set -gx LANG en_US.UTF-8
set -gx LC_COLLATE $LANG
set -gx LC_CTYPE $LANG
set -gx LC_MESSAGES $LANG
set -gx LC_MONETARY $LANG
set -gx LC_NUMERIC $LANG
set -gx LC_TIME $LANG
set -gx LC_ALL $LANG


# custom {{{1

set -gx INTERNAL_DISPLAY eDP-1
set -gx EXTERNAL_DISPLAY HDMI-1

# default programs {{{1

set -gx EDITOR nvim
set -gx editor $EDITOR
set -gx VISUAL $EDITOR
set -gx USE_EDITOR $EDITOR

set -gx PAGER nvimpager
set -gx MANPAGER $PAGER

set -gx TERMINAL "alacritty -e"
set -gx BROWSER google-chrome-stable

set -gx LOCKPRG swaylock-blur
set -gx EXITPRG "swaymsg exit"


# environment {{{1

set -gx XDG_CURRENT_DESKTOP sway
set -gx XDG_SESSION_TYPE wayland
set -gx TERM xterm-256color


# XDG {{{1

set -gx XDG_CONFIG_HOME $HOME/.config
set -gx XDG_CACHE_HOME $HOME/.cache
set -gx XDG_DATA_HOME $HOME/.local/share
set -gx XDG_STATE_HOME $HOME/.local/state

set -gx CARGO_HOME $XDG_DATA_HOME/cargo
set -gx RUSTUP_HOME $XDG_DATA_HOME/rustup
set -gx CCACHE_DIR $XDG_CACHE_HOME/ccache
set -gx PYLINTHOME $XDG_CACHE_HOME/pylint
set -gx AWS_SHARED_CREDENTIALS_FILE $XDG_CONFIG_HOME/aws/credentials
set -gx AWS_CONFIG_FILE $XDG_CONFIG_HOME/aws/config
set -gx DOCKER_CONFIG $XDG_CONFIG_HOME/docker
set -gx GTK2_RC_FILES $XDG_CONFIG_HOME/gtk-2.0/gtkrc
set -gx XINITRC $XDG_CONFIG_HOME/X11/xinitrc
set -gx XSERVERRC $XDG_CONFIG_HOME/X11/xserverrc
set -gx INPUTRC $XDG_CONFIG_HOME/readline/inputrc
set -gx TIGRC_USER $XDG_CONFIG_HOME/tig/tigrc
set -gx PSQL_HISTORY $XDG_CACHE_HOME/pg/psql_history
set -gx NPM_CONFIG_USERCONFIG $XDG_CONFIG_HOME/npm/npmrc
set -gx PYTHONUSERBASE $XDG_DATA_HOME/pip
set -gx GOPATH $XDG_DATA_HOME/go
set -gx GOBIN $GOPATH/bin


# path {{{1

set -gx PATH $PATH $PYTHONUSERBASE/bin
set -gx PATH $PATH $GOBIN
set -gx PATH $PATH $XDG_DATA_HOME/npm/bin
set -gx PATH $PATH $CARGO_HOME/bin

set -gx PATH $PATH /usr/bin/vendor_perl # mimeopen/mimetype etc

set -gx PATH $PATH /usr/lib/ccache/bin/


# config {{{1

set -gx GCC_COLORS "error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01"

set -gx TLDR_COLOR_BLANK white

# TODO: export RUSTC_WRAPPER=sccache
set -gx RUST_BACKTRACE 1

set -gx WINIT_HIDPI_FACTOR 1.0 # alacritty

set -gx PIPENV_VENV_IN_PROJECT 1

set -gx FZF_DEFAULT_OPTS "--height 40% --reverse --border"
set -gx FZF_FIND_FILE_COMMAND fd
source ~/config/other/shell/fzf-solarized.fish