class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.41"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.41/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "8ce45071343cec20ae39a081ec1cbf25ab93a17d28cb68387da231ad97eaa4b5"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.41"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.41/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a028f90f01605b48953d1c8fc0680d90ded909fcc21b151d68c22ae8c33a2b86"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.41/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a68d11f25d0cb0e6c75f4c1bd10455aef5503024521d3202db41a8398d0d0dc7"
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
