Rails.application.routes.draw do
  root to: 'projects#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :projects do
    resources :tickets
  end
end
