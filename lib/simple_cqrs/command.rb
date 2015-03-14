module SimpleCqrs::Command

  require 'active_support/concern'
  require 'active_model'
  require 'virtus'

  extend ActiveSupport::Concern
  
  included do
    include Virtus.model
    extend ActiveModel::Naming
  
    include ActiveModel::Conversion
    include ActiveModel::Validations
  end
  
  def command_name
    self.class.name.underscore
  end
  
  module ClassMethods
    def form_name(name)
      define_singleton_method(:model_name) do
        @_model_name ||= begin
          namespace = parents.find do |n|
            n.respond_to?(:use_relative_model_naming?) && n.use_relative_model_naming?
          end
          ActiveModel::Name.new(self, namespace, name)
        end
      end
    end
  end
end