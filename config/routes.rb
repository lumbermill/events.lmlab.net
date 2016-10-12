Rails.application.routes.draw do

  devise_for :users, :controllers => {
    omniauth_callbacks: "omniauth_callbacks",
    registrations: "users/registrations"
  }
#  authenticated :user do
#    root to: "events#index", as: "authenticated_root"
#  end

  resources :events
  resources :reports
  resources :entries

  root 'events#root' # What's the difference between "root" and "root to:""??

  get 'events/:id/picture/:name' => 'events#show_picture', as: 'events_picture'
  get 'events_by/:id' => 'events#index_by_user', as: 'events_by'
  get 'events_pasts' => 'events#pasts', as: 'events_pasts'
  get 'events/:id/dup' => 'events#duplicate', as: 'dup_event'
end
