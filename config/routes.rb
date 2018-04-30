Rails.application.routes.draw do
  root :to =>'top#index'

  resources :tweets do
      collection do
          post :confirm
      end
  end
end
