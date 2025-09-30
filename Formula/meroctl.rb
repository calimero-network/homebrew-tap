class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.13"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.13/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "441db835d4f46e215ef787390f9db9ec71d0235d4dea149835c16c885c0e15ab"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.13/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "1e0fec6a18355d896e9d5dc681d0b5d617f6354cabb8d9e728e21ce7f6508c2c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.13/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "e5a62f5f79f5dd7715319996c089d3ac8aed87d8369916337d8f90b7bb54f8aa"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.13/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "22637dfb88d8f07d0132002010b8740cab2f92075b137717f247a6dc0126ed69"
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
