export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

ZSH_THEME="dieter"

# Fail2ban
alias countBruteForceSSH="sudo cat /var/log/auth.log | grep 'Failed password for root' --count"
alias snifBan="tail -f -n 30 /var/log/fail2ban.log"
