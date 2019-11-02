Rails.application.routes.draw do
  resources :twiclones do
    post :confirm
  end
end
