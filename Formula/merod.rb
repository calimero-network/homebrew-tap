class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.24"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.24/merod_aarch64-apple-darwin.tar.gz"
    sha256 "30aaea38132d5a53a189fbe08c479863281325b63c1a44934190226c244dc7ab"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.24/merod_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.24/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "eb840f043a8bb53436b6b7bedb6966c72bcfafd0d7b37f594ac91b397d22a123"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.24/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "b432b1c62958c5c65cb45ba900c899c302fa9e3c3410e55af7f34cb8806ac6e9"
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
