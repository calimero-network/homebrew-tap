class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.2"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.2/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "3a8f4c88927f98933e022d7bb77fe1f59e76f10bd5959ab02fedb1d6c135ac4d"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 1.0.0-rc.2"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.2/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "a345cba272673f5d3cebe040c2c311b74b6abe441f06deab1d59046707238663"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.2/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "a72305a55df25ab20c2ab6d3d37e780eb1af20235e5f7e8198f4a44c14313a1a"
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
