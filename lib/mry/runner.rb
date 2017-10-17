module Mry
  module Runner
    class << self
      def run(files, target)
        rewriters, reverse_rewriters = *Rewriters.rewriters(target)

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
    end
  end
end
