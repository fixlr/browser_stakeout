# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{browser_stakeout}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Nathan Fixler"]
  s.date = %q{2009-05-12}
  s.default_executable = %q{browser_stakeout}
  s.email = %q{nathan@fixler.org}
  s.executables = ["browser_stakeout"]
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION.yml",
    "bin/browser_stakeout",
    "lib/browser_stakeout.rb",
    "lib/browser_stakeout/application.rb",
    "lib/browser_stakeout/options.rb",
    "test/application_test.rb",
    "test/browser_stakeout_test.rb",
    "test/options_test.rb",
    "test/test_helper.rb"
  ]
  s.has_rdoc = true
  s.homepage = %q{http://github.com/fixlr/browser_stakeout}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.2}
  s.summary = %q{Like RStakeout, but for watching static web content in multiple web browsers.}
  s.test_files = [
    "test/application_test.rb",
    "test/browser_stakeout_test.rb",
    "test/options_test.rb",
    "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
