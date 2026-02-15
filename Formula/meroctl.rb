class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.43"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.43/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "a95a40db2995df0533ed8c702942d72a3e273a46e2809fa46beaff6f642b52a8"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.43"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.43/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "335bbe44127da3f2011eed88880cba9440e2a9020194c14a67454674dab4f0b3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.43/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4b1c5e19350214867f26ffe4de049789a0bc41b5dabbb36daa87ea31eb98f62d"
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
