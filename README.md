# Calimero Homebrew tap

```bash
brew install calimero-network/tap/meroctl   # the command line (Linux, macOS on Apple silicon)
brew install calimero-network/tap/merod     # the node (Linux; macOS from core 1.0.0-rc.25)
```

`Formula/*.rb` is written by `generate-formula.sh <binary> <version>`. Every core release
(calimero-network/core's `release.yml`, job `Update Homebrew Tap`) runs it for each binary
it ships through Homebrew and opens a pull request here, one per release, which merges
once `Test Brew Install` passes. Do not edit the formulas by hand.
