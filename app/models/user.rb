class User
  attr_accessor :id, :name, :email, :password, :password_confirmation
  include ActiveModel::Validations #required because some before_validations are defined in devise
  extend ActiveModel::Callbacks #required to define callbacks
  extend Devise::Models

  define_model_callbacks :validation #required by Devise
  devise :remote_authenticatable

  def self.new_with_session(params, session)
    resource = self.new
    resource.id = 1
    resource.email = params[:email]
    resource.password = params[:password]
    resource.password_confirmation = params[:password_confirmation]
    resource
  end
end