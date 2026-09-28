class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.11.0-rc.59"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.59/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "ec8dfe62c423a23eb85fab508d5975c17f6cffb43583cbf006e1dbef77239d4d"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.11.0-rc.59"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.59/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8c17a3bac115d76d08773c6cfb9ef17422cdb7741e8e6dd2e2918d2e5824b53d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.11.0-rc.59/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0f480e6668f304d7a4f1c86388d06d87db54e244018ae7007e2ec52709437d91"
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
