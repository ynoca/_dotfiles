# for global
export PATH=$PATH:$HOME/bin
export PATH=$PATH:/usr/local/bin
export TERM=xterm-256color
export LC_ALL='en_US.UTF-8' 
export PATH=$PATH:$HOME/script/gdrive

# for postgress
export PGDATA=/usr/local/var/postgres

# for theos
export PATH=$PATH:/opt/theos/bin
export THEOS=/opt/theos
export THEOS_MAKE_FILE=/opt/theos

# for pyrnv
if which pyenv > /dev/null 2>&1;
then
  export PYENV_ROOT=$HOME/.pyenv
  export PATH=$PYENV_ROOT/bin:$PATH
  eval "$(pyenv init -)"
fi

# for rbenv
if which rbenv > /dev/null 2>&1;
then
  export RBENV_ROOT=$HOME/.rbenv
  export PATH=$RBENV_ROOT/shims:$PATH
  eval "$(rbenv init -)"
  export PYTHONPATH=/usr/local/Cellar/opencv/2.4.13/lib/python2.7/site-packages:PYTHONPATH

fi

# for golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# for julia
export PATH=$PATH:/Applications/Julia-0.5.app/Contents/Resources/julia/bin

# vim: set filetype=zsh:
