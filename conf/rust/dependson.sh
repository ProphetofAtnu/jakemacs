#!/bin/bash

if ! [[ -x $(which rustup) ]]; then
    
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

    echo "Rustup has been installed. You may need to reload your shell."
    
fi

if [[ -x $(which rustup) ]]; then

    echo "Rustup and Cargo are installed, installing other dependencies..."

    rustup update
    rustup default nightly
    rustup component add clippy

    if ! [[ -x $(which rust-analyzer) ]]; then
        
        # Install Rust analyzer
        [[ -z "$USR_SRC_DIR" ]] && USR_SRC_DIR="$HOME/.install"

        mkdir -p $USR_SRC_DIR
        pushd $USR_SRC_DIR

        git clone https://github.com/rust-analyzer/rust-analyzer
        cd ./rust-analyzer/
        cargo xtask install --server
        
        popd

        echo "Rust Analyzer has been installed in $USR_SRC_DIR"
    fi

fi

