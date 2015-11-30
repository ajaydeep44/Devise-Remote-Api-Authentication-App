module Devise
  module Models
    module RemoteAuthenticatable
      extend ActiveSupport::Concern
      def remote_authentication(authentication_hash)
        p "...remote_authentication.."
        p authentication_hash
      end
      module ClassMethods
        def serialize_from_session(id)
          resource = self.new
          resource.email = id
          resource
        end

        def serialize_into_session(record)
          [record.id]
        end
      end
    end
  end
end