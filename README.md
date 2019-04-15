![GitHub tag (latest SemVer)](https://img.shields.io/github/tag/pixelcabin/pixelcabin-rubocop.svg?color=green&label=gem&style=plastic)

# Pixelcabin::Rubocop

Shared rubocop gem for Pixelcabin 

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
channel: rubocop-0-67-2
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
* Merge `dev` into `master`
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
* Push the new version tag/release to github
```bash
git push origin master
```