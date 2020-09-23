Rails.application.routes.draw do
  get 'comments/index'
  devise_for :users
end
