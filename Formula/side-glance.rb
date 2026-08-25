# typed: strict
# frozen_string_literal: true

# Side Glance installs the Side Glance coding-agent attention CLI.
class SideGlance < Formula
  desc "Local-first attention cues for coding-agent terminal sessions"
  homepage "https://github.com/AndrewUlloa/side-glance"
  version "0.1.0-beta.3"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.3/side-glance-v0.1.0-beta.3-darwin-arm64.tar.gz"
      sha256 "b655d0e2c8047aa4a280d4b88efa6ee9d58c3659910b95dc94e98efa7a19a4ee"
    end

    on_intel do
      # Node SEA does not regularly test Intel macOS; this beta artifact is experimental.
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.3/side-glance-v0.1.0-beta.3-darwin-x64.experimental.tar.gz"
      sha256 "7a8a163d3990def6377d3e4f2fecad663f93981869a84bfed77bbf5c0fb04f21"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.3/side-glance-v0.1.0-beta.3-linux-arm64-gnu.tar.gz"
      sha256 "76784e99b06bb3a0ba3cb0a18a847799823a1f2a274127f39e83b9362ebcaf9f"
    end

    on_intel do
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.3/side-glance-v0.1.0-beta.3-linux-x64-gnu.tar.gz"
      sha256 "6ca1be73ff81a3caabbc47b96fb09461291d4d0ab0780a1a8482d7dd333fe4da"
    end
  end

  def install
    bin.install "side-glance"
  end

  test do
    assert_equal version.to_s, shell_output("#{bin}/side-glance --version").strip
    output = shell_output("#{bin}/side-glance preview --phase waiting --elapsed 60 --json")
    assert_match '"urgency":500', output
  end
end
