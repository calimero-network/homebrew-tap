class Merod < Formula
  desc "Calimero node: runs apps, and a development cluster with merod local"
  homepage "https://github.com/calimero-network/core"
  version "1.0.0-rc.29"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.29/merod_aarch64-apple-darwin.tar.gz"
    sha256 "cc670425adc99d6ef283d81af4434b2163c9c7b64030f01eafabc7e18c34790a"
  elsif OS.mac? && Hardware::CPU.intel?
    odie "merod 1.0.0-rc.29 has no Intel macOS build"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.29/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "cd76fe997c009a4e580637a43dcb17b07cce2d4912ed528dba3fd6237aa83e6b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/1.0.0-rc.29/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "840cc8e8e0938cb7dd50f3f54e8e243f4f79c2200642e48fa87ec60d8cff85e7"
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
