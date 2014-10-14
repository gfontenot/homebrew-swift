require 'formula'

class Swiftoff < Formula
  homepage 'https://github.com/gfontenot/swiftoff'
  url 'https://github.com/gfontenot/swiftoff.git', :tag => 1.0
  head 'https://github.com/gfontenot/swiftoff.git'

  def install
    frameworks = "#{prefix}/frameworks"
    ['bin/swiftoff', 'build.sh'].each do |file|
      inreplace file do |s|
        s.gsub! '__LIB__', frameworks
      end
    end

    system './build.sh'
    prefix.install 'frameworks'
    # prefix.install 'build/Build/Products/Debug/OptionParser.framework'
    bin.install 'bin/swiftoff'
  end
end
