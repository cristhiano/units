# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name          = 'units'
  s.version       = '0.0.1'
  s.date          = '2015-10-19'
  s.summary       = 'Units'
  s.description   = 'Units is a simple tool to convert units'
  s.authors       = ['Cristhiano Figueira']
  s.email         = 'crs@uw3.co'
  s.files         = 'git ls-files'.split($/)
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ['lib']
  s.homepage      = 'https://github.com/mig-snr/units'
  s.license       = 'MIT'

  s.add_development_dependency 'test-unit', '~>3.1.5'
end
