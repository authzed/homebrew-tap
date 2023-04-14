# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Spicedb < Formula
  desc "SpiceDB is a Zanzibar-inspired database that stores, computes, and validates application permissions."
  homepage "https://authzed.com/"
  version "1.19.1"
  license "Apache-2.0"

  depends_on "go" => :build

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/authzed/spicedb/releases/download/v1.19.1/spicedb_1.19.1_darwin_arm64.tar.gz", using: CurlDownloadStrategy
      sha256 "aef74c994a3a05f25c9c52080344e6f5aa6ecf82489a08234b8c8a8cfa2d65f4"

      def install
        if !File.exists? "spicedb"
          system "go build --ldflags \"-s -w -X github.com/jzelinskie/cobrautil/v2.Version=$(git describe --always --abbrev=7 --dirty --tags)\" ./cmd/spicedb"
        end
        bin.install "spicedb"
        (bash_completion/"spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "bash")
        (zsh_completion/"_spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "zsh")
        (fish_completion/"spicedb.fish").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "fish")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/authzed/spicedb/releases/download/v1.19.1/spicedb_1.19.1_darwin_amd64.tar.gz", using: CurlDownloadStrategy
      sha256 "40e0895cd2a362d3930ff1d0306a589273ceacf2a9ad8663dba3c38a3964070"

      def install
        if !File.exists? "spicedb"
          system "go build --ldflags \"-s -w -X github.com/jzelinskie/cobrautil/v2.Version=$(git describe --always --abbrev=7 --dirty --tags)\" ./cmd/spicedb"
        end
        bin.install "spicedb"
        (bash_completion/"spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "bash")
        (zsh_completion/"_spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "zsh")
        (fish_completion/"spicedb.fish").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "fish")
      end
    end
  end

  on_linux do
    if Hardware::CPU.arm? && Hardware::CPU.is_64_bit?
      url "https://github.com/authzed/spicedb/releases/download/v1.19.1/spicedb_1.19.1_linux_arm64.tar.gz", using: CurlDownloadStrategy
      sha256 "ea9109d6bc5b390b48410341eeaf111c8541ab9bbb9b90a28b7a312d1cc3cd43"

      def install
        if !File.exists? "spicedb"
          system "go build --ldflags \"-s -w -X github.com/jzelinskie/cobrautil/v2.Version=$(git describe --always --abbrev=7 --dirty --tags)\" ./cmd/spicedb"
        end
        bin.install "spicedb"
        (bash_completion/"spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "bash")
        (zsh_completion/"_spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "zsh")
        (fish_completion/"spicedb.fish").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "fish")
      end
    end
    if Hardware::CPU.intel?
      url "https://github.com/authzed/spicedb/releases/download/v1.19.1/spicedb_1.19.1_linux_amd64.tar.gz", using: CurlDownloadStrategy
      sha256 "ad52096cdecb2f5105cf9958c35a12d096cf32d96ab3dcd9d5571706437be902"

      def install
        if !File.exists? "spicedb"
          system "go build --ldflags \"-s -w -X github.com/jzelinskie/cobrautil/v2.Version=$(git describe --always --abbrev=7 --dirty --tags)\" ./cmd/spicedb"
        end
        bin.install "spicedb"
        (bash_completion/"spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "bash")
        (zsh_completion/"_spicedb").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "zsh")
        (fish_completion/"spicedb.fish").write Utils.safe_popen_read("#{bin}/spicedb", "completion", "fish")
      end
    end
  end

  head "https://github.com/authzed/spicedb.git", :branch => "main"

  test do
    system "#{bin}/spicedb version"
  end
end
