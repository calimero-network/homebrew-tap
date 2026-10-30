class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.4"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.4/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "7b69ab7df723123cf7e5968976cef9da3cac118568b0c404f51992905be26af7"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 1.0.0-rc.4"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.4/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "ed87a141d548a0c1b383d46b72c3a8c5cc1fa9a4c670249b16e1e2b76e3adf35"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.4/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a76f8bc0100450335b54dfccd33227ddbee4b9ed46ba39a42b711df76a4c8b69"
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
