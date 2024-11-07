# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Zed < Formula
  desc "command-line client for managing SpiceDB"
  homepage "https://github.com/authzed/zed"
  version "0.23.0"
  license "Apache-2.0"

  depends_on "go" => :build

  on_macos do
    on_intel do
      url "https://github.com/authzed/zed/releases/download/v0.23.0/zed_0.23.0_darwin_amd64.tar.gz"
      sha256 "1c1b5291f9567d8c8d6182093d9a69474c05c5f85f71885675de572e2f03b738"

      def install
        if build.head?
            versionVar = "github.com/jzelinskie/cobrautil/v2.Version"
            versionCmd = "$(git describe --always --abbrev=7 --dirty --tags)"
            system "go build --ldflags '-s -w -X #{versionVar}=#{versionCmd}' ./cmd/zed"
        end
        bin.install "zed"
        generate_completions_from_executable(bin/"zed", "completion", shells: [:bash, :zsh, :fish])
      end
    end
    on_arm do
      url "https://github.com/authzed/zed/releases/download/v0.23.0/zed_0.23.0_darwin_arm64.tar.gz"
      sha256 "5653d39a2efa113a5e453ad719c465a680e47f58255d3de99ab0ea66609c550b"

      def install
        if build.head?
            versionVar = "github.com/jzelinskie/cobrautil/v2.Version"
            versionCmd = "$(git describe --always --abbrev=7 --dirty --tags)"
            system "go build --ldflags '-s -w -X #{versionVar}=#{versionCmd}' ./cmd/zed"
        end
        bin.install "zed"
        generate_completions_from_executable(bin/"zed", "completion", shells: [:bash, :zsh, :fish])
      end
    end
  end

  on_linux do
    on_intel do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/authzed/zed/releases/download/v0.23.0/zed_0.23.0_linux_amd64_gnu.tar.gz"
        sha256 "8dafa3382bfc36b8fea4330624a1027cc4dac49382527ba92f23e94843ab4b36"

        def install
          if build.head?
              versionVar = "github.com/jzelinskie/cobrautil/v2.Version"
              versionCmd = "$(git describe --always --abbrev=7 --dirty --tags)"
              system "go build --ldflags '-s -w -X #{versionVar}=#{versionCmd}' ./cmd/zed"
          end
          bin.install "zed"
          generate_completions_from_executable(bin/"zed", "completion", shells: [:bash, :zsh, :fish])
        end
      end
    end
    on_arm do
      if Hardware::CPU.is_64_bit?
        url "https://github.com/authzed/zed/releases/download/v0.23.0/zed_0.23.0_linux_arm64_gnu.tar.gz"
        sha256 "e251e93b0ab97d4acf504910f995fd59922b0b94e3057e55fbc3bfbd31ad7828"

        def install
          if build.head?
              versionVar = "github.com/jzelinskie/cobrautil/v2.Version"
              versionCmd = "$(git describe --always --abbrev=7 --dirty --tags)"
              system "go build --ldflags '-s -w -X #{versionVar}=#{versionCmd}' ./cmd/zed"
          end
          bin.install "zed"
          generate_completions_from_executable(bin/"zed", "completion", shells: [:bash, :zsh, :fish])
        end
      end
    end
  end

  head "https://github.com/authzed/zed.git", :branch => "main"

  test do
    system "#{bin}/zed version"
  end
end
