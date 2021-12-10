if [ "$(command -v cargo)" ]; then
    alias cr="cargo run --"
    alias crq="cargo run --quiet --"
    alias cmr="cargo fmt && cargo run"
    alias cb="cargo build"
    alias ct="cargo test"
    alias cx="cargo xtask"
fi

if [ "$(command -v rustup)" ]; then
    alias rustup-list="rustup target list"
fi
