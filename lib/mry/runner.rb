module Mry
  module Runner
    Rewriters = {
      Gem::Version.new('0.47.0') => Rewriter_0_47_0,
      Gem::Version.new('0.46.0') => Rewriter_0_46_0,
      Gem::Version.new('0') => Rewriter_0,
    }.freeze

    class << self
      def run(files, target)
        rewriters, reverse_rewriters = *rewriters(target)

        files.each do |file|
          yaml = File.read(file)
          reverse_rewriters.each do |r|
            yaml = r.new(yaml, reverse: true).rewrite
          end
          rewriters.each do |r|
            yaml = r.new(yaml).rewrite
          end
          File.write(file, yaml)
        end
      end


      private

      # @return [Array<Array<Rewriter>>]
      def rewriters(target)
        return [(Rewriters.values + [Rewriter_Master]).reverse, []] if target == :master

        Rewriters
          .partition{|key, _value| target >= key}
          .map{|rewriters| rewriters.map{|k, v| v}.reverse}
      end
    end
  end
end
