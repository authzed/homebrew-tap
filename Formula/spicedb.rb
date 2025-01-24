# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Spicedb < Formula
  desc "Google Zanzibar-inspired permissions database for fine-grained access control"
  homepage "https://github.com/authzed/spicedb"
  version "1.40.0"
  license "Apache-2.0"

  depends_on "go" => :build

  on_macos do
    on_intel do
      url "https://github.com/authzed/spicedb/releases/download/v1.40.0/spicedb_1.40.0_darwin_amd64.tar.gz"
      sha256 "4a2f58e259c15c031310368ec9d8323de06fc362e2d57f7d5344dc9464c35d9c"

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
      url "https://github.com/authzed/spicedb/releases/download/v1.40.0/spicedb_1.40.0_darwin_arm64.tar.gz"
      sha256 "28f8a29bcf70765986bc5660577a93780552373e95a190a0b91f6135d351f10b"

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
        url "https://github.com/authzed/spicedb/releases/download/v1.40.0/spicedb_1.40.0_linux_amd64.tar.gz"
        sha256 "0dad8f765a959237da3f18af4d7daddf34726f2e29f2848b4b9167e9bbe3f0fc"

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
        url "https://github.com/authzed/spicedb/releases/download/v1.40.0/spicedb_1.40.0_linux_arm64.tar.gz"
        sha256 "29a13e48da5f7c2af00e715f48a0f4dcc38ee66637857966846ea9a3b6e1569a"

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
