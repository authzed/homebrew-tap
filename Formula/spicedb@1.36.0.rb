# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class SpicedbAT1360 < Formula
  desc "Google Zanzibar-inspired permissions database for fine-grained access control"
  homepage "https://github.com/authzed/spicedb"
  version "1.36.0"
  license "Apache-2.0"

  depends_on "go" => :build

  on_macos do
    on_intel do
      url "https://github.com/authzed/spicedb/releases/download/v1.36.0/spicedb_1.36.0_darwin_amd64.tar.gz"
      sha256 "c4251004a0fa6eead977aab9135cf54ea1e03f2bb0859ce6c98d04034f52d9e7"

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
      url "https://github.com/authzed/spicedb/releases/download/v1.36.0/spicedb_1.36.0_darwin_arm64.tar.gz"
      sha256 "3c0b00ed908e91feb1cca8569d2f3dec953a91ff7a9280db915362a1031808dc"

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
        url "https://github.com/authzed/spicedb/releases/download/v1.36.0/spicedb_1.36.0_linux_amd64.tar.gz"
        sha256 "d07d43054f9fd09af557c333e5038bbd3b85f70951eb35b7ac5ecd9d977c6ad1"

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
        url "https://github.com/authzed/spicedb/releases/download/v1.36.0/spicedb_1.36.0_linux_arm64.tar.gz"
        sha256 "7d023647df1161008f4d4a0394a34acb8395fbd7c102a3d577681bd1677bdb80"

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
