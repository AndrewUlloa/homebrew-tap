# typed: strict
# frozen_string_literal: true

# Side Glance installs the Side Glance coding-agent attention CLI.
class SideGlance < Formula
  desc "Local-first attention cues for coding-agent terminal sessions"
  homepage "https://github.com/AndrewUlloa/side-glance"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.6/side-glance-v0.1.0-beta.6-darwin-arm64.tar.gz"
      sha256 "c02f9e953a0361a8cc0e5008dc19261a0c9e5112503a80961b67e3dbe7da2878"
    end

    on_intel do
      # Node SEA does not regularly test Intel macOS; this beta artifact is experimental.
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.6/side-glance-v0.1.0-beta.6-darwin-x64.experimental.tar.gz"
      sha256 "8439dc8c3e47e0eccfd5ea315a58f218b31e233506700e1f2675d8b41c66b816"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.6/side-glance-v0.1.0-beta.6-linux-arm64-gnu.tar.gz"
      sha256 "49a7527ccde02900d4c8e6fc06cc13f182ae1fa4811de2a3183307be42b50534"
    end

    on_intel do
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.6/side-glance-v0.1.0-beta.6-linux-x64-gnu.tar.gz"
      sha256 "51c6a0ffec8f8f0b9e7696d89bf3f56c79c45b0a5c36e65d63f3d4b264b4b39d"
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
