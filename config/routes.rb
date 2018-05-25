Rails.application.routes.draw do
  root    'static_pages#home'
  get     'about',      to: 'static_pages#about'
  get     'contact',    to: 'static_pages#contact'
  resources :events
  resources :charges
  devise_for :users, controllers: { registrations: "registrations"}
end