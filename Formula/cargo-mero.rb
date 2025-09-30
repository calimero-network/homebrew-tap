class CargoMero < Formula
  desc "Cargo subcommand for Calimero Network tooling"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.14"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.14/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "05603176cd6ccaa52a8971d73d62b78d063c29b80d071dcb0b05ea95bba469bb"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.14/cargo-mero_x86_64-apple-darwin.tar.gz"
    sha256 "560918bd2e7bcdf3640ee7c5fa3f4af3faedaacd3901c09b9209b8101f48f75e"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.14/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7e61d60174555158e16f629d892b90a9d3baa8f58bad31e9da74205f46a09b07"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.14/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "06b23c03ac2492cbe2b443e918480715b9a92aa233b559c3b067593f52b37d1a"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "cargo-mero"
  end

  test do
    assert_match "CargoMero CLI", shell_output("#{bin}/cargo-mero --help")
  end
end
