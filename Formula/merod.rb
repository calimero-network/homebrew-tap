class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.23"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.23/merod_aarch64-apple-darwin.tar.gz"
    sha256 "f66cf4852e3757145ee5a02de679ed86406413fc2fb4ec96696ff36c15361002"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.23/merod_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.23/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "5f083dab96660c642e17742ab7a86e2db5ef118d81cc9ad40b6b4fdd2cafc124"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.23/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "046335e0060f4aab1d304e208687ee516ffbec68f3fa78b1210c6b7aa755d25c"
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
