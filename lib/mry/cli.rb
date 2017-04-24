module Mry
  module CLI
    class << self
      # @param argv [Array<String>]
      # @return [Integer] exit code
      def run(argv)
        parse_option(argv)
        if argv.empty?
          puts option.help
          return 1
        end
        Runner.run(argv, @target)
        return 0
      end


      private

      def parse_option(argv)
        @target = nil
        option.parse!(argv)
      end

      def option
        opt = OptionParser.new
        opt.banner = 'Usage: mry [options] [.rubocop.yml]'
        opt.on('-t=TARGET_VERSION', '--target=TARGET_VERSION') do |t|
          @target =
            if t == 'master'
              :master
            else
              Gem::Version.new(t)
            end
        end
      end
    end
  end
end
