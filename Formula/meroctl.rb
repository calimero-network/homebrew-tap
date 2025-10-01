class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.16"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.16/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "0de0ff6fffc1585973ebe8406ee2e166fa7f699a731afd29c43959a8d3f0ad04"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.16/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "62714dd7a79d39015eade2efd77c9328677035f721823687b1d46d04e8547034"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.16/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "1f2f5386f03c38ceb6a467bc6ec9607be33945d7fbeeaf2d03ef55857cde72af"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.16/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f3b8752537a35ab65b83cc9bfca157f7d2704244147c29e3c3f5354b13f5dc91"
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
