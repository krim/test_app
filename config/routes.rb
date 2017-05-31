Rails.application.routes.draw do
  scope module: :web do
    root 'loans#index'

    resources :loans, only: %i[index show create] do
      resources :payments, only: [:create]
    end
    resources :calculators, only: [:index]
  end
end
