class Hamta < Formula
  desc "Run commands through a configurable proxy environment"
  homepage "https://github.com/andrewmmc/hamta"
  url "https://github.com/andrewmmc/hamta/archive/refs/tags/1.1.0.tar.gz"
  sha256 "3b7d0f7396ebab87e272b1278c7336c89deb42922d15098e0fbbd0201ce74f56"
  license "MIT"
  head "https://github.com/andrewmmc/hamta.git", branch: "master"

  depends_on "curl"
  depends_on "jq"

  def install
    bin.install "bin/hamta"
    pkgshare.install "share/hamta/config.json"
  end

  def caveats
    <<~EOS
      Run `hamta init` to create your initial config at ~/.config/hamta/config.json.
      Edit that file to set your proxy URL and expected country.
      For proxy.mode "proxychains", install proxychains-ng separately:
        brew install proxychains-ng
    EOS
  end

  test do
    assert_match "hamta #{version}", shell_output("#{bin}/hamta --version")
  end
end
