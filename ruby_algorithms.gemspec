Gem::Specification.new do |s|
  s.name        = "ruby_algorithms"
  s.version     = "0.0.0"
  s.summary     = "Gem to host DSA learnings"
  s.description = "Gem to host DSA learnings"
  s.authors     = ["Toney Mathews"]
  s.email       = "toneymathews@mail.com"
  s.files       = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  s.homepage    =
    "https://rubygems.org/gems/hola"
  s.license       = "MIT"

  s.add_development_dependency("activesupport")
  s.add_development_dependency("debug")
  s.add_development_dependency("minitest")
end