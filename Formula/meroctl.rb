class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.4"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.4/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "5578bc333440a0d040b5505b205ec1db956d6d1626d37ddcbb631b8263582450"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.4/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "175973b8afd7f109be9e6d8572279ed81d325c70d58cd0964ca774ffa405eea3"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.4/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "441e0e700651a5f9de24c117096fd4eb293603f77ca38fb47afb218c8cd04294"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.4/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "7de29329df9db8fd5e9b4f325874907e7fe19ff1c114dbb398253df4119739fe"
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
