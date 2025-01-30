class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.3.1"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/meroctl-0.3.1/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "4397d7378e6b9aa53557dbbce58c1d6c41bbc452a74f092233fff34ac3e47020"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/meroctl-0.3.1/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "35938b21b181842e8d085754ba0c01b6be93d1881a26427e313c928a065b2efd"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/meroctl-0.3.1/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "bdbc5028ab2b235a9f541e55774af4b2dac18ed2f8a08746316dc915fee41691"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/meroctl-0.3.1/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "75c1a9ea804d042bc8a659064a3243f219bd9e8f60d96f613b9bcd9598be5963"
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
