# ------------------------------------------------------------------#
#          FILE: mbriggs.zsh-theme                                  #
#            BY: Matt Briggs (matt@mattbriggs.net)                  #
#      BASED ON: smt by Stephen Tudor (stephen@tudorstudio.com)     #
# ------------------------------------------------------------------#

SCM_THEME_PROMPT_DIRTY="${red}⚡${reset_color}"
SCM_THEME_PROMPT_AHEAD="${red}!${reset_color}"
SCM_THEME_PROMPT_CLEAN="${green}✓${reset_color}"
SCM_THEME_PROMPT_PREFIX=" "
SCM_THEME_PROMPT_SUFFIX=""
GIT_SHA_PREFIX=" ${yellow}"
GIT_SHA_SUFFIX="${reset_color}"

function git_short_sha() {
  SHA=$(git rev-parse --short HEAD 2> /dev/null) && echo "$GIT_SHA_PREFIX$SHA$GIT_SHA_SUFFIX"
}

function prompt() {
    local return_status=""
    local user_host="${green}\h${reset_color}"
    local current_path="${red}\w${reset_color}"
    local n_commands="\!"
    local git_branch="$(git_short_sha)$(scm_prompt_info)"
    local prompt_symbol=👽
    local open='('
    local close=')'
    local prompt_char='o-> '

    PS1="\n${user_host} ${prompt_symbol} ${open}${current_path}${git_branch}${close}${return_status}\n⏅ → "
}

safe_append_prompt_command prompt
