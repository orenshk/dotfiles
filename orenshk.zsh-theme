# my theme by Oren Shklarsky
#
# Colours chosen with solarized dark in mind
# Yoinked cool git symbols from gozilla
# Yoinked prompt ideas from Fino.


ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%})[%{$fg[yellow]%}⊗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%}"
ZSH_THEME_GIT_PROMPT_ADDED="%{$fg[cyan]%} ✈"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$fg[yellow]%} ✭"
ZSH_THEME_GIT_PROMPT_DELETED="%{$fg[red]%} ✗"
ZSH_THEME_GIT_PROMPT_RENAMED="%{$fg[blue]%} ➦"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$fg[magenta]%} ✂"
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[cyan]%} ✱"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[blue]%}]%{$reset_color%}"

# Notify of change in mode (command vs insert)
VIMODE="%{$fg[red]%}─○"
function zle-line-init zle-keymap-select zle-line-finish {
    case $KEYMAP in
        vicmd)
            VIMODE="%{$fg[blue]%}─○"
            VIMODETITLE=" -- command --"
            ;;
        *)
            VIMODE="%{$fg[red]%}─○"
            VIMODETITLE="       -- insert --"
            ;;
    esac
    echo -ne "\e]1;$PWD $VIMODETITLE\a"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

function precmd() {
    BATTERY=`battery_pct_prompt 2>&1`
}

PROMPT='╭─%{$fg_bold[blue]%}(%{$fg_bold[green]%}%p%{$fg[cyan]%}%~%{$fg_bold[blue]%}) \
%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}% %{$reset_color%} \
${BATTERY}%{$reset_color%}
╰${VIMODE} '

RPS1='$(git_prompt_status)'
