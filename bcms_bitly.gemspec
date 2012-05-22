$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "bcms_bitly/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.add_dependency "browsercms", "~> 3.5.0.alpha"

  s.name        = "bcms_bitly"
  s.version     = BcmsBitly::VERSION
  s.authors     = ["Josiah Ivey"]
  s.email       = ["josiah@josiahivey.net"]
  s.homepage    = "http://josiahivey.net"
  s.summary     = "Shorten page URLs through Bitly and save them."
  s.description = ""

  s.files = Dir["{app,config,db,lib}/**/*"] + ["LICENSE.txt", "Rakefile", "README.rdoc"]
  s.files -= Dir['lib/tasks/module_tasks.rake']
  s.test_files = Dir["test/**/*"]

  # Depend on BrowserCMS,rather than Rails
  # s.add_dependency "rails", "~> 3.2.3"
  # s.add_dependency "jquery-rails"

  s.add_dependency 'bitly'

  s.add_development_dependency "sqlite3"
end
