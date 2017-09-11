# ysg-confs

You have been listening to a lot of crap about Configuration Management from people who do not have
a glue of what it ACTUALLY is ... From the whisdom of life we know that in "In Theory theory and
practice are the same, but in Practice it ain't so ...". Thus :

This repo contains my PRACTICAL implementation of configuration management - I am ready to change my opinion on how this PRACTICAL implementation SHOULD work as soon as you clone the repo and demo me the better way of doing it based on the "Talk is cheap, show me the code" principle" ...

With that said feel free to copy on your own responsibility ...
All potential e-mails, chats etc. regarding the stuff in this repo will be disgarded ... 
Thus, Read the comments ... 

Usage:

     # do not unpack straight into your ~
     mkdir -p /tmp/"$USER"-confs; cd /tmp/"$USER"-confs/
     
     # clone the repo to see the stuff 
     git clone git://github.com/YordanGeorgiev/ysg-confs.git .

     # check the files
     ls -al

     # do not run by display the cmds to copy the cnf files to the host ...
     while read -r f ; do echo cp -v $f ~/$(`echo basename $f`|perl -ne "s/host-name/"`hostname -s`"/g;print") ; \
     done < <(find . -maxdepth 1 -type f  -name '.*')

     # finally if you are into vim 
     cp -vr .vim ~/
