# @(#) .cshrc 5.2 20040506 ev

# NOTE:
# This file provides the user with a workable environment
# on all UNIX platforms.
# Users should not change anything in this file.
# All modifications should be done in the file .cshrc.private
# It should at least contain the definition of a default printer.

# --- HT and MACHINENAME selection
#     current hosttypes are:
#          HPUX10       vendor=HP,processor=parisc,OS=HP-UX10.20
#          HPUX11       vendor=HP,processor=parisc,OS=HP-UX11.x
#          LINUX        vendor=RedHat,processor=i386,OS=RedHat7.x
#          SUN5         vendor=SUN,processor=sparc,OS=Solaris2.x
#setenv HT `/usr/local/bin/hosttype`
setenv HT `/imec/software/central/bin/hosttype`

# --- make sure we have the username in USER
switch ($HT)
  case HPUX11:
      setenv USER $LOGNAME
      breaksw
endsw

# --- tty and prompt (only in an interactive shell)
tty -s
set ttystat=$status
if (($?prompt) && ($ttystat == 0)) then
  stty sane
  stty intr ^C
  stty erase ^H
  stty susp ^Z
  stty kill ^U
  stty -tabs
  stty ixoff
  stty echoe
  set prompt = "${USER}@`uname -n`> "
endif
unset ttystat

# --- composition of the search path
#     sequence: user's own binaries ($HOME/bin), /usr/local stuff,
#               system stuff, /imec/software/central
# NOTE for gnu users:
#     those of you who had the old gnu stuff in front of their PATH
#     can still do so, if they really want to:
#     just add /imec/software/central/packages/gnu/bin at the front

# ----- compose path for system binaries (including C compilation)
switch ($HT)
  case HPUX11:
#      set path = `cat /etc/PATH`
#      setenv MANPATH `cat /etc/MANPATH`
      set path = ( /opt/ansic/bin /opt/langtools/bin /usr/ccs/bin /usr/bin/X11 /usr/contrib/bin/X11 /usr/bin /usr/contrib/bin )
      setenv MANPATH /opt/ansic/share/man:/opt/langtools/share/man:/usr/share/man:/usr/contrib/man
      breaksw
  case LINUX:
      set path = ( /usr/bin/X11 /bin /usr/bin )
      setenv MANPATH /usr/X11R6/man:/usr/lib/perl5/man:/usr/share/man
      breaksw
  default:
      set path = ( /usr/bin/X11 /usr/bin /bin )
      setenv MANPATH /usr/share/man:/usr/man
      breaksw
endsw


# ----- definition of the complete search path
set path = ( . \
             ${HOME}/bin ${HOME}/bin/${HT}bin \
             /usr/local/bin /usr/local/bin/${HT}bin \
             $path \
             /imec/software/central/bin \
           )

# --- definition of the complete search path for man pages
setenv MANPATH ${HOME}/man:/usr/local/man:${MANPATH}:/imec/software/central/man

# --- definition of the complete search path for X11 information
setenv XFILESEARCHPATH /usr/local/lib/X11/%T/%N:/usr/lib/X11/%T/%N

# --- some general settings
# default file protection
umask 027
# prohibit coredumps
limit coredumpsize 0

# --- hosttype independent (environment) variable settings  
set filec
set ignoreeof
set history = 100
unset notify
unset autologout
setenv EXINIT 'set noai beautify magic redraw showmatch wm=4'
setenv PAGER more

# --- hosttype independent aliases
alias lo logout
alias ls /bin/ls -F --color=auto
alias rm /bin/rm -i
alias ll ls -la
alias cd 'cd \!*; ls'
alias prj 'cd ~meminhwi/pan78'
alias gem 'cd /imec/other/meminhwi/pan78/temp/gem5/gem5'
alias gemi 'cd /imec/other/meminhwi/pan78/seat-huawei'
alias gemii 'cd /imec/other/meminhwi/pan78/ver1d0'
alias g gvim

# --- hosttype dependent aliases and (environment) variable settings
switch ($HT)
  case HPUX11:
      setenv LANG C
      alias mail mailx
      breaksw
  case LINUX:
      alias mailx mail
      breaksw
endsw

# --- SGE environment (only on LINUX)
switch ($HT)
  case LINUX:
    source /imec/software/sge/current/test817/common/settings.csh
    breaksw
endsw

# if you want to override some of the previous settings,
# do so in the $HOME/.cshrc.private file
if ( -r ${HOME}/.cshrc.private ) then
  source ${HOME}/.cshrc.private
endif
