# your personal aliases are defined here
# ie.
# alias test='ll'
# unbind C-s and C-q from being terminal commands to be able to send them to vim
stty -ixon
alias publicIP='dig ANY +short @resolver2.opendns.com myip.opendns.com'
# hostname -I returns the private IP-adress and much more
# grep the first nonblank characters from the beginning of the line
# grep -E == egrep; -o matches only the match not the whole line
alias privateIP='hostname -I | grep -Eo "^\S+"'
alias saveToTar='tar cvf save$(date +"%m%d%Y-%H_%M_%S").tar $@'

