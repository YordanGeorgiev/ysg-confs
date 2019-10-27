#!/bin/bash
# usage:
# curl https://raw.githubusercontent.com/YordanGeorgiev/ysg-confs/master/src/bash/deployer/setup-bash-n-vim.sh | bash
main(){
   do_enable_locate
   do_provision_tmux
   do_provision_vim
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

do_provision_bash(){
   echo 'start ::: fetching bash_opts'
   wget -O ~/.bash_opts.`hostname -s` \
      'https://raw.githubusercontent.com/YordanGeorgiev/ysg-confs/master/.bash_opts.host-name'

   echo "source ~/.bash_opts.`hostname -s`"
   echo 'stop  ::: fetching bash_opts'
}

# Action !!!
main
