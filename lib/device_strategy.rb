module Devise
  module Strategies
    class RemoteAuthenticatable < Authenticatable
      def authenticate!
        p "..RemoteAuthenticatable....."
        auth_params = authentication_hash
        p "...auth_params.."
        p auth_params
        auth_params[:password] = password
        resource = mapping.to.new
        return fail! unless resource

        if validate(resource){ resource.remote_authentication(auth_params) }
          success!(resource)
        end
      end

    end
  end
end