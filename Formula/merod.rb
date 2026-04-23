class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.30"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.30/merod_aarch64-apple-darwin.tar.gz"
    sha256 "a66548e338aa7486fa67c22298f545692a530477b5012ba87f562bbb4321ded8"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.30"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.30/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "21022e83db0f33081da7cdf569de21e779343ce1353cf10f81e391133569724a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.30/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "24bc58e1fdb86abbbcbf1043a1a8ef89bd257bb9c4e311e9164b0d221c73b8d6"
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
