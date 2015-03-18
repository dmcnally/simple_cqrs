module SimpleCqrs
  class CommandId < ActiveRecord::Base

    def self.next(key)
      # NOTE: This not thread safe and will go wrong in production
      command_id = where(key: key).first_or_create!
      command_id.value += 1
      command_id.save!
      command_id.value
    end

  end
end
