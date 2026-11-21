class Meroctl < Formula
  desc "Calimero's command line: make, ship and run apps, and reach nodes"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.33"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.33/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "cf18d9ee829b4e0db4133e205e30d0e72ea0d6469d78b9b285530c689a2ec407"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "meroctl 1.0.0-rc.33 has no Intel macOS build"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.33/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "62e2fae3c466a6f2c213e6eb51f04a1df8ebd6f0d50a1827eeec33e42025039a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.33/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0145cb2e3d186455bc39cf20e526ae7176e4ad2ac1e9f6f8b9a1d7b27052e465"
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
