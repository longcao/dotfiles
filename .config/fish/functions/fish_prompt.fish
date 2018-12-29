# Modified version of informative.fish
# See: https://github.com/fish-shell/fish-shell/blob/742fde0dd68858ad603b449501f0c42cd7864fab/share/tools/web_config/sample_prompts/informative.fish
function fish_prompt --description 'Write out the prompt'
    set stat $status

    if not set -q __fish_prompt_normal
        set -g __fish_prompt_normal (set_color normal)
    end

    if not set -q __fish_color_blue
        set -g __fish_color_blue (set_color -o blue)
    end

    function parse_git_dirty
        set -l git_status (git status 2> /dev/null | tail -n1 | cut -c 1-17)
        if test \( -n "$git_status" \) -a \( "$git_status" != "nothing to commit" \)
            echo "*"
        else
            echo ""
        end
    end

    function parse_git_branch
        git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1"(parse_git_dirty)"/"
    end

    # Set the color for the status depending on the value
    set __fish_color_status (set_color -o green)
    if test $stat -gt 0
        set __fish_color_status (set_color -o red)
    end

    switch "$USER"
        case root toor
            if not set -q __fish_prompt_cwd
                if set -q fish_color_cwd_root
                    set -g __fish_prompt_cwd (set_color $fish_color_cwd_root)
                else
                    set -g __fish_prompt_cwd (set_color $fish_color_cwd)
                end
            end

            printf '%s@%s %s%s%s# ' $USER (prompt_hostname) "$__fish_prompt_cwd" (prompt_pwd) "$__fish_prompt_normal"

        case '*'
            if not set -q __fish_prompt_cwd
                set -g __fish_prompt_cwd (set_color $fish_color_cwd)
            end

            printf '[%s] %s%s@%s %s%s %s[%s] %s%s \f\r> ' (date "+%H:%M:%S") "$__fish_color_blue" $USER (prompt_hostname) "$__fish_prompt_cwd" (prompt_pwd) "$__fish_color_status" "$stat" "$__fish_prompt_normal" (parse_git_branch)
    end
end
