# Cache packages that pip downloads
export PIP_DOWNLOAD_CACHE=~/.pip/cache

# pyenv
export PATH="~/.pyenv/bin:$PATH"
eval "$(pyenv init -)"
export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
eval "$(pyenv virtualenv-init -)"
