require_relative 'lib/sentiment_al/version'

Gem::Specification.new do |spec|
  spec.name          = "sentiment-all"
  spec.version       = SentimentAl::VERSION
  spec.authors       = ["Armando Alejandre"]
  spec.email         = ["armando1339@gmail.com"]

  spec.summary       = %q{Sentiment Analysis Service.}
  spec.description   = %q{sentiment-al is Sentiment Analysis Service that allow the analysis of text throught SENTIM-API.}
  spec.homepage      = "https://github.com/armando1339"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org/"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/armando1339/sentiment-all"
  # spec.metadata["changelog_uri"] = "Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # => Development
  spec.add_development_dependency "pry", "~> 0.13.1"
  spec.add_development_dependency "coveralls"
end
