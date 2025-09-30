class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.11"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.11/merod_aarch64-apple-darwin.tar.gz"
    sha256 "d1d61c3a6fa87cfe5c196d32a5f4f3a5d3df05011aa67dd4622aa3ef64f3681a"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.11/merod_x86_64-apple-darwin.tar.gz"
    sha256 "a42d5c4485896d4e5e294abea0503d73056fdbc68eacbcd5d6f802f5a42f293c"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.11/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "aa1e9c79d477fc1e7832ab9c2319254449227db189cc860cef0c5842d9af9979"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.11/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "e98a302c91324762cb784d1cf6be909b9b005056403f88f287b386e489e4695b"
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
