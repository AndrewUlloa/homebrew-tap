# typed: strict
# frozen_string_literal: true

# Side Glance installs the Side Glance coding-agent attention CLI.
class SideGlance < Formula
  desc "Local-first attention cues for coding-agent terminal sessions"
  homepage "https://github.com/AndrewUlloa/side-glance"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.12/side-glance-v0.1.0-beta.12-darwin-arm64.tar.gz"
      sha256 "726ae029570b6a2b4d30e2ccbdba872051159beaf5d42d8d4b63afab4eb5ddee"
    end

    on_intel do
      # Node SEA does not regularly test Intel macOS; this beta artifact is experimental.
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.12/side-glance-v0.1.0-beta.12-darwin-x64.experimental.tar.gz"
      sha256 "34c0fb552df8903cc75c72448effc01f10315f9131515e0d4a9c0b52a4a72193"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.12/side-glance-v0.1.0-beta.12-linux-arm64-gnu.tar.gz"
      sha256 "02979b709f5a4df74d3deb0aced66c12c83eee19a27bcba9c9c8cb54e847b165"
    end

    on_intel do
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.12/side-glance-v0.1.0-beta.12-linux-x64-gnu.tar.gz"
      sha256 "8e2442904fd596214ba49071f4304058652b4d2a539c6e6bcbd8ff60ee14ee36"
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
