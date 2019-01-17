# Pixelcabin::Rubocop


## Installation

Shared Ruby style configs for pixelcabin.

```ruby
source 'https://gem.fury.io/pixelcabin/' do
  gem 'pixelcabin-rubocop', '~> 0.0.1'
end
```

And then execute:

    $ bundle

## Usage

Create a `.rubocop.yml` in the root folder with the following directives:
```yaml
inherit_gem:
  percy-style:
    - default.yml
```

Now you can run `bundle exec rubocop` to run the cops on the project.
