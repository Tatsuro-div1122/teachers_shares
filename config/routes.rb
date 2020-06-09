Rails.application.routes.draw do

  root 'home#top'

  devise_for :users, controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get 'users/edit/delete_account' => 'users/registrations#delete_account', as: :delete_account
  end

  resources :users, only: [:index, :show] do
    resource :relationships, only: [:create, :destroy]
    get :follows,   on: :member
    get :followers, on: :member
  end

  resources :lessons #do
  #   collection do
  #     post :new, path: :new, as: :new, action: :back
  #     post :confirm
  #   end
  # end


  get 'home/about'

end
