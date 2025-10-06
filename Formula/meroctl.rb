class Meroctl < Formula
  desc "Command-line tool for Calimero Network"
  homepage "https://github.com/calimero-network/core"
  version "0.8.0-rc.18"

  if OS.mac? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.18/meroctl_aarch64-apple-darwin.tar.gz"
    sha256 "adb6e5d42f7847f268f8ade4e326648a89fc0a21b326e1778c2fa940de1fd14c"
  elsif OS.mac? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.18/meroctl_x86_64-apple-darwin.tar.gz"
    sha256 "b9f2854bc23c34a2f081a5647dcca9f9e7b0fbaaf86d3e3f58aeb54534983e37"
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.18/meroctl_aarch64-unknown-linux-gnu.tar.gz"
    sha256 "374f5f2975efae24706b0072808178ebe75a9ac1495a4230260d3c7504158cb7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/calimero-network/core/releases/download/0.8.0-rc.18/meroctl_x86_64-unknown-linux-gnu.tar.gz"
    sha256 "f7336d70e5d6efc5697022627cb1d7d24b634d2eabf80e80373dd0c990007a19"
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
