namespace :ecm do
  namespace :user_area do
    desc 'Creates default user: user@example.com/password'
    task create_default_user: :environment do
      if Rails.env.production?
        p 'WARNING: Creating an example user on production is a security flaw. Be sure to change credentails ASAP!'
      end
      user = User.new(email: 'user@example.com', password: 'password', password_confirmation: 'password')

      if user.save
        user.confirm
        puts "Created user #{user.email}"
      else
        puts "Could not create user. Errors: #{user.errors.full_messages.to_sentence}"
      end
    end

    desc 'Deletes (destroys) default user: user@example.com'
    task delete_default_user: :environment do
      user = User.where(email: 'user@example.com').first

      unless user.present?
        puts('Could not find default user (user@example.com)') && next
      end

      if user.destroy
        puts "Deleted user #{user.email}"
      else
        puts "Could not destroy user. Errors: #{user.errors.full_messages.to_sentence}"
      end
    end
  end
end
