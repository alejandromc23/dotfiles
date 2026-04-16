#!/bin/bash

echo
echo "################################################################"
echo "  Installing Claude Code CLI                                    "
echo "################################################################"
echo

if ! command -v claude >/dev/null 2>&1; then
    if ! command -v npm >/dev/null 2>&1; then
        echo "npm not found. Install Node first (handled by Brewfile)." >&2
        exit 1
    fi
    npm install -g @anthropic-ai/claude-code
fi

echo "Run 'claude' and complete the login flow manually (browser-based)."
