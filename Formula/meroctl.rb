class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.5.0"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.5.0/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "d7979e44dbf1dc0da4e85f14b9f3eb3ceca7ebc8caf91d9c80f5a881a4d67748"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.5.0/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "b1ccb01c6a6ddf790699d2a21fbf1c8abe4f55e8e006afb76e619244a48ef871"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.5.0/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "9cc7914f5c26c17e09208f284577fef0c01ee2dad353a4655c43028d9483a979"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.5.0/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "cb69c23f91c7f8c57586f40b6f72b7b610a597cf2f9ccd95dd0877d55b4baaf1"
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
