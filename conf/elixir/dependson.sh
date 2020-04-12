#!/bin/bash


if ! [[ -x $(which elixir) ]]; then
    if [[ -x $(which apt-get) ]]; then
        wget https://packages.erlang-solutions.com/erlang-solutions_2.0_all.deb \
            && sudo dpkg -i erlang-solutions_2.0_all.deb

        sudo apt-get update
        sudo apt-get install esl-erlang elixir -y
    else
        echo "Package manager not supported in this script. Go to https://elixir-lang.org/install.html"
    fi
fi

[[ -z "$USR_SRC_DIR" ]] && USR_SRC_DIR="$HOME/.install"

mkdir -p $USR_SRC_DIR
pushd $USR_SRC_DIR

if ! [[ -d "$USR_SRC_DIR/elixir-ls" ]]; then
    git clone https://github.com/elixir-lsp/elixir-ls.git
fi

cd "$USR_SRC_DIR/elixir-ls"

git pull

mix deps.get --force
mix elixir_ls.release --force

popd
