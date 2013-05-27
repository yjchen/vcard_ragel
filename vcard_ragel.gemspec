$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "vcard_ragel/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "vcard_ragel"
  s.version     = VCardRagel::VERSION
  s.authors     = ["Yen-Ju Chen"]
  s.email       = ["yjchenx@gmail.com"]
  s.homepage    = "https://github.org/yjchenx/vcard_ragel"
  s.summary     = "Ragel for vCard"
  s.description = s.summary

  s.files = Dir["{lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.md"]
  s.signing_key = File.join(Dir.home,'/.gem/trust/gem-private_key.pem')
  s.cert_chain = ['gem-public_cert.pem']

#  s.add_dependency "rails", "~> 3.2.11"

  s.add_development_dependency "minitest"
  s.add_development_dependency "guard"
  s.add_development_dependency "guard-shell"
end
