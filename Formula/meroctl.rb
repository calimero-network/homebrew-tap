class Meroctl < Formula
  desc "Calimero's command line: make, ship and run apps, and reach nodes"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.29"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.29/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "3ebcac05aebde6b06f3647c3a54f42ff0433cc3a75de947b9ec32a9152e67734"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "meroctl 1.0.0-rc.29 has no Intel macOS build"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.29/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "94e33eae313f8f3dc6b46230276f3557e4e9aca5bf60432db36d09d45ab86938"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.29/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "3f291adadff7b05a5cd40dda5a5cc3b6aa5dc06699cd7c310a27ae77fe709b5f"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "meroctl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/meroctl --version")
  end
end
