
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pixelcabin/rubocop/version"

Gem::Specification.new do |spec|
  spec.name          = "pixelcabin-rubocop"
  spec.version       = Pixelcabin::Rubocop::VERSION
  spec.authors       = ["Anirvan"]
  spec.email         = ["anirvan@pixelcabin.io"]

  spec.summary       = "Write a short summary, because RubyGems requires one."
  # spec.description   = %Write a longer description or delete this line.}
  # spec.homepage      = "Add gem's website or public repo URL here."

  spec.required_ruby_version = '~> 2.4.1'

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.require_paths = ["lib"]

  spec.add_dependency "rubocop", "~> 0.63.0"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  s.add_development_dependency 'bump', '~> 0.7.0'
end
