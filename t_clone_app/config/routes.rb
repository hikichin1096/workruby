Rails.application.routes.draw do
  get 'tclones/index'
  resources :tclones
end
