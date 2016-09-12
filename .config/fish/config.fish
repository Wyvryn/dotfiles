alias twd='cd ~/TexturaWD/textura'
alias rwd='cd ~/checkouts/csvus/reportage'
alias sb='cd ~/scripts; and fab switch_branch'
alias sr='cd ~/scripts; and fab switch_reports'
alias co='cd ~/scripts; and fab checkout'
alias fdiff='cd ~/scripts; and fab diff'
alias curr_prod='cd ~/checkouts/current_prod'
alias clrrml='rm /var/lib/textura/docs/rml/*'
alias grep='ag'
alias tmux='tmux -2'
alias vim='nvim'
set -x EDITOR 'nvim'
set -x VIRTUAL_ENV_DISABLE_PROMPT 1

function fish_prompt
    /home/mike/.config/powerline-shell/powerline-shell.py $status --shell bare ^/dev/null
end


set fish_greeting '-_-_-_-_-_-_-_,------,
_-_-_-_-_-_-_-|   /\_/\
-_-_-_-_-_-_-~|__( ^ .^ )
              ""  "" '
set -x VIRTUALFISH_HOME ~/virtualenvs
eval (python -m virtualfish)
set -g -x TEXTURA_APPDIR /home/mike/TexturaWD
set -g -x PAGER most
alias pgcli='env PAGER=vimpgclipager pgcli'
