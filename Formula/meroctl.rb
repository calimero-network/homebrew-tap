class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.4.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/meroctl-0.3.1/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "a008b46f1dedaca96a317e6bb9ca85e4d189f59be59bbfc53772b1a0503e1972"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/meroctl-0.3.1/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "73598bb383ad3c8874614261d968f4b242d93282a1c2512e7cb7a4698fe425db"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/meroctl-0.3.1/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "534d46c121da873cb4fba7e63ac93a91ac63ecd8d49ea9f3fe78e571241163e2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/meroctl-0.3.1/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "0d78abc491aa4d72c791f25e111bd9cc663b1b10cdc03cc732e5e9cf6bcbd47a"
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
