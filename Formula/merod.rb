class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.1/merod_aarch64-apple-darwin.tar.gz"
    sha256 "484e31513070302fba10597b517ac89ffc95fb78f02af0bb316e45f5ce5a6c74"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.1/merod_x86_64-apple-darwin.tar.gz"
    sha256 "64d4e88dc7d533293e0cc1dc37b53586b1ba6ba5bd61af4b2a6d3e4e61e93717"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.1/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "f6195886788d153959ec8d649c68f7b8af0c5501eae32c23147dec088d868152"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.1/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "463ef07d7bb6f34cb27a37e7d7c239db799c661d794958f5a2cb1dc62c5d71ca"
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
