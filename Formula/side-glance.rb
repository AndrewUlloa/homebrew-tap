# typed: strict
# frozen_string_literal: true

# Side Glance installs the Side Glance coding-agent attention CLI.
class SideGlance < Formula
  desc "Local-first attention cues for coding-agent terminal sessions"
  homepage "https://github.com/AndrewUlloa/side-glance"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.11/side-glance-v0.1.0-beta.11-darwin-arm64.tar.gz"
      sha256 "9a2697a190aa093232d7c4d016ba5cd91d55de5bbb118fa786892f4db0874f40"
    end

    on_intel do
      # Node SEA does not regularly test Intel macOS; this beta artifact is experimental.
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.11/side-glance-v0.1.0-beta.11-darwin-x64.experimental.tar.gz"
      sha256 "964675b12212524d2fd13e517488d7a6a93bc30900f24274373621d6eb135d54"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.11/side-glance-v0.1.0-beta.11-linux-arm64-gnu.tar.gz"
      sha256 "449f4e694e0f913e7ca625204ddcf5126690f4ca46ea3db5b0157a3ba4709b18"
    end

    on_intel do
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.11/side-glance-v0.1.0-beta.11-linux-x64-gnu.tar.gz"
      sha256 "2419a63f46c7e67d3d4ced765dce94b5fbd1fdc9a3b3cb2a4878d71765947160"
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
