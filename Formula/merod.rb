class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.3/merod_aarch64-apple-darwin.tar.gz"
    sha256 "55fd13d7d9d6d0ba3840d594356561d39778cdab2fb98cf3c455c8b2d2567488"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.3/merod_x86_64-apple-darwin.tar.gz"
    sha256 "a188a181aaef008037988be45343c288f70263eb1cdcc9d6e4c84715394c13af"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.3/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "120de7fc0d922cc03a54dd6526443e03945bda17506ad7b86b7a6bf3c68333f8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.3/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "54215f1d6bcdfe5263ee48471c1ed6615bfc0b02c378caac174d21fdd7a5809e"
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
