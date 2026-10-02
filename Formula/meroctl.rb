class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.77"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.77/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "3cf188fdb9130cdd41f6298081ea59acc81b7d0c668a070b7818446140ac67fb"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.77"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.77/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "85dca55ddb203c9a89add2c2351072ecf2fc4ba5e52b59731e1ce86e05f2c030"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.77/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "506fb9a135170efccd9178dd088c4ed24b29c277c892d26c64c9062ed02c6c48"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "meroctl"
  end

  test do
    assert_match "Meroctl CLI", shell_output("#{bin}/meroctl --help")
  end
end
