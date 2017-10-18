module Mry
  module Runner
    class << self
      def run(files, to: , from:)
        rewriters, reverse_rewriters = *Rewriters.rewriters(to)

        files.each do |file|
          yaml = File.read(file)
          reverse_rewriters.each do |r|
            yaml = r.new(yaml, reverse: true).rewrite
          end
          rewriters.each do |r|
            yaml = r.new(yaml).rewrite
          end
          yaml += added_cops(from: from, to: to) if from
          File.write(file, yaml)
        end
      end

      private

      def added_cops(from:, to:)
        yaml = AddedCops.added_cops_yaml(from: from, to: to)

        <<~MESSAGE.rstrip + "\n"


          # The following cops are added between #{from} and #{to}.
          # The configurations are default.
          # If you want to use a cop by default, remove a configuration for the cop from here.
          # If you want to disable a cop, change `Enabled` to false.

          #{yaml}
        MESSAGE
      end
    end
  end
end
