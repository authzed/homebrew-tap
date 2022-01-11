# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Spicedb < Formula
  desc "SpiceDB is a Zanzibar-inspired database that stores, computes, and validates application permissions."
  homepage "https://authzed.com/"
  version "1.4.0"
  license "Apache-2.0"

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/authzed/spicedb/releases/download/v1.4.0/spicedb_1.4.0_darwin_amd64.tar.gz", :using => CurlDownloadStrategy
      sha256 "cf2d1d126a7b033ba77a25b80819dd070e1d8193ea6ea3e6ec1eb646b918a0df"

      def install
        if !File.exists? "spicedb"
          system "go build --ldflags \"-s -w -X github.com/authzed/spicedb/pkg/cmd/version.Version=$(git describe --always --abbrev=7 --dirty)\" ./cmd/spicedb"
        end
        bin.install "spicedb"
        (bash_completion/"spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "bash")
        (zsh_completion/"_spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "zsh")
        (fish_completion/"spicedb.fish").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "fish")
      end
    end
    if Hardware::CPU.arm?
      url "https://github.com/authzed/spicedb/releases/download/v1.4.0/spicedb_1.4.0_darwin_arm64.tar.gz", :using => CurlDownloadStrategy
      sha256 "c4852fa7bb3c390ec7b8c80877e9e72c8c7efe7b8ccbdb4c77de43d1a82d7fe7"

      def install
        if !File.exists? "spicedb"
          system "go build --ldflags \"-s -w -X github.com/authzed/spicedb/pkg/cmd/version.Version=$(git describe --always --abbrev=7 --dirty)\" ./cmd/spicedb"
        end
        bin.install "spicedb"
        (bash_completion/"spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "bash")
        (zsh_completion/"_spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "zsh")
        (fish_completion/"spicedb.fish").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "fish")
      end
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/authzed/spicedb/releases/download/v1.4.0/spicedb_1.4.0_linux_amd64.tar.gz", :using => CurlDownloadStrategy
      sha256 "b29c5c34e7fb90a10c2986244480ebeafce32d81d0c1762c6688c80bac40aa97"

      def install
        if !File.exists? "spicedb"
          system "go build --ldflags \"-s -w -X github.com/authzed/spicedb/pkg/cmd/version.Version=$(git describe --always --abbrev=7 --dirty)\" ./cmd/spicedb"
        end
        bin.install "spicedb"
        (bash_completion/"spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "bash")
        (zsh_completion/"_spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "zsh")
        (fish_completion/"spicedb.fish").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "fish")
      end
    end
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/authzed/spicedb/releases/download/v1.4.0/spicedb_1.4.0_linux_arm64.tar.gz", :using => CurlDownloadStrategy
      sha256 "b13cca09f5666521c281bea19b7eb6f95653defc8af08c8a0202d4a68b3156d8"

      def install
        if !File.exists? "spicedb"
          system "go build --ldflags \"-s -w -X github.com/authzed/spicedb/pkg/cmd/version.Version=$(git describe --always --abbrev=7 --dirty)\" ./cmd/spicedb"
        end
        bin.install "spicedb"
        (bash_completion/"spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "bash")
        (zsh_completion/"_spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "zsh")
        (fish_completion/"spicedb.fish").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "fish")
      end
    end
  end

  head "https://github.com/authzed/spicedb.git", :branch => "main"

  depends_on "go" => :build

  test do
    system "#{bin}/spicedb version"
  end
end
