# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Zed < Formula
  desc "manage Authzed from your command line."
  homepage "https://authzed.com/"
  version "0.6.0"
  license "Apache-2.0"

  depends_on "go" => :build

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/authzed/zed/releases/download/v0.6.0/zed_0.6.0_darwin_amd64.tar.gz", using: CurlDownloadStrategy
      sha256 "53d92d20fdf478caf155e4024e3e1c0f1fcb58ccc41a3311256bca471a524eb5"

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
    if Hardware::CPU.arm?
      url "https://github.com/authzed/zed/releases/download/v0.6.0/zed_0.6.0_darwin_arm64.tar.gz", using: CurlDownloadStrategy
      sha256 "96ec315ccfe1973ce03d202b07c7f17d80fc02150e960ff56da2715ff492098d"

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
      url "https://github.com/authzed/zed/releases/download/v0.6.0/zed_0.6.0_linux_arm64_gnu.tar.gz", using: CurlDownloadStrategy
      sha256 "577fb36b7e1f9bbb262a99ff63b56eda68e5eb7df2fa326939a4cfdb86efbcc7"

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
      url "https://github.com/authzed/zed/releases/download/v0.6.0/zed_0.6.0_linux_amd64_gnu.tar.gz", using: CurlDownloadStrategy
      sha256 "3569676cb45e022c585dd6935aaf82d2a8e83d2375f0702af9df803480983032"

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

  test do
    system "#{bin}/zed version"
  end
end
