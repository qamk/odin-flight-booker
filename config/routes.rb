Rails.application.routes.draw do
  root 'flights#index'
  resources :flights do
    resources :bookings, shallow: true, except: %i[index update edit delete]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
