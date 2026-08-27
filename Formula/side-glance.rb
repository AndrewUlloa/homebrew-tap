# typed: strict
# frozen_string_literal: true

# Side Glance installs the Side Glance coding-agent attention CLI.
class SideGlance < Formula
  desc "Local-first attention cues for coding-agent terminal sessions"
  homepage "https://github.com/AndrewUlloa/side-glance"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.8/side-glance-v0.1.0-beta.8-darwin-arm64.tar.gz"
      sha256 "31894474d5cea271e5d4c78cd3b1cec83b533f4c648305ea61e144c6ee7e41b6"
    end

    on_intel do
      # Node SEA does not regularly test Intel macOS; this beta artifact is experimental.
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.8/side-glance-v0.1.0-beta.8-darwin-x64.experimental.tar.gz"
      sha256 "ec1b9ab52791b352a997d0ea1449252bd1da66b4e28e14075c58dd8dd09f2386"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.8/side-glance-v0.1.0-beta.8-linux-arm64-gnu.tar.gz"
      sha256 "0462e7a0ae5ae554f6f9fdfced4385e5480709f87093654e7aca3916cd9aa446"
    end

    on_intel do
      url "https://github.com/AndrewUlloa/side-glance/releases/download/v0.1.0-beta.8/side-glance-v0.1.0-beta.8-linux-x64-gnu.tar.gz"
      sha256 "76c73aff830ab9cdc206e1daed77576e3410d5931ff1c057ac49eb2a85376b44"
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
