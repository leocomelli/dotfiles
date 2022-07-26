# Path
fish_add_path /usr/local/opt/libpq/bin
fish_add_path /opt/homebrew/bin

# git prompt settings
set -g __fish_git_prompt_show_informative_status 1
set -g __fish_git_prompt_showdirtystate "yes"
set -g __fish_git_prompt_char_stateseparator " "
set -g __fish_git_prompt_char_dirtystate "✖"
set -g __fish_git_prompt_char_cleanstate "✔"
set -g __fish_git_prompt_char_untrackedfiles "…"
set -g __fish_git_prompt_char_stagedstate "●"
set -g __fish_git_prompt_char_conflictedstate "+"
set -g __fish_git_prompt_color_dirtystate yellow
set -g __fish_git_prompt_color_cleanstate green --bold
set -g __fish_git_prompt_color_invalidstate red
set -g __fish_git_prompt_color_branch cyan --dim --italics

if status --is-interactive
  set -g fish_user_abbreviations
  abbr -a vim nvim
  abbr -a tfw terraform workspace list
  abbr -a tg terragrunt
  abbr -a vlogin vault login
  abbr -a kp kubectl get pods
  abbr -a ke kubectl exec -ti
  abbr -a kl kubectl logs -f
end

alias b "git branch"
alias cat "bat -p"
alias unset "set --erase"
alias cdr "cd (git rev-parse --show-toplevel)"
alias po "git pull origin (git rev-parse --abbrev-ref HEAD)"
alias pr "gh pr view --web"
alias repo "gh repo view --web"
alias k kubectl
alias v vault
alias tf terraform
# don"t show any greetings
set fish_greeting ""

set -x GPG_TTY (tty)

# don"t describe the command for darwin
# https://github.com/fish-shell/fish-shell/issues/6270
function __fish_describe_command; end

# brew install jump, https://github.com/gsamokovarov/jump
status --is-interactive; and source (jump shell fish | psub)

# Senstive functions which are not pushed to Github
# It contains work related stuff, some functions, aliases etc...
if test -f ~/.config/fish/private.fish
  source ~/.config/fish/private.fish
end

# asdf configuration
source /opt/homebrew/opt/asdf/libexec/asdf.fish

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc' ]; . '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc'; end
