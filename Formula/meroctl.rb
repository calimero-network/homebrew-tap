class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.9"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.9/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "be4934a0b37e0d03b14e5de3dd9e0207c3d1b4196aec3dbc45423d9158341f1c"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 1.0.0-rc.9"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.9/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "43714f82158263b00df493ddc91b76ee4e8ebc1e3e741a692af90b10f1e2b2ad"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.9/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "8bc87fd326fbdcf78b71ca4129ffd8c262961edd41a6dd11b6ee66a992929796"
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
