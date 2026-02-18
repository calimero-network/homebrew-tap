class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.52"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.52/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "9b5f56eb5e14bb5ff2125995dc6a17da6e7e44d28967752310c2c0a04994959f"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 0.10.0-rc.52"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.52/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "17982eb53831d7e3aec16f317024cd189c92d6a7f71aa17687748e2fdbb318c2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.52/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "6caed02cb3e8e27d176495cf1ee42a612cce1714e2a742e1be387263eec09000"
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
