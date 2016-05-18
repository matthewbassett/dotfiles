########################################################################
# Setting ENV Variables                                                #
########################################################################
EDITOR='vim'
source ~/.bashrc
export PATH="/usr/local/Cellar:/usr/local/sbin:$PATH"
# Setting Locale
export LC_ALL=en_US.UTF-8  
export LANG=en_US.UTF-8
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

########################################################################
# Config File Editing Shortcuts                                        #
########################################################################
alias tmuxedit='sudo vim ~/.tmux.conf'
alias bpedit='sudo vim ~/.bash_profile'
alias vimedit='sudo vim ~/.vimrc'

########################################################################
# Command Shortcut Alias                                               #
########################################################################
alias subdir='ls -R'
alias ls='ls -SsAaFGk'
alias c='clear'
alias android='cd /usr/local/Cellar/android-platform-tools/22.0.0/bin/'
alias sourcebp='. ~/.bash_profile'
alias weather='curl http://wttr.in/tianjin'
alias ndd='dcfldd'

