Rails.application.routes.draw do
  root to: "transactions#index"

  # import cnab
  post 'import_cnab', to: "transactions#import_cnab"
  # stores
  resources :stores, only: [:index, :show]
end
