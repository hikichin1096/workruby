Rails.application.routes.draw do
  get 'tclones/index'
  resources :tweets
end
