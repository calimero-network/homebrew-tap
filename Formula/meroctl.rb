class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.13"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.13/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "1c3f8c4691e9535059ebc194ea4ec5c36bf06b6af4ae38232986bff9d3be5bb2"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.13"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.13/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "2cb461ddb96e324b3fc794fbd420b484daa4fbb43f73efc801dd337827e18695"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.13/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "abb343d876e262c8d60c57647864d7582d63d54542a49dadcafd7faf5150cf2a"
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
