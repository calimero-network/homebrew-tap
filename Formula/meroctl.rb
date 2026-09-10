class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.33"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.33/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "51710b5f1a1b1ff2aaabac66d9ebbb7c314f05ad6f6c66ea825aabeac9000677"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.33"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.33/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "08ad33a2a76240ba8df5d601c9f2f9e0f5314ad838dc6834b6b7f42730acd10e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.33/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6856bb16742237c0d8d09b1e1e19891e22e24f32c94e408361172eae855a005b"
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
