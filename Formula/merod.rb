class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.42"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.42/merod_aarch64-apple-darwin.tar.gz"
    sha256 "b836bd199720e06818eccd918ebde4f795994cc4600f093e799cee4b4a7a0c19"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.42/merod_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.42/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c5c88b79fc5b5191003e6a94f99aec6c415a785853b8e76355f47034acdd9f1a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.42/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e9c0f5f8be364c5be9716424e7b2225ea3798c002a80afa9efaac9f521a8eda0"
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
