class Meroctl < Formula
  desc "Calimero's command line: make, ship and run apps, and reach nodes"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.38"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.38/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "aca74e4f1152189baea210ee04d11494857f8e6d399dd83b43c5265d9446d73f"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "meroctl 1.0.0-rc.38 has no Intel macOS build"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.38/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "4db6d516102521a46d9cbcbfbc4d253c2a3956f74ec35af492a690dbf51150e2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.38/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "610438fc56e34484b8f47b3aa6dc6eda7591c2e804eeca57778c3cbd37df66b0"
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
