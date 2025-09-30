class CargoMero < Formula
  desc "Cargo subcommand for Calimero Network tooling"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.11"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.11/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 :no_check
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.11/cargo-mero_x86_64-apple-darwin.tar.gz"
    sha256 :no_check
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.11/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 :no_check
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.11/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 :no_check
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "cargo-mero"
  end

  test do
    assert_match "cargo-mero", shell_output("#{bin}/cargo-mero --help")
  end
end


