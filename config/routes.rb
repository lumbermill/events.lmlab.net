Rails.application.routes.draw do

  devise_for :users

  resources :events
  resources :reports

  root 'events#root' # What's the difference between "root" and "root to:""??

  get 'events/:id/picture' => 'events#show_picture', as: 'events_picture'
  get 'events_by/:id' => 'events#index_by_user', as: 'events_by'
end
