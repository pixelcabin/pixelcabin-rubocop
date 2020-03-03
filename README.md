![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/pixelcabin/pixelcabin-rubocop.svg?color=green&label=gem&style=plastic)
[![Build Status](https://travis-ci.com/pixelcabin/pixelcabin-rubocop.svg?branch=master)](https://travis-ci.com/pixelcabin/pixelcabin-rubocop)

# Pixelcabin::Rubocop

Shared rubocop gem for Pixelcabin 

## Installation
Add this line to your application's Gemfile:

```ruby
source 'https://TOKEN@gem.fury.io/pixelcabin' do
  gem 'pixelcabin-rubocop', '~> 0.6.5'
end
```

The token can be found within your gemfury dashboard (under the Tokens section). Using a deploy token from the pixelcabin dashboard is preferable instead of using personal deploy tokens.

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install pxl-disco-app
```


## Usage

### console
```bash
rubocop
```
### codeclimate
Add the following lines to .codeclimate.yml for the project

```yaml
prepare:
  fetch:
    - url: 'https://raw.githubusercontent.com/pixelcabin/pixelcabin-rubocop/master/default.yml'
      path: '.rubocop.yml'
```
Remember to specify the rubocop version used as dependency for this gem in the codeclimate config
```yaml
channel: rubocop-0-79-0
```

## Installation
Add this line to your application's Gemfile:

```ruby
source 'https://gem.fury.io/pixelcabin/' do
  gem 'pixelcabin-rubocop'
end
```

And then execute:
```bash
$ bundle
```

Or install it yourself as:
```bash
$ gem install pixelcabin-rubocop
```
## Deployment

* Switch to `master` 
```bash
git checkout master
```
* Use the appropriate rake task to deploy a new gem version to Gemfury
 ```bash
    rake release:patch #bumps release version from 0.0.1 to 0.0.2
    rake release:minor #bumps release version from 0.0.1 to 0.1.0
    rake release:major #bumps release version from 0.0.1 to 1.0.0
```