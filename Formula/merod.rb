class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.27"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.27/merod_aarch64-apple-darwin.tar.gz"
    sha256 "a66f828b8b22944dfbf7c43f8e67b1a8371a1fb5404abb033fd0e59fb87f97b9"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.27/merod_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.27/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "654aa30846f7d694a55e76887dd5da0310399fc335c07fe43862bc0a0f3a3195"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.27/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "d76edbe6ea615fd9e0bda4851af8963f36c37f1061ca245e8ba3cea3886df383"
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
