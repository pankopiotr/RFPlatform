Rails.application.routes.draw do
  resources :training_modules, only: %i(index) do
    collection do
      get 'top10'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
