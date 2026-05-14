class Hamta < Formula
  desc "Run commands through a configurable proxy environment"
  homepage "https://github.com/andrewmmc/hamta"
  url "https://github.com/andrewmmc/hamta/archive/refs/tags/1.1.4.tar.gz"
  sha256 "e422ab858453a4b15ab22698094a385de1e6aff968db357216ce5f1ed340f022"
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
