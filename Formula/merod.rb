class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.89"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.89/merod_aarch64-apple-darwin.tar.gz"
    sha256 "fb993d6b959b6ad8135ab4fb45c0842cb1b61ff99b3e1bf230ff06b60dda2a22"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.89"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.89/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "77dab4795bee296eec1320275a4ea8d1eb36ed66c03ec249aa8afb663385e5ba"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.89/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "dc8c151bf36f92c3d6ec429beb9dae96202fff9a5457b6caf0a03ce1d68c0401"
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
