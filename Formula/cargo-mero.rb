class CargoMero < Formula
  desc "Cargo subcommand for Calimero Network tooling"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.12"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.12/cargo-mero_aarch64-apple-darwin.tar.gz"
    sha256 "8999403c22a63a9bfc9f25499a439ab68e11e98cc3876c3b5da2f65b0701fb34"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.12/cargo-mero_x86_64-apple-darwin.tar.gz"
    sha256 "70baf564076c45aa4744670b151e23a7827ef3db48e4fefb6c41eb8749e230ea"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.12/cargo-mero_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c773e27329876dbd27212f7412b26624d660725f2760e5788f81d98ff7ddb712"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.12/cargo-mero_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "52026745364a060ad191d979f1418aa417f6c998269b872449b5151c791a6678"
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
