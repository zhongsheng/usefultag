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

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]
  end

  spec.add_dependency "rails", "~> 7.0.0.rc1"
end
