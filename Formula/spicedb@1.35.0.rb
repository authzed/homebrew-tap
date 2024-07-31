# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class SpicedbAT1350 < Formula
  desc "Google Zanzibar-inspired permissions database for fine-grained access control"
  homepage "https://github.com/authzed/spicedb"
  version "1.35.0"
  license "Apache-2.0"

  depends_on "go" => :build

  on_macos do
    on_intel do
      url "https://github.com/authzed/spicedb/releases/download/v1.35.0/spicedb_1.35.0_darwin_amd64.tar.gz"
      sha256 "f12e823b905df7fb7ffc6eeff2a1e691af0dae541a97d2d0250c26aadb23db0b"

      def install
        if build.head?
          versionVar = "github.com/jzelinskie/cobrautil/v2.Version"
          versionCmd = "$(git describe --always --abbrev=7 --dirty --tags)"
          system "go build --ldflags '-s -w -X #{versionVar}=#{versionCmd}' ./cmd/spicedb"
        end
        bin.install "spicedb"
        generate_completions_from_executable(bin/"spicedb", "completion", shells: [:bash, :zsh, :fish])
      end
    end
    on_arm do
      url "https://github.com/authzed/spicedb/releases/download/v1.35.0/spicedb_1.35.0_darwin_arm64.tar.gz"
      sha256 "5b033a6adbb82f2e35a243f1a74859f226f229a667fa4a05413f42616171fc4c"

      def install
        if build.head?
          versionVar = "github.com/jzelinskie/cobrautil/v2.Version"
          versionCmd = "$(git describe --always --abbrev=7 --dirty --tags)"
          system "go build --ldflags '-s -w -X #{versionVar}=#{versionCmd}' ./cmd/spicedb"
        end
        bin.install "spicedb"
        generate_completions_from_executable(bin/"spicedb", "completion", shells: [:bash, :zsh, :fish])
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/authzed/spicedb/releases/download/v1.35.0/spicedb_1.35.0_linux_amd64.tar.gz"
        sha256 "a89417d3a70889179379fa07cd481ea0f37cde7b342c809bfa53ab1a1a0e8d7a"

        def install
          if build.head?
            versionVar = "github.com/jzelinskie/cobrautil/v2.Version"
            versionCmd = "$(git describe --always --abbrev=7 --dirty --tags)"
            system "go build --ldflags '-s -w -X #{versionVar}=#{versionCmd}' ./cmd/spicedb"
          end
          bin.install "spicedb"
          generate_completions_from_executable(bin/"spicedb", "completion", shells: [:bash, :zsh, :fish])
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/authzed/spicedb/releases/download/v1.35.0/spicedb_1.35.0_linux_arm64.tar.gz"
        sha256 "b8021fc657b1c5e60ff23487a76063611edb38d1b17a78d8bac78d015ff02bb9"

        def install
          if build.head?
            versionVar = "github.com/jzelinskie/cobrautil/v2.Version"
            versionCmd = "$(git describe --always --abbrev=7 --dirty --tags)"
            system "go build --ldflags '-s -w -X #{versionVar}=#{versionCmd}' ./cmd/spicedb"
          end
          bin.install "spicedb"
          generate_completions_from_executable(bin/"spicedb", "completion", shells: [:bash, :zsh, :fish])
        end
      end
    end
  end

  head "https://github.com/authzed/spicedb.git", :branch => "main"

  test do
    system "#{bin}/spicedb version"
  end
end