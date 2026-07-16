class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.15"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.15/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "a403bd7dcf1359c4aad4c77988e17c0558ac5c8d69e22b609ec7630fa8528653"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.15"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.15/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "eb52012ae54d451e7cb11efcb39133bd54dfbb0dd63282b71039f0bd609baa71"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.15/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "407940aa438d9638bb19085bf9affb3b7fecd853193ec6979e092417a435cf0d"
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
