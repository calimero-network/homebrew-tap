class Merod < Formula
  desc "Command-line tool for Calimero Network setup"
  homepage "https://github.com/calimero-network/core"
  version "0.9.0-rc.3"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.9.0-rc.3/merod_aarch64-apple-darwin.tar.gz"
    sha256 "2787782e658660c5b73f6e336ecdb7f416dcb79fbcfbbe7c0ad8c4d7049a8f96"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.9.0-rc.3/merod_x86_64-apple-darwin.tar.gz"
    sha256 "0c76f95dc5b6835ef9d9ce0a2f8e672e521be707c4224511843b0f0f176c0771"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.9.0-rc.3/merod_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "c319f7590ec0d63eff51a4f8c704cbded8b58904c519aacea50485ca58053c90"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.9.0-rc.3/merod_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0a1d8d6d21de7c43c561cb4a5a3eaf084b8bb87bcc16c7f8624aee4af7673d70"
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
