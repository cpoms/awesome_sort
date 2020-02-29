
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "awesome_sort/version"

Gem::Specification.new do |spec|
  spec.name          = "awesome_sort"
  spec.version       = AwesomeSort::VERSION
  spec.authors       = ["Andrei Diaconu"]
  spec.email         = ["andrei.diaconu@cpoms.co.uk"]

  spec.summary       = %q{Responsive sortable table}
  spec.description   = %q{This gem should make the creation of responsive sortable tables much easier.}
  spec.homepage      = "https://cpoms.co.uk"
  spec.license       = "MIT"
  spec.metadata      = { 
    "source_code_uri"   => "https://github.com/meritec/awesome_sort",
    "documentation_uri" => "https://github.com/meritec/awesome_sort"
  }

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "railties", ">= 3.2", "< 6.1"
  spec.add_runtime_dependency "activesupport", ">= 3.2", "< 6.1"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "minitest", "~> 5.0"
end
