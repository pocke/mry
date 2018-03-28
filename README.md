# Mry

Mry Migrates .Rubocop.Yml :muscle:


RuboCop has many many breaking changes, because it is before version 1.0.
So, if you update your RuboCop version, .rubocop.yml breaks in many cases...
This tool supports migrating `.rubocop.yml`. It automatically renames the configuration in your `.rubocop.yml` that was renamed by the updated RuboCop version. So, with this tool, you do not have to be afraid of updating RuboCop anymore!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'mry'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install mry

## Usage

Update `.rubocop.yml` to latest release:

```bash
$ mry .rubocop.yml
```

Update `.rubocop.yml` to a specified version:

```bash
$ mry --target=0.51.0 .rubocop.yml
```

And you can specify the current RuboCop version.
If you specify a new RuboCop version, mry adds cops that were added in this new RuboCop version to your `.rubocop.yml`.
With this feature, you can check new RuboCop cops with mry.

```bash
$ mry --from=0.50.0 --target=0.51.0 .rubocop.yml
$ cat .rubocop.yml
...


# The following cops are added between 0.50.0 and 0.51.0.
# The configurations are default.
# If you want to use a cop by default, remove a configuration for the cop from here.
# If you want to disable a cop, change `Enabled` to false.

# Supports --auto-correct
Gemspec/OrderedDependencies:
  Description: Dependencies in the gemspec should be alphabetically sorted.
  Enabled: true
  Include:
  - "**/*.gemspec"
  TreatCommentsAsGroupSeparators: true

# Supports --auto-correct
Lint/RedundantWithObject:
  Description: Checks for redundant `with_object`.
  Enabled: true

...
```

### Example


![Example Animation](https://cloud.githubusercontent.com/assets/4361134/25322816/8188f21a-28f5-11e7-9915-93f72034e3ea.gif)

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/pocke/mry.

## License

Copyright 2017-2018 Masataka Pocke Kuwabara

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
