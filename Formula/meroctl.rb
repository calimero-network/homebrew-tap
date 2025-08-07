class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.2/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "3042292a2bf7369524be14f42018cb63f9bd6929412a01cd67b5725d36f34a6f"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.2/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "07cea534a93d41a0f0601cc9047cc539e6ac1342fa652f8004d142570f725eb2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.2/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "fba2116f40579eb7caa0669ae322f452548f2fda705710d0be0b7a3e87916f9e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.2/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "fa6db7ca9be28a34135981994196714e6a1544366e2c14656fa4272309eed4a6"
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
