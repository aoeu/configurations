# aoeu@htns in /home/aoeu/configurations/fish/functions on (master+4|→1⚡1) at 2019-18-07 16:47:09

set __fish_git_prompt_show_informative_status 'yes'

# Default prompt is defined at /usr/share/fish/functions/fish_prompt.fish @ line 5
function fish_prompt --description 'Write out the prompt'
  set -l color_cwd
  set -l suffix
  switch "$USER"
    case root toor
      if set -q fish_color_cwd_root
        set color_cwd $fish_color_cwd_root
      else
        set color_cwd $fish_color_cwd
      end
      set suffix '#'
    case '*'
      set color_cwd $fish_color_cwd
      set suffix '>'
  end


  set_color normal
  printf '\n%s@%s' "$USER" (prompt_hostname)

  set_color normal
  printf ' in '

  set_color $color_cwd

  # Overrides for a long directory name that cause the prompt to truncate:
  # * Set LONG_DIR and SHORT_DIR as environment variables.
  # * LONG_DIR: the directory you are frequently in for a project that causes prompt to trunctate.
  # * SHORT_DIR: the directory you would like to abbreviate LONG_DIR to in the fish prompt.
  set longDir "$LONG_DIR"
  set shortDir "$SHORT_DIR"
  set currentDir (echo -n "$PWD" | grep -Eq "^$longDir.*\$" ; and echo -n "$PWD" | sed "s#^$longDir#$shortDir#" ; or echo -n "$PWD")
  echo -n "$currentDir" | sed "s#^$HOME#~#"

  set_color normal
  set prompt_git (__fish_git_prompt)
  set prompt_git_prefix ""

  test ! "" = "$prompt_git"; and set prompt_git_prefix ' on'
  test ! "" = "$prompt_git_prefix"; and printf '%s' "$prompt_git_prefix"
  set_color $fish_color_redirection
  printf '%s' "$prompt_git"

  set_color normal
  printf ' at %s' (date +'%Y-%d-%m %H:%M:%S')

  set_color normal
  printf '\n%s ' "$suffix"
end
