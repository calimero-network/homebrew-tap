class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.8"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.8/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "da69fc4d0f5ce69f74dd338c9b875cdb1013e2eee76f917ae4a7402e3c6b8cd1"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "Intel macOS binaries are not available for 1.0.0-rc.8"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.8/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7e28b997e2d8da7799c73446235fa4fd1bdeb720b4b6c6d7b88bef79c67409ec"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.8/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "c5a9bd1cecd42fd3a2f07bf41faa3f19ba115b651bc1052054efced5b420f223"
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
