# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "nvd3-rails"
  s.version = "1.0.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 1.3.6") if s.respond_to? :required_rubygems_version=
  s.authors = ["Manuel Knie"]
  s.date = "2014-02-17"
  s.description = "This gem provides nvd3 for your Rails 3 application."
  s.email = ["manuel@adeven.com"]
  s.files = [".gitmodules", "README.md", "lib/nvd3-rails.rb", "lib/nvd3/rails.rb", "lib/nvd3/rails/engine.rb", "lib/nvd3/rails/version.rb", "nvd3-rails.gemspec", "vendor/assets/javascripts/nvd3", "vendor/assets/javascripts/nvd3-rails.js", "vendor/assets/javascripts/set-nvd3-env.js.erb", "vendor/assets/stylesheets/nvd3-rails.css"]
  s.homepage = "http://adeven.com"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.25"
  s.summary = "Use nvd3 with Rails 3"

  # if s.respond_to? :specification_version then
  #   s.specification_version = 3

  #   if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
  #     s.add_runtime_dependency(%q<railties>, ["< 5.0", ">= 3.2.0"])
  #   else
  #     s.add_dependency(%q<railties>, ["< 5.0", ">= 3.2.0"])
  #   end
  # else
  #   s.add_dependency(%q<railties>, ["< 5.0", ">= 3.2.0"])
  # end
end
