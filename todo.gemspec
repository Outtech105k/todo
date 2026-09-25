# frozen_string_literal: true

require_relative 'lib/todo/version'

Gem::Specification.new do |spec|
  spec.name = 'todo'
  spec.version = Todo::VERSION
  spec.authors = ['Outtech105k']
  spec.email = ['techno510tk@gmail.com']

  spec.summary = '%q{Todo management tool}'
  spec.description = '%q{Todo management tool created by Perfect Ruby Team.}'
  spec.homepage = 'https://gihyo.jp/'
  spec.license = 'MIT'
  spec.required_ruby_version = '>= 3.2.0'
  spec.metadata['allowed_push_host'] = 'https://example.com' # TODO: This is temporary.
  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/Outtech105k/todo'
  spec.metadata['changelog_uri'] = 'https://github.com/Outtech105k/todo/blob/main/CHANGELOG.md'

  # Uncomment the line below to require MFA for gem pushes.
  # This helps protect your gem from supply chain attacks by ensuring
  # no one can publish a new version without multi-factor authentication.
  # See: https://guides.rubygems.org/mfa-requirement-opt-in/
  # spec.metadata["rubygems_mfa_required"] = "true"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.each_line("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ Gemfile .gitignore test/ .github/ .standard.yml])
    end
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"
  spec.add_dependency 'activerecord', '~> 8.1'
  spec.add_dependency 'sqlite3', '~> 2.9'
  spec.add_development_dependency 'minitest', '~> 5.0'
  spec.add_development_dependency 'rake', '~> 13.0'
  spec.add_development_dependency 'rubocop', '~> 1.82'
  spec.add_development_dependency 'yard', '~> 0.9'

  # For more information and examples about making a new gem, check out our
  # guide at: https://guides.rubygems.org/make-your-own-gem/
end
