class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.76"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.76/merod_aarch64-apple-darwin.tar.gz"
    sha256 "5aeeea8031ab000f41d28d9350ca5f4daec13739ede42d058aa39e58c7d98f68"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.76"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.76/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "51338495cb8aa4f0d4f17e28f4008b536d078356488d564ba81984dc4fccce53"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.76/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e718e44595f622cba8475ac8493e1e036e921f3d79222e20c8cffd19a18558cf"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "merod"
  end

  test do
    assert_match "Merod CLI", shell_output("#{bin}/merod --help")
  end
end
