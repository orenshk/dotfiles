ZSH_THEME_GIT_PROMPT_PREFIX="git:(%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[blue]%}) %{$fg[yellow]%}✗%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[blue]%})"

# Notify of change in mode (command vs insert)
VIMODE="%{$fg_bold[red]%}➢"
function zle-line-init zle-keymap-select zle-line-finish {
    case $KEYMAP in
        vicmd)
            VIMODE="%{$fg_bold[blue]%}➢"
            VIMODETITLE=" -- command --"
            ;;
        *)
            VIMODE="%{$fg_bold[red]%}➢"
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

PROMPT='%{$fg_bold[blue]%}(%{$fg_bold[green]%}%p%{$fg[cyan]%}%c%{$fg_bold[blue]%}) \
%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}% %{$reset_color%} \
${BATTERY} ${VIMODE} %{$reset_color%}'
