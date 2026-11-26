class Merod < Formula
  desc "Calimero node: runs apps, and a development cluster with merod local"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.38"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.38/merod_aarch64-apple-darwin.tar.gz"
    sha256 "3dddda591ff762ed2aa1c5dd466a2e930dec297f4d7ccb4cc554815e6bd05f27"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "merod 1.0.0-rc.38 has no Intel macOS build"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.38/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "8a4f542d547db204eae815e2bbc5e132d7b8c3ae0bba12a0d1b0e285a71c302c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.38/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "46f28febedcd1092b1fdda0872550ac4ae7d4548dfcba36e839d937a924b7006"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "merod"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/merod --version")
  end
end
