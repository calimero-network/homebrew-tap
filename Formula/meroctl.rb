class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.10.0-rc.28"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.28/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "51cfc1b9bf5e009fe518478242943497d05502227e07f2ccc2ed8fca6f4066f7"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.28/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "0019dfc4b32d63c1392aa264aed2253c1e0c2fb09216f8e2cc269bbfb8bb49b5"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.28/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "df0f76b0075a8d49dfcdd8eaa7e326fc92023744f4e48dfea4f04f8898ade686"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.10.0-rc.28/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f00e89ad33bcfda31537be4a15fd9fcbb007314580026580eae4dd14cfee60a4"
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
