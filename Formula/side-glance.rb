# typed: strict
# frozen_string_literal: true

# Side Glance installs the Side Glance coding-agent attention CLI.
class SideGlance < Formula
  desc "Local-first attention cues for coding-agent terminal sessions"
  homepage "https://github.com/AndrewUlloa/side-glance"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.5/side-glance-v0.1.0-beta.5-darwin-arm64.tar.gz"
      sha256 "510082bde94ff2603e848a15ca356ca5b810cc2f89d6e9c5c2abd833427cb275"
    end

    on_intel do
      # Node SEA does not regularly test Intel macOS; this beta artifact is experimental.
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.5/side-glance-v0.1.0-beta.5-darwin-x64.experimental.tar.gz"
      sha256 "383d27a6d337dd85acc48e740dfc738d966d9723e69557011e26fdf6b6d2d784"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.5/side-glance-v0.1.0-beta.5-linux-arm64-gnu.tar.gz"
      sha256 "42b7d136550a96c30a1460759d3b76cf6d70ad29b19db380a5ce87146b224cb1"
    end

    on_intel do
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.5/side-glance-v0.1.0-beta.5-linux-x64-gnu.tar.gz"
      sha256 "089949401d782ec77fd6610ae7b1b327b37d5f3cbb1ac69347dffb270439c155"
    end
  end

  def install
    bin.install "side-glance"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/side-glance --version").strip
    output = shell_output("#{bin}/side-glance preview --phase waiting --elapsed 60 --json")
    assert_match '"phase":"waiting"', output
  end
end
