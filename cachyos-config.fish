## Set values
## Run fastfetch as welcome message
function fish_greeting
    fastfetch
end

# Format man pages
set -x MANROFFOPT "-c"
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

## Environment setup
# Apply .profile: use this to put fish compatible .profile stuff in
if test -f ~/.fish_profile
  source ~/.fish_profile
end

# Append common directories for executable files to $PATH
fish_add_path ~/.local/bin ~/.cargo/bin ~/Applications/depot_tools

# Function needed for !!
abbr -a !! --position anywhere --function __last_history_item

## Useful aliases
abbr -a dotdot --regex '^\.\.+$' --function multicd                            # .. -> cd .. ; ... -> cd ../.. ; and so on
abbr -a limine-save 'sudo limine-mkinitcpio'
abbr -a fixpacman "sudo rm /var/lib/pacman/db.lck"
abbr -a tarnow 'tar -acf '
abbr -a untar 'tar -zxvf '
alias psmem 'ps auxf | sort -nr -k 4'
alias psmem10 'ps auxf | sort -nr -k 4 | head -10'
alias bigpkg "expac -H M '%m\t%n' | sort -h | nl"                              # Sort installed packages according to size in MB
alias gitpkg 'pacman -Q | grep -i "\-git" | wc -l'                             # List amount of -git packages
abbr -a update 'cachy-update'
abbr -a mirror "sudo cachyos-rate-mirrors"
abbr -a cleanup 'sudo pacman -Rns (pacman -Qtdq)'                              # Cleanup orphaned packages
alias jctl "journalctl -p 3 -xb"                                               # Get the error messages from journalctl
alias rip "expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"  # Recent installed packages
