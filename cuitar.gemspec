require_relative 'lib/cuitar/version'

Gem::Specification.new do |spec|
  spec.name          = 'cuitar'
  spec.version       = Cuitar::VERSION
  spec.authors       = ['Sebastian Rabuini']
  spec.email         = ['sebas@wasabit.com.ar']

  spec.summary       = 'Valida y formatea CUIT argentinas.'
  spec.description   = 'Valida y formatea CUIT argentinas.'
  spec.homepage      = 'https://github.com/srabuini/cuitar'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.3.0')

  # spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/srabuini/cuitar'

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
end
