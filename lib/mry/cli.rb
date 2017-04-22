module Mry
  module CLI
    class << self
      # @param argv [Array<String>]
      # @return [Integer] exit code
      def run(argv)
        target = parse_option(argv)
        Runner.run(argv, target)
        return 0
      end


      private

      def parse_option(argv)
        target = Gem::Version.new('10000000000000000000')
        opt = OptionParser.new
        opt.on('-t=TARGET_VERSION', '--target=TARGET_VERSION') do |t|
          target = Gem::Version.new(t)
        end
        opt.parse!(argv)

        return target
      end
    end
  end
end
