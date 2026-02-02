class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.39"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.39/merod_aarch64-apple-darwin.tar.gz"
    sha256 "77ddee4e1d449765fa83e8923c198b3ac5a057305e81b9b9648341831bef0577"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.39/merod_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.39/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "7f9e3918e3a7506df171e650b16174b0b853111d4d9e96224e6494bad76bd105"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.39/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "ecad1d9ab2c27a6b493b6b25462be5464c14d2b40cb0ad431d56b66447efb80d"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "merod"
  end

  test do
    assert_match "Merod CLI", shell_output("#{bin}/merod --help")
  end
end
