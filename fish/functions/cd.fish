function cd --description "Change directory"
    set -l MAX_DIR_HIST 25


    # Skip history in subshells.
    if status --is-command-substitution
        builtin cd $argv
        return $status
    end

    # Avoid set completions.
    set -l previous $PWD

    if test "$argv" = -
        if test "$__fish_cd_direction" = next
            nextd
        else
            prevd
        end
        return $status
    end

    if test "$argv" = ""
        builtin cd
    else
        builtin cd "$argv"
    end
    set -l cd_status $status

    if test $cd_status -eq 0 -a "$PWD" != "$previous"
        set -q dirprev
        or set -l dirprev
        set -q dirprev[$MAX_DIR_HIST]
        and set -e dirprev[1]

        # If dirprev, dirnext, __fish_cd_direction
        # are set as universal variables, honor their scope.

        set -U -q dirprev
        and set -U -a dirprev $previous
        or set -g -a dirprev $previous

        set -U -q dirnext
        and set -U -e dirnext
        or set -e dirnext

        set -U -q __fish_cd_direction
        and set -U __fish_cd_direction prev
        or set -g __fish_cd_direction prev
    end

    return $cd_status
end
# This is a hack of the `cd` function that ships with fish,
# usually stored at `/usr/share/fish/functions/cd.fish` ,
# which you can shadow by placing this file in `$HOME/.config/fish/functions` .
#
# For all shells, the builtin `cd` command has no flags, and only ever takes one argument, if any.
#
# This means when literally typing `cd /home/$USER/Music/The Beatles`
# there is nothing the user could possibly be trying to specify other than
# a path that happens to have spaces in a directory name.
#
# Considering fish is already doing extra handling of directory history before executing the `cd` builtin,
# we can stop being pedantic about enforcing space-separation of multiple arguments for a command that
# can never have multiple arguments, and thus quote the path automatically for the user.
