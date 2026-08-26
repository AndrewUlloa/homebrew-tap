# typed: strict
# frozen_string_literal: true

# Side Glance installs the Side Glance coding-agent attention CLI.
class SideGlance < Formula
  desc "Local-first attention cues for coding-agent terminal sessions"
  homepage "https://github.com/AndrewUlloa/side-glance"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.7/side-glance-v0.1.0-beta.7-darwin-arm64.tar.gz"
      sha256 "8ed3aad36eb396cfeefcf83238f5d25d53f42af1edf3a429a48c814f68f6eb95"
    end

    on_intel do
      # Node SEA does not regularly test Intel macOS; this beta artifact is experimental.
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.7/side-glance-v0.1.0-beta.7-darwin-x64.experimental.tar.gz"
      sha256 "4527eb1c4f98b6e2b38c97ec6d29cfce4cb530edec8d14f431099cdce91d4bb0"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.7/side-glance-v0.1.0-beta.7-linux-arm64-gnu.tar.gz"
      sha256 "c102023e98606e630ebbb3715f029f5877e0a10dca4d35221be0c65c46ad2eac"
    end

    on_intel do
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.7/side-glance-v0.1.0-beta.7-linux-x64-gnu.tar.gz"
      sha256 "d97b681e2e4f653ea22bec383d2b9bc7ff6d7938891dc615e5fb004a74d1cadc"
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
