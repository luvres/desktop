# $DOCKER_HOME/.profile: executed by the command interpreter for login shells.

# Note: It is sourced automatically when Docker or Singularity starts.
# For best compatability with Singularity images, use $DOCKER_HOME
# instead of $HOME when initializing the paths.

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$DOCKER_HOME/.bashrc" ]; then
        . "$DOCKER_HOME/.bashrc"
    fi
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$DOCKER_HOME/bin" -a -z "$(echo $PATH | grep $DOCKER_HOME/bin)" ] ; then
    PATH="$DOCKER_HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$DOCKER_HOME/.local/bin" -a -z "$(echo $PATH | grep $DOCKER_HOME/.local/bin)" ] ; then
    PATH="$DOCKER_HOME/.local/bin:$PATH"
fi

# initialize the configuration of zsh and vim
if [ -n "$SINGULARITY_NAME" ]; then
    # copy from $DOCKER_HOME to $HOME for Singularity if not exist
    if [ ! -e $HOME/.zshrc ]; then
        cp $DOCKER_HOME/.zshrc $HOME/.zshrc
    fi
    if [ ! -e $HOME/.zprofile ]; then
        cp $DOCKER_HOME/.zprofile $HOME/.zprofile
    fi
    if [ ! -e $HOME/.vimrc ]; then
        cp $DOCKER_HOME/.vimrc $HOME/.vimrc
    fi
fi
