# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{enumerable-proxy}
  s.version = "1.1.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Jacob Rothstein"]
  s.date = %q{2009-09-25}
  s.description = %q{Enumerable::Proxy is a pattern for simple block-free ruby enumeration}
  s.email = %q{jacob@stormweight.com}
  s.extra_rdoc_files = ["README"]
  s.files = ["lib/enumerable_proxy.rb", "README"]
  s.has_rdoc = false
  s.homepage = %q{http://github.com/jbr/Enumerable--Proxy}
  s.rdoc_options = ["--inline-source", "--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.0}
  s.summary = %q{Enumerable::Proxy is a pattern for simple block-free ruby enumeration}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<mime-types>, [">= 1.15"])
      s.add_runtime_dependency(%q<diff-lcs>, [">= 1.1.2"])
    else
      s.add_dependency(%q<mime-types>, [">= 1.15"])
      s.add_dependency(%q<diff-lcs>, [">= 1.1.2"])
    end
  else
    s.add_dependency(%q<mime-types>, [">= 1.15"])
    s.add_dependency(%q<diff-lcs>, [">= 1.1.2"])
  end
end