class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.25"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.25/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "196d6f0501e841d326391de594bd488ae77f98cf086564c10043b73ce36ddaa7"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.25/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.25/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "42779510fbd754b3dc190dc8818e319d537bd6ada4e3cbf7451594701e6f1ba0"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.25/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b789039b0cddce7685399c3c95f828b7e44c9e883b9045796fd262dc870247c8"
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
