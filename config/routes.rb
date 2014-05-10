Marketplace::Application.routes.draw do
  devise_for :users

  root to: "pages#home"

  resource :freelance_profile, only: [:edit, :update]
end
