class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.33"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.33/merod_aarch64-apple-darwin.tar.gz"
    sha256 "82b6e67787e92928c7fa55ce2c7c083ca14ccd31dbd9f692030e7c052143e29d"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.33/merod_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.33/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "3e393d1f089f38b99234c9db2357c75d8677d187f7e53ceee6c12a95ae436b84"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.33/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "4a1e953da67c832f6adb0a7451aeab06b696f984710f37c738aa1c7a8f58795d"
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
