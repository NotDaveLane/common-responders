require_relative 'lib/common/responders/version'

Gem::Specification.new do |s|
  s.name          = "common-responders"
  s.version       = Common::Responders::VERSION
  s.authors       = ["Dave Lane"]
  s.email         = ["dclane@gmail.com"]
  s.summary       = "Common responders for Rails API projects."
  s.homepage      = "https://github.com/NotDaveLane/common-responders"
  s.license       = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.required_ruby_version = '>= 2.0.0'

  s.add_dependency 'rails', '>= 5.0.0'
  s.add_dependency 'kaminari', '~> 0.16.0'
  s.add_dependency 'devise', '>= 3.2.0'
  s.add_dependency 'responders', '~> 3.0'

  s.add_development_dependency 'sqlite3'
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'capybara'
  s.add_development_dependency 'textacular'
  s.add_development_dependency 'pg'
  s.add_development_dependency 'refile', '~> 0.5.0'
  s.add_development_dependency 'omniauth', '~> 1.3.2'
  s.add_development_dependency 'omniauth-twitter'
  s.add_development_dependency 'launchy'
  s.add_development_dependency 'webmock'
  s.add_development_dependency 'aws-sdk', '< 2'
end
