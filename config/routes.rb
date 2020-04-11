Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json } do
    resources :sessions, only: [:create]
    resources :users, only: [:show, :create] do
      resources :vitals, only: [:index, :create]
    end
  end
end
