Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :reads, only: [:index, :create]

   namespace :api do
    namespace :v1 do
      resources :reads, only: [:index]
    end
  end

end
