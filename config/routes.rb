Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'cocktails#index'
  resources :cocktails, only: %i[show new create] do
    resources :doses, only: %w[create]
  end
  delete 'doses/:id', to: 'doses#destroy', as: :delete
end
