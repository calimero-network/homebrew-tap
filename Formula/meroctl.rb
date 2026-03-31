class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.1-rc.14"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.14/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "90c00e34f69da4e9e8bf0cdd6b609bcf006a16d1c27ddd2a2ac177f54391fe42"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.1-rc.14"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.14/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c9c2a99d1298d09c4f9c2f8a379b698fbae6a03c36f31ec59c972328e542c493"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.1-rc.14/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e00ca2b7eb06c5f3415b982f82e9d7492e2d941fe72eb0c959515ae17247703e"
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
