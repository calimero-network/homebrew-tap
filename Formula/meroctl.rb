class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.36"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.36/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "e651d81e331e9b709930f54ce69ce537bc4a83a355058a521cbc338b85e91077"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.36"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.36/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "6e427678cde31cb718962980f9ea1f42be909ed2d6a9d85c6ccccbb30fa9bf22"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.36/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c68744bf7ba88a251f11ae7814249c078c7dc8c348a8b0a66778d3ecefab23dd"
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
