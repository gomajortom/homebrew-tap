class Majortom < Formula
  desc "Major Tom — AI agent orchestration CLI"
  homepage "https://gomajortom.com"
  version "0.1.1"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://assets.gomajortom.com/downloads/cli/v#{version}/majortom-darwin-arm64-v#{version}.tar.gz"
      sha256 "6d0b47a0780e3585c87cfe1983dd4a912bcc1cf5e01e93cd639af68be0948610"
    else
      url "https://assets.gomajortom.com/downloads/cli/v#{version}/majortom-darwin-x64-v#{version}.tar.gz"
      sha256 "1cb0898dddcb1018890687a42e3119d43678382734eb5204451cb45c950a7157"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://assets.gomajortom.com/downloads/cli/v#{version}/majortom-linux-arm64-v#{version}.tar.gz"
      sha256 "509b4b50a964aa4b3351fb8cac09361852cdb4c4f0d8c88a21fd305e368bcf0f"
    else
      url "https://assets.gomajortom.com/downloads/cli/v#{version}/majortom-linux-x64-v#{version}.tar.gz"
      sha256 "e03aba7cbd9cdc339f63b65514f54711755c8fe087dfcd78b1df5c5d30438a1d"
    end
  end

  def install
    bin.install "tom"
    bin.install "daemon"
  end

  def caveats
    <<~EOS
      Get started:
        tom daemon start -d
        tom daemon status
    EOS
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/tom --version")
  end
end
