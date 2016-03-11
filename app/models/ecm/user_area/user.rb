require 'bcrypt'

module Ecm::UserArea
  class User < ActiveRecord::Base
    acts_as_authentic &Ecm::UserArea::Configuration.acts_as_authentic_options

    scope :autocomplete, ->(matcher) { where("LOWER(email) LIKE ?", "%#{matcher.downcase}%") }

    # def self.current_id=(id)
    #   Thread.current[:user_id] = id
    # end

    # def self.current_id
    #   Thread.current[:user_id]
    # end

    def as_json(options = {})
      options.reverse_merge!(style: :default)

      style = options.delete(:style)

      case style
      when :autocomplete
        { value: id, title: human, subtitle: self.inspect }
      else
        super
      end
    end

    def human
      email
    end
  end
end
