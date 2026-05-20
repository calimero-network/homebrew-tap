class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.41"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.41/merod_aarch64-apple-darwin.tar.gz"
    sha256 "fb1da90b5195c761b2cfa12eb5a2d1d7776d669f32c8a9071f1d24e786751b15"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.41"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.41/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "facaac4dfd2b3946d3789a4279b268641d4bbef92d630795d0bbf3d58ed59c55"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.41/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "5a7a608d9a53345198dc1ed547553775a6c05f635ef648b3d77053873d1d7fd5"
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
