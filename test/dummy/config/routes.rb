Rails.application.routes.draw do

  mount SimpleCqrs::Engine => "/simple_cqrs"
end
