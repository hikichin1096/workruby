Rails.application.routes.draw do
  resources :twiclones do
    collection do
      post :confirm
    end
  end
end
