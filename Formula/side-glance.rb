# typed: strict
# frozen_string_literal: true

# Side Glance installs the Side Glance coding-agent attention CLI.
class SideGlance < Formula
  desc "Local-first attention cues for coding-agent terminal sessions"
  homepage "https://github.com/AndrewUlloa/side-glance"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.10/side-glance-v0.1.0-beta.10-darwin-arm64.tar.gz"
      sha256 "4208739b011e0bbe3a1d68a481a1f4a7213b644bc1496ca9b566f199b14a746c"
    end

    on_intel do
      # Node SEA does not regularly test Intel macOS; this beta artifact is experimental.
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.10/side-glance-v0.1.0-beta.10-darwin-x64.experimental.tar.gz"
      sha256 "f0f57f909051d8752d4383fcda0808187c947bffae8698c855873f7adac85e80"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.10/side-glance-v0.1.0-beta.10-linux-arm64-gnu.tar.gz"
      sha256 "0e01ea2b74b7ca59da7f8a5eb5e7d4b66da68bf5879181e59ec9755959b993f5"
    end

    on_intel do
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.10/side-glance-v0.1.0-beta.10-linux-x64-gnu.tar.gz"
      sha256 "fd3dcc885c143df5b5f3e12d13071efda08fe24425c70eed13818a360f539fd6"
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
