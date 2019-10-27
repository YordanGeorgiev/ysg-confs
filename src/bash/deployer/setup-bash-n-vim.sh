#!/bin/bash
# usage:
# curl https://raw.githubusercontent.com/YordanGeorgiev/ysg-confs/master/src/bash/deployer/setup-bash-n-vim.sh | bash

main(){
   do_enable_locate
   do_provision_tmux
   do_provision_vim
   do_provision_git
   do_enrich_bash_history
   do_provision_bash
}


do_enable_locate(){
   sudo updatedb & # because of the locate elflord.vim bellow and just to speed up..
}


do_provision_tmux(){

   echo 'start ::: provisioning tmux'
   which tmux 2>/dev/null || {
      sudo apt-get update
      sudo apt-get install -y tmux
   }
   mkdir -p ~/.tmux/plugins
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
   git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tmux-copycat
   echo verify the tmux plugins
   find ~/.tmux/plugins -type d -maxdepth 2

   test -f ~/.tmux.conf && cp -v ~/.tmux.conf ~/.tmux.conf.$(date "+%Y%m%d_%H%M%S")
   wget -O ~/.tmux.conf \
      https://raw.githubusercontent.com/YordanGeorgiev/ysg-confs/master/.tmux.conf.host-name
   echo 'stop  ::: provisioning tmux'

}


do_provision_vim(){

   echo 'start ::: provisioning vim'
   which vim 2>/dev/null || {
      sudo apt-get update
      sudo apt-get install -y vim
   }
   which wget 2>/dev/null || {
      sudo apt-get update
      sudo apt-get install -y wget
   }
   test -f ~/.vimrc && cp -v ~/.vimrc ~/.vimrc.$(date "+%Y%m%d_%H%M%S")
   wget -O ~/.vimrc 'https://raw.githubusercontent.com/YordanGeorgiev/ysg-confs/master/.vimrc.host-name'
   sudo perl -pi -e \
      '$_="$_\nhi LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE"
      if $. == 27' $(locate elflord.vim) &
   echo 'stop ::: provisioning vim'

}




do_enrich_bash_history(){

cat << EOF_HIS >> ~/.bash_history
   ssh-keygen -t rsa -b 4096 -C "me@gmail.com"
   git add --all ; git commit -m "$git_msg" --author "Yordan Georgiev <yordan.georgiev@gmail.com"; git push
EOF_HIS

}


do_provision_git(){

   echo 'start ::: provisioning git'
   test -f ~/.gitconfig && cp -v ~/.gitconfig ~/.gitconfig.$(date "+%Y%m%d_%H%M%S")

cat << EOF_GIT >> ~/.gitconfig

   [credential]
     helper = cache

   [core]
     editor = vim
     pager = less -r
     autocrlf = false

   [user]
      name = Yordan Georgiev

   [push]
      default = simple
      followTags = true

   [color]
     diff = auto
     status = auto
     branch = auto
     interactive = auto
     ui = true
     pager = true

   [color "status"]
     added = green
     changed = red bold
     untracked = magenta bold

   [color "branch"]
     remote = yellow

   [fetch]
      prune = true
EOF_GIT

   echo 'stop ::: provisioning git'

}

do_provision_bash(){

   echo 'start ::: fetching bash_opts'
   wget -O ~/.bash_opts.`hostname -s` \
      'https://raw.githubusercontent.com/YordanGeorgiev/ysg-confs/master/.bash_opts.host-name'

   echo "source ~/.bash_opts.`hostname -s`"
   echo 'stop  ::: fetching bash_opts'

}

# Action !!!
main
