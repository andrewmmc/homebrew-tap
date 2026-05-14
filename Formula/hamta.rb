class Hamta < Formula
  desc "Run commands through a configurable proxy environment"
  homepage "https://github.com/andrewmmc/hamta"
  url "https://github.com/andrewmmc/hamta/archive/refs/tags/1.1.1.tar.gz"
  sha256 "428e95de6d713bf72719a17aa8a13cb079c308aa2e40bbc4da8a72ce2a02d531"
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
