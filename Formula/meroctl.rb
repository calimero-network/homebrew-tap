class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.12"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.12/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "c65ad789f259f63a97686236a37ef6a380c1bd351395809ff7a241f3736c9db8"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.12/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "e1a3be4103161a5e58b5e3df9c7edd066e6c8521d41d688ba9408ba35776ffdb"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.12/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "6b3a622fee82546e36772579673bb6243a25eec9ecec8bae0babdf1909647cc2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.12/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0add82158e160ab311f27de50948279c9e46f6ec5e1d3e3083a2436b409e4263"
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
