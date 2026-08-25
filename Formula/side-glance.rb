# typed: strict
# frozen_string_literal: true

# Side Glance installs the Side Glance coding-agent attention CLI.
class SideGlance < Formula
  desc "Local-first attention cues for coding-agent terminal sessions"
  homepage "https://github.com/AndrewUlloa/side-glance"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.4/side-glance-v0.1.0-beta.4-darwin-arm64.tar.gz"
      sha256 "6722c113a01a20d42b2853e2768799057b40138f6d3422fed9bc6118eafe0e40"
    end

    on_intel do
      # Node SEA does not regularly test Intel macOS; this beta artifact is experimental.
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.4/side-glance-v0.1.0-beta.4-darwin-x64.experimental.tar.gz"
      sha256 "527dcb474278d0ebf750c029077985b0dfad5227a45dd3ff30065dbea759a061"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.4/side-glance-v0.1.0-beta.4-linux-arm64-gnu.tar.gz"
      sha256 "2d77c3214e08dd95f852d4524551329722a035eacf7e205c27b76eab23d090a0"
    end

    on_intel do
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.4/side-glance-v0.1.0-beta.4-linux-x64-gnu.tar.gz"
      sha256 "26686fe8e8c343f830e68da88e286f04ec2fa9dd1d3f86f1679eae9ba890de3b"
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
