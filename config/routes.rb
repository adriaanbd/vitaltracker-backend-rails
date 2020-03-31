Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json } do
    resources :users, only: [:show, :create]
  end
end
