module Mry
  module Runner
    Rewriters = {
      Gem::Version.new('0.47.0') => Rewriter_0_47_0,
      Gem::Version.new('0.46.0') => Rewriter_0_46_0,
      Gem::Version.new('0') => Rewriter_0,
    }.freeze

    class << self
      def run(files, target)
        rewriters = Rewriters
          .select{|key, _value| target >= key}
          .values.reverse

        files.each do |file|
          yaml = File.read(file)
          rewriters.each do |r|
            yaml = r.new(yaml).rewrite
          end
          File.write(file, yaml)
        end
      end
    end
  end
end
