# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Zed < Formula
  desc "manage Authzed from your command line."
  homepage "https://authzed.com/"
  version "0.11.0"
  license "Apache-2.0"

  depends_on "go" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/authzed/zed/releases/download/v0.11.0/zed_0.11.0_darwin_arm64.tar.gz", using: CurlDownloadStrategy
      sha256 "bd55140bf1a468d78d59cd7ab1a92a3a0bbe9feb190e261d3a175bf6a46b46b0"

      def install
        if !File.exists? "zed"
          system "go build --ldflags \"-s -w -X github.com/jzelinskie/cobrautil/v2.Version=$(git describe --always --abbrev=7 --dirty)\" ./cmd/zed"
        end
        bin.install "zed"
        (bash_completion/"zed").write Utils.safe_popen_read("#{bin}/zed", "completion", "bash")
        (zsh_completion/"_zed").write Utils.safe_popen_read("#{bin}/zed", "completion", "zsh")
        (fish_completion/"zed.fish").write Utils.safe_popen_read("#{bin}/zed", "completion", "fish")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/authzed/zed/releases/download/v0.11.0/zed_0.11.0_darwin_amd64.tar.gz", using: CurlDownloadStrategy
      sha256 "43f65573e57e5a600a67eb57c8cf2f2d94e160a55821aa0bfd9cf39eda5575c0"

      def install
        if !File.exists? "zed"
          system "go build --ldflags \"-s -w -X github.com/jzelinskie/cobrautil/v2.Version=$(git describe --always --abbrev=7 --dirty)\" ./cmd/zed"
        end
        bin.install "zed"
        (bash_completion/"zed").write Utils.safe_popen_read("#{bin}/zed", "completion", "bash")
        (zsh_completion/"_zed").write Utils.safe_popen_read("#{bin}/zed", "completion", "zsh")
        (fish_completion/"zed.fish").write Utils.safe_popen_read("#{bin}/zed", "completion", "fish")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/authzed/zed/releases/download/v0.11.0/zed_0.11.0_linux_arm64_gnu.tar.gz", using: CurlDownloadStrategy
      sha256 "44c4004cb811e0a298eeec497cfbf3e3989823666c1de4b7d1a54c70b2348c43"

      def install
        if !File.exists? "zed"
          system "go build --ldflags \"-s -w -X github.com/jzelinskie/cobrautil/v2.Version=$(git describe --always --abbrev=7 --dirty)\" ./cmd/zed"
        end
        bin.install "zed"
        (bash_completion/"zed").write Utils.safe_popen_read("#{bin}/zed", "completion", "bash")
        (zsh_completion/"_zed").write Utils.safe_popen_read("#{bin}/zed", "completion", "zsh")
        (fish_completion/"zed.fish").write Utils.safe_popen_read("#{bin}/zed", "completion", "fish")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/authzed/zed/releases/download/v0.11.0/zed_0.11.0_linux_amd64_gnu.tar.gz", using: CurlDownloadStrategy
      sha256 "8c5a61d7541164a35dcb58aaa985bbdb48b75a5ee4b1a0c5042a6bc98579f5bf"

      def install
        if !File.exists? "zed"
          system "go build --ldflags \"-s -w -X github.com/jzelinskie/cobrautil/v2.Version=$(git describe --always --abbrev=7 --dirty)\" ./cmd/zed"
        end
        bin.install "zed"
        (bash_completion/"zed").write Utils.safe_popen_read("#{bin}/zed", "completion", "bash")
        (zsh_completion/"_zed").write Utils.safe_popen_read("#{bin}/zed", "completion", "zsh")
        (fish_completion/"zed.fish").write Utils.safe_popen_read("#{bin}/zed", "completion", "fish")
      end
    end
  end

  head "https://github.com/authzed/zed.git", :branch => "main"

  test do
    system "#{bin}/zed version"
  end
end
