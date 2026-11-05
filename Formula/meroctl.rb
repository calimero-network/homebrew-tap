class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.10"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.10/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "d2c7fcf44e4238fe93b4d30cd8d0b37f36008aabe05803f3be909d336926b189"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 1.0.0-rc.10"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.10/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "67a2012a5c3636dff89a9b13cb45187bfc34710f66eaa4437500800ead4aa672"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.10/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e5647647fcdaea20520a311c9ac813eeb9ddebcd545ad856e37f5df9be152505"
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
