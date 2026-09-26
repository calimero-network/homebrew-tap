class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.47"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.47/merod_aarch64-apple-darwin.tar.gz"
    sha256 "4d3fe4ce40d506462e71981a72ef7febc73b2fe42b77c302cd6d660e195124cb"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.47"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.47/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "cf472755b519ddb8fa2e0990497d3d1f979a1f2223ce5e26a75e0bfe9321efb0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.47/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "1343d75b1fc4784d8a5a5173eb0fd0c3541aae518af0d8da99e78c4ab3aa4790"
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
