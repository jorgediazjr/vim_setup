# personal aliases
alias h="history"
alias home="cd /var/www/html/"
alias vim="nvim"
alias v="nvim"
alias vd="nvim -d"
alias x="exit"
alias c="clear"
alias shift44="cd /var/www/html/00-shift44"
alias samples="cd /var/www/html/samples"
alias sweeps="cd /var/www/html/sweeps"
alias jobs="cd /var/www/html/jobs"
alias surveys="cd /var/www/html/surveys"
alias moneysearch="cd /var/www/html/moneysearch"
alias unemployment="cd /var/www/html/unemployment"
alias rewards="cd /var/www/html/rewards"
alias financial="cd /var/www/html/financial"
alias legal="cd /var/www/html/legal"
alias housing="cd /var/www/html/housing"
alias section8="cd /var/www/html/section8"
alias grants="cd /var/www/html/grants"
alias offer="cd /var/www/html/offer_include"
alias dash="cd /var/www/html/dash-s44"
alias dlogs="cd /var/log/dash_debug_files"

alias lg="lazygit"

alias g="git status ./"
alias gpo="git push origin"
alias ga="git add"
alias gd="git diff ./"
alias gb="git branch -v"
alias ge="git checkout"
alias gp="git pull"
alias geb="git checkout -b"
alias gcm="git commit -m"
alias gc="git commit"
alias gmp="git checkout master;git pull"
alias gps="git checkout master;git pull origin staging"
alias gpd="git checkout master;git pull origin dev"
alias gbd="git branch -D"

alias vimrc="vim ~/vim_setup/.vimrc"
alias bashrc="vim ~/.bashrc"
alias bash_alias="vim ~/vim_setup/.bash_aliases"

alias ..="cd ../"
alias ...="cd ../../"
alias ....="cd ../../../"

alias err="tail --l 50 /var/log/nginx/error.log"
alias cerr="cp /dev/null /var/log/nginx/error.log"
cheat() {
  curl cht.sh/"$1"
}

# mycli aliases
alias mycli-sites="mycli --login-path dash sites"
alias mycli-datamodel="mycli --login-path dash dataModel"
alias mycli-shift44="mycli --login-path dash shift44"
alias mycli-users="mycli --login-path users userdata"
alias mycli-waterfall="mycli --login-path waterfall waterfall"
alias mycli-leadmanager="mycli --login-path lead-manager lead_posting_manager_v2"
alias mycli-samples="mycli --login-path samples sites"
alias mycli-sweeps="mycli --login-path sweeps sites"
alias mycli-jobs="mycli --login-path jobs sites"
alias mycli-surveys="mycli --login-path surveys sites"
alias mycli-moneysearch="mycli --login-path moneysearch sites"
alias mycli-unemploy="mycli --login-path unemploy sites"
alias mycli-rewards="mycli --login-path rewards sites"
alias mycli-financial="mycli --login-path financial sites"
alias mycli-legal="mycli --login-path legal sites"
alias mycli-housing="mycli --login-path housing sites"
alias mycli-section8="mycli --login-path section8 sites"
alias mycli-grants="mycli --login-path grants sites"
