Rails.application.routes.draw do
  resources :reminders
  resources :facilities
  resources :appointments
  resources :users
  root 'root#index'
end
