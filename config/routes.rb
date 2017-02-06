Rails.application.routes.draw do
  resources :rents
  devise_for :users
  resources :reports
  resources :free_posts
  get 'home/top'
  root 'home#top'
  get 'settled' => 'reports#settled'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'reports/download/download'=> 'reports#download'

  get 'notification/index'
  get 'free_post_notification/index'
  get 'pc_model/index'

  resources 'pc_model', only: :index do
    collection { post :import }
  end
end
