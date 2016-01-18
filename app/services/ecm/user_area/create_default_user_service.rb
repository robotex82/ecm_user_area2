module Ecm::UserArea
  class CreateDefaultUserService < Itsf::Services::V2::Service::Base
    class Response < Itsf::Services::V2::Response::Base
      attr_accessor :user
    end

    def do_work
      response.user = create_default_user
      respond
    end

    private

    def create_default_user
      user = Ecm::UserArea::User.new(user_attributes)
      if user.save
        info 'Created default user'
      else
        error "Could not create default user. Errors: #{user.errors.full_messages.to_sentence}"
      end
      user
    end

    def user_attributes
      {
        email: 'user@example.com',
        password: 'password',
        password_confirmation: 'password',
        active: true,
        approved: true,
        confirmed: true
      }
    end
  end
end
