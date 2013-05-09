devise_token_auth_headers
===================

Patches in support for token authentication via headers in addition to the basic auth or request params for Devise's `token_authenticatable` strategy.

Based on https://github.com/stvp/devise_header_token - if you need to _replace_ params/basic auth support with headers, so
token in parameters or in basic auth will not work, use it.

Usage
-----

In your Gemfile:

```ruby
gem 'devise'
gem 'devise_token_auth_headers'
```

In your `config/initializers/devise.rb`, set the authentication key as usual (or use default).

Now you can put your token in your headers. Gem generates two keys
to check in headers: source key as is was, and X-{source_key.camelize}. Of course it changes '-' to '_' and uses uppercase.

For example, if you use deault key @:auth_token@ then the header keys could be either "AUTH_TOKEN" or "X-AuthToken".

And it all should Just Work™.

