# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name        = "devise_token_auth_headers"
  s.version     = "1.0.0"
  s.authors     = ["Sergey Chernov"]
  s.email       = ["real.sergeych@gmail.com"]
  s.homepage    = "https://github.com/sergeych/devise_token_auth_headers"
  s.summary     = "Adds header token authentication for Devise :token_authenticable strategy"
  s.description = "Patches Devise's token authentication strategy to add header-based token authentication to params/basic auth."

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "devise"
end
