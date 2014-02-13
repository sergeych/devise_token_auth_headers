module Devise
  module Strategies
    class HeaderTokenAuthenticatable < TokenAuthenticatable
      # Devise accomplishes all the work of authentication through side-effects.
      # What you see below is a much, much simpler version of how Devise's
      # strategies normally work.
      def valid?
        super or begin
          if !@header_keys
            base = mapping.to.token_authentication_key.to_s
            @header_keys = [base, "X_#{base.camelize}", "X_#{base}"].map { |x| "HTTP_#{x.upcase}" }
          end
          self.authentication_hash = {}
          self.authentication_type = :token_auth
          headers = header_values
          @header_keys.each { |key|
            if token = headers[key]
              self.authentication_hash[mapping.to.token_authentication_key] = token
              return true
            end
          }
          false
        end
      end

      private

      # def header_key
        # "HTTP_#{mapping.to.token_authentication_key.gsub('-', '_').upcase}"
      # end

      def header_values
        env.select { |k, v| k =~ /^HTTP_/ }
      end
    end
  end
end

# Overwrite the heathen basic auth / params token strategy with our kickin'-rad
# headers-only strategy.
Warden::Strategies.add(:token_authenticatable, Devise::Strategies::HeaderTokenAuthenticatable)
# Warden::Strategies.add(:token_authenticatable, Devise::Strategies::TokenAuthenticatable)
