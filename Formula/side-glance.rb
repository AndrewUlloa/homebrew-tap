# typed: strict
# frozen_string_literal: true

# Side Glance installs the Side Glance coding-agent attention CLI.
class SideGlance < Formula
  desc "Local-first attention cues for coding-agent terminal sessions"
  homepage "https://github.com/AndrewUlloa/side-glance"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0/side-glance-v0.1.0-darwin-arm64.tar.gz"
      sha256 "b84213702be8fd2d86f57a4c040f7e9e3d68fc712064575f65976b40e6310e4c"
    end

    on_intel do
      # Node SEA does not regularly test Intel macOS; this artifact is experimental.
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0/side-glance-v0.1.0-darwin-x64.experimental.tar.gz"
      sha256 "580f2a363fd8d41562fd7f841d98ac4e6bbc51e38c6230b66c3f472758fec5a9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0/side-glance-v0.1.0-linux-arm64-gnu.tar.gz"
      sha256 "9b3a8156af42984231109dcd5d05b40037494618bdefac27bf7f6f2a4a556726"
    end

    on_intel do
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0/side-glance-v0.1.0-linux-x64-gnu.tar.gz"
      sha256 "f8ac27c75f55e5ce10b623d2ada6670329a7381999d4511fa7bc913d1fb229c1"
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
