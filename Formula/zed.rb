# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Zed < Formula
  desc "manage Authzed from your command line."
  homepage "https://authzed.com/"
  version "0.5.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/authzed/zed/releases/download/v0.5.0/zed_0.5.0_darwin_arm64.tar.gz", :using => CurlDownloadStrategy
      sha256 "d9325beb6bbf885ff329d6f0afac5ab2dfef509b39d784c0c6b1a32d1bf37b5b"

      def install
        if !File.exists? "zed"
          system "go build --ldflags \"-s -w -X github.com/jzelinskie/cobrautil.Version=$(git describe --always --abbrev=7 --dirty)\" ./cmd/zed"
        end
        bin.install "zed"
        (bash_completion/"zed").write Utils.safe_popen_read("#{bin}/zed", "completion", "bash")
        (zsh_completion/"_zed").write Utils.safe_popen_read("#{bin}/zed", "completion", "zsh")
        (fish_completion/"zed.fish").write Utils.safe_popen_read("#{bin}/zed", "completion", "fish")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/authzed/zed/releases/download/v0.5.0/zed_0.5.0_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
      sha256 "1e99d7e03dbd3402a8ee21102e79693d9817c753ce70352031a6ec81fdb3592e"

      def install
        if !File.exists? "zed"
          system "go build --ldflags \"-s -w -X github.com/jzelinskie/cobrautil.Version=$(git describe --always --abbrev=7 --dirty)\" ./cmd/zed"
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
      url "https://github.com/authzed/zed/releases/download/v0.5.0/zed_0.5.0_linux_arm64_gnu.tar.gz", :using => CurlDownloadStrategy
      sha256 "9e513bac125c1b6f0dbc683276d3bddd4017cd2471fa6e61799b496845b96558"

      def install
        if !File.exists? "zed"
          system "go build --ldflags \"-s -w -X github.com/jzelinskie/cobrautil.Version=$(git describe --always --abbrev=7 --dirty)\" ./cmd/zed"
        end
        bin.install "zed"
        (bash_completion/"zed").write Utils.safe_popen_read("#{bin}/zed", "completion", "bash")
        (zsh_completion/"_zed").write Utils.safe_popen_read("#{bin}/zed", "completion", "zsh")
        (fish_completion/"zed.fish").write Utils.safe_popen_read("#{bin}/zed", "completion", "fish")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/authzed/zed/releases/download/v0.5.0/zed_0.5.0_linux_amd64_gnu.tar.gz", :using => CurlDownloadStrategy
      sha256 "da957e8e3286635ce4979011e687717be362e9d7179fd69ed6a1a7b9b4e049b0"

      def install
        if !File.exists? "zed"
          system "go build --ldflags \"-s -w -X github.com/jzelinskie/cobrautil.Version=$(git describe --always --abbrev=7 --dirty)\" ./cmd/zed"
        end
        bin.install "zed"
        (bash_completion/"zed").write Utils.safe_popen_read("#{bin}/zed", "completion", "bash")
        (zsh_completion/"_zed").write Utils.safe_popen_read("#{bin}/zed", "completion", "zsh")
        (fish_completion/"zed.fish").write Utils.safe_popen_read("#{bin}/zed", "completion", "fish")
      end
    end
  end

  head "https://github.com/authzed/zed.git", :branch => "main"

  depends_on "go" => :build

  test do
    system "#{bin}/zed version"
  end
end
