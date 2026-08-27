# typed: strict
# frozen_string_literal: true

# Side Glance installs the Side Glance coding-agent attention CLI.
class SideGlance < Formula
  desc "Local-first attention cues for coding-agent terminal sessions"
  homepage "https://github.com/AndrewUlloa/side-glance"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.9/side-glance-v0.1.0-beta.9-darwin-arm64.tar.gz"
      sha256 "6f0d03b09241406263174e95c167383c9cb963cfca0afe6a9e9c56d4bcf17864"
    end

    on_intel do
      # Node SEA does not regularly test Intel macOS; this beta artifact is experimental.
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.9/side-glance-v0.1.0-beta.9-darwin-x64.experimental.tar.gz"
      sha256 "6e9dc3d426d1a4baed3cff33efcc7b1a4ad1342abe498f49d96deb5445010f9f"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.9/side-glance-v0.1.0-beta.9-linux-arm64-gnu.tar.gz"
      sha256 "ffe9d14277932baf3f91d2c3d0c77a906862cc7613b795b2a0f439f31b42fd57"
    end

    on_intel do
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.9/side-glance-v0.1.0-beta.9-linux-x64-gnu.tar.gz"
      sha256 "de60470127214cd03302b0a44c56b887c3a77a0e1fff35c488101c0236cc2b81"
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
