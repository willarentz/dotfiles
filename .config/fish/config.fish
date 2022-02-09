## fish plugin manager
# TODO

##################################### general
## basic command alias
#alias make 'make --no-print-directory'
alias mv 'mv -i'
alias diff 'colordiff'
alias l 'exa -alh'
alias ... 'cd ../..'
alias aws1 'ssh -i ~/.ssh/orbify.pem ubuntu@ec2-18-193-122-253.eu-central-1.compute.amazonaws.com'
alias aws1proxy 'ssh -D 9999 -i ~/.ssh/orbify.pem ubuntu@ec2-18-193-122-253.eu-central-1.compute.amazonaws.com'
alias aws2 'ssh -i ~/.ssh/orbify.pem ubuntu@ec2-18-156-199-223.eu-central-1.compute.amazonaws.com'
alias aws2proxy 'ssh -D 9999 -i ~/.ssh/orbify.pem ubuntu@ec2-18-156-199-223.eu-central-1.compute.amazonaws.com'


set -x PATH $HOME/bin $PATH

## Encoding
set -x LANG en_US.UTF-8
set -x LC_CTYPE en_US.UTF-8

## XDG Base Directory
set -x XDG_DATA_HOME $HOME/.local/share
set -x XDG_CACHE_HOME $HOME/.cache
set -x XDG_CONFIG_HOME $HOME/.config

## Prompt
set -x PROMPT_ICON "(*'-')"
set -x PROMPT_ERROR_ICON "(*;_;)"
set -x PROMPT_ENABLE_K8S_CONTEXT 0
set -x PROMPT_ENABLE_K8S_NAMESPACE 0
set -x PROMPT_ENABLE_GCLOUD_PROJECT 1
set -x PROMPT_SHOW_ERR_STATUS 1

## vim
alias vi nvim
set -x EDITOR nvim

## alternative grep
alias rg "rg --hidden --glob '!.git' -i"

## fzf
set -x FZF_DEFAULT_COMMAND 'rg --files --hidden --glob "!.git/*" -i'
set -x FZF_DEFAULT_OPTS '--height 60% --reverse --border --layout=reverse --inline-info'

## takashabe/fish-fzf
set -x FZF_CD_IGNORE_CASE '.git|vendor/|node_modules'
set -x FZF_CD_MAX_DEPTH 5

# curl
alias curl-ios 'curl -A "Mozilla/5.0 (iPhone; CPU iPhone OS 10_3 like Mac OS X) AppleWebKit/602.1.50 (KHTML, like Gecko) CriOS/56.0.2924.75 Mobile/14E5239e Safari/602.1"'
function curl-xml-ios
  if test (count $argv) -lt 1
    echo 'require: url'
    return 128
  end
  curl-ios $argv[1] | xmllint --format -
end

# less
set -x LESS '-R'
#set -x LESSOPEN '| /usr/local/bin/src-hilite-lesspipe.sh %s'

## tmux
#if status --is-interactive
#  if test -z $TMUX
#    if tmux has-session > /dev/null ^ /dev/null
#      # aattach tmux session with percol like tool
#      set -l sid (tmux list-sessions | grep '' | fzf | cut -d: -f1)
#      command tmux -u attach-session -t $sid
#    else
#      command tmux -u new-session
#    end
#  end
#end

# z
set -x Z_DATA $HOME/.z

function reload_tmux
  tmux source-file ~/.tmux.conf
  echo "reload tmux"
end

### history
function history-merge --on-event fish_preexec
  history --save
  history --merge
end

function wrap_fzf_history
  history-merge
  fzf_history
end

function wrap_fzf_file
  fzf_file --preview "bat --style=numbers --color=always --line-range :500 {}"
end

### Key binding
function fish_user_key_bindings
  #  bind \c] fzf_ghq
  #bind \cr wrap_fzf_history
  #bind \cu fzf_z
  #bind \co wrap_fzf_file
  #bind \cg fzf_cd
  bind \cg fzf
  bind "[1;2F" kill-line
end

# direnv
direnv hook fish | source

#### general function
function reload_config
  exec fish
end
function edit_config
  $EDITOR ~/.dotfiles/.config/fish/config.fish
end

## osx system functionsA
function msleep
  osascript -e 'tell application "Finder" to sleep'
end

## Login message
# emtpy
set fish_greeting

# Load local env, functions and so on.
source $HOME/.config/fish/conf.d/local.fish

# tab completion very slow...  may be fix next-release. (3.1.3?)
# https://github.com/fish-shell/fish-shell/issues/7511
if status --is-interactive; and test (uname) = "Darwin"
  function __fish_describe_command; end
end

#set hombrew paths
#set -U fish_user_paths "$HOME/.config/fish/functions" $fish_user_paths
if status --is-interactive; and test (uname) = "Darwin"
  #set -U fish_user_paths "$HOME/.config/fish/completions" $fish_user_paths
  set -U fish_user_paths "/opt/homebrew/bin" $fish_user_paths
  set -U fish_user_paths "/opt/homebrew/sbin" $fish_user_paths
  set -U fish_user_paths "/opt/homebrew/Caskroom/miniforge/base/bin" $fish_user_paths
  set -U fish_user_paths "/opt/homebrew/Caskroom/miniforge/base/condabin" $fish_user_paths


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
  eval /opt/homebrew/Caskroom/miniforge/base/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<
end
