# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'turbolinks_slide/version'

Gem::Specification.new do |spec|
  spec.name          = "turbolinks_slide"
  spec.version       = TurbolinksSlide::VERSION
  spec.authors       = ["centorino"]
  spec.email         = ["lazyconsole.com@gmail.com"]
  spec.summary       = %q{Easily add a slide effect to Turbolinks page changes.}
  spec.description   = %q{Easily add a slide effect to Turbolinks page changes.}
  spec.homepage      = "http://lazyconsole.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  spec.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "turbolinks"
end
