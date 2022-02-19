function cargo-fmt-all {
    cargo fmt --all -- --check
    cargo clippy -- -D warnings
}

function cargo-check-all {
    cargo +nightly fmt
    cargo +nightly clippy
    cargo +nightly udeps
    cargo bloat
}

function cargo-build-static {
    if [ ! -f Cargo.toml ]; then
        docker pull clux/muslrust
        docker run -v $(pwd):/volume --rm -t clux/muslrust cargo build --release
    else
        echo "file not found in current working directory: Cargo.toml"
    fi
}

function cbr {
    cargo build --release
    local CRATE=target/release/$(cargo metadata --no-deps --format-version 1 | jq -r '.packages[0].name')
    du -h $CRATE
    du $CRATE
}

function rust-setup {
    if [ "$BJK_OS" = "darwin" ]; then
        if [ "$BJK_ARCH" = "x86_64" ]; then
            rustup toolchain install stable-x86_64-apple-darwin
            rustup toolchain install nightly-x86_64-apple-darwin
            rustup default stable-x86_64-apple-darwin
        elif [ "$BJK_ARCH" = "arm64" ]; then
            rustup toolchain install stable-aarch64-apple-darwin
            rustup toolchain install nightly-aarch64-apple-darwin
            rustup default stable-aarch64-apple-darwin
        fi
    elif [ "$BJK_LINUX" = "true" ] && [ "$BJK_ARCH" = "x86_64" ]; then
        rustup toolchain install stable-x86_64-unknown-linux-gnu
        rustup toolchain install nightly-x86_64-unknown-linux-gnu
        rustup default stable-x86_64-unknown-linux-gnu
    fi
}
