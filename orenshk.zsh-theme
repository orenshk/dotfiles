# my theme by Oren Shklarsky
#
# Colours chosen with solarized dark in mind
# Yoinked cool git symbols from gozilla
# Yoinked prompt ideas from Fino.
# Return code from afowler, but slightly modified.

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

local return_code="%(?..%{$fg[red]%},↵%?%{$reset_color%})"
hostinfo="%{$fg_bold[cyan]%}%n%{$reset_color%}@%{$fg_bold[magenta]%}%m%{$reset_color%}"

# Notify of change in mode (command vs insert)
vimode_top="%{$fg[red]%}╭─"
vimode_bot="%{$fg[red]%}╰─○"
function zle-line-init zle-keymap-select zle-line-finish {
    case $KEYMAP in
        vicmd)
            vimode_top="%{$fg[blue]%}╭─"
            vimode_bot="%{$fg[blue]%}╰─○"
            vimode_title=" -- command --"
            ;;
        *)
            vimode_top="%{$fg[red]%}╭─"
            vimode_bot="%{$fg[red]%}╰─○"
            vimode_title="       -- insert --"
            ;;
    esac
    echo -ne "\e]1;$PWD $vimode_title\a"
    zle reset-prompt
}

zle -N zle-line-init
zle -N zle-keymap-select

function precmd() {
    BATTERY=`battery_pct_prompt 2>&1`
}

RPROMPT='$(git_prompt_status)${return_code} ${BATTERY}'

PROMPT='${vimode_top}%{$fg_bold[blue]%}(%{$fg_bold[green]%}%p%{$fg[cyan]%}%~%{$fg_bold[blue]%}) \
%{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%}% %{$reset_color%} \
(${hostinfo}) 
${vimode_bot}%{$reset_color%} '
