require 'yaml'

log = YAML.load_file('/tmp/mry_check_rubocop_update_log.yaml')
log[:renamed].each do |before:, after:|
  raise 'before is not one' if before.size != 1
  raise 'after is not one' if after.size != 1

  puts "define_rule ['#{before.first}' => '#{after.first}']"
end
