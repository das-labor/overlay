# Chromium browser profile
noblacklist ${HOME}/.config/chromium
include /etc/firejail/disable-mgmt.inc
include /etc/firejail/disable-secret.inc
include /etc/firejail/disable-common.inc

private-dev
private-tmp
shell none
noroot
caps.drop all
seccomp
netfilter
whitelist ${DOWNLOADS}
whitelist ~/.config/Franz
whitelist ~/.cache/*
include /etc/firejail/whitelist-common.inc
