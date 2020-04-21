$:.push File.expand_path("lib", __dir__)

# Maintain your gem's version:
require "usefultag/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |spec|
  spec.name        = "usefultag"
  spec.version     = Usefultag::VERSION
  spec.authors     = ["zhong sheng"]
  spec.email       = ["nily.zhong@gmail.com"]
  spec.homepage    = "https://github.com/zhongsheng/usefultag"
  spec.summary     = "Usefultag"
  spec.description = "Manage tags"
  spec.license     = "MIT"

  spec.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  spec.add_dependency "rails", "~> 6.0.2", ">= 6.0.2.2"

  spec.add_development_dependency "sqlite3"
end
