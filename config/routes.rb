Rails.application.routes.draw do

  devise_for :users

  resources :events
  resources :reports
  
  root 'events#root'

end
