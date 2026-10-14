class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.87"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.87/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "ae7ec2cf1d03f7086dc4a1f59eee9a07988503c57414fd5ed34292e038c54625"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.87"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.87/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8943f08aa879a55377fe5e4fffc4326b81df3f083b105f24bbe59c405cab41ea"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.87/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5556d2d2989321af01e6b137a528fe577ab143c30929c4a697656c55b8af48bf"
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
