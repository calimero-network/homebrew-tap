class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.14"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.14/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "6a90f0082223614e6a2ea89a022061495d2fad34a64ca931d7ac41decee1bbce"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.14/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "883f88d0a91486d04401f5b9f00e6a8a849699f2543d239f4a921b241cb4ad25"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.14/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c5b4a62ea86214b555a27528bc7fc2be57e2651b45afaf070a9e63af8ad57b44"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.14/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "2d550d2880594ff332b4a674889532251bd714603af8acf9bb236b9cded816c5"
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
