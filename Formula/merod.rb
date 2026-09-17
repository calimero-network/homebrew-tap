class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.39"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.39/merod_aarch64-apple-darwin.tar.gz"
    sha256 "ce5a99acd431a5be5b6d6d81f2cc55fc47ebfb2acfcd46bcbce094f1dbd7331a"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.39"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.39/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c5f9b50750c85143efee532fc79b39b498abbd83adf715dc818ebf20a8f1bbee"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.39/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "620a4a200e28f7ae2a95990d841fdb08b573aae03a2a203eb0a42cc931abc5a5"
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
