# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#                      root GET    /                                                                                        home#top
#          new_user_session GET    /users/sign_in(.:format)                                                                 users/sessions#new
#              user_session POST   /users/sign_in(.:format)                                                                 users/sessions#create
#      destroy_user_session POST   /users/sign_out(.:format)                                                                users/sessions#destroy
#         new_user_password GET    /users/password/new(.:format)                                                            devise/passwords#new
#        edit_user_password GET    /users/password/edit(.:format)                                                           devise/passwords#edit
#             user_password PATCH  /users/password(.:format)                                                                devise/passwords#update
#                           PUT    /users/password(.:format)                                                                devise/passwords#update
#                           POST   /users/password(.:format)                                                                devise/passwords#create
#  cancel_user_registration GET    /users/cancel(.:format)                                                                  users/registrations#cancel
#     new_user_registration GET    /users/sign_up(.:format)                                                                 users/registrations#new
#    edit_user_registration GET    /users/edit(.:format)                                                                    users/registrations#edit
#         user_registration PATCH  /users(.:format)                                                                         users/registrations#update
#                           PUT    /users(.:format)                                                                         users/registrations#update
#                           DELETE /users(.:format)                                                                         users/registrations#destroy
#                           POST   /users(.:format)                                                                         users/registrations#create
#            delete_account GET    /users/edit/delete_account(.:format)                                                     users/registrations#delete_account
#        user_relationships DELETE /users/:user_id/relationships(.:format)                                                  relationships#destroy
#                           POST   /users/:user_id/relationships(.:format)                                                  relationships#create
#              follows_user GET    /users/:id/follows(.:format)                                                             users#follows
#            followers_user GET    /users/:id/followers(.:format)                                                           users#followers
#                     users GET    /users(.:format)                                                                         users#index
#                      user GET    /users/:id(.:format)                                                                     users#show
#        lesson_lesson_like DELETE /lessons/:lesson_id/lesson_like(.:format)                                                lesson_likes#destroy
#                           POST   /lessons/:lesson_id/lesson_like(.:format)                                                lesson_likes#create
#                   lessons GET    /lessons(.:format)                                                                       lessons#index
#                           POST   /lessons(.:format)                                                                       lessons#create
#                new_lesson GET    /lessons/new(.:format)                                                                   lessons#new
#               edit_lesson GET    /lessons/:id/edit(.:format)                                                              lessons#edit
#                    lesson GET    /lessons/:id(.:format)                                                                   lessons#show
#                           PATCH  /lessons/:id(.:format)                                                                   lessons#update
#                           PUT    /lessons/:id(.:format)                                                                   lessons#update
#                           DELETE /lessons/:id(.:format)                                                                   lessons#destroy
#                home_about GET    /home/about(.:format)                                                                    home#about
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

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

  resources :lessons do
  #   collection do
  #     post :new, path: :new, as: :new, action: :back
  #     post :confirm
  #   end
    resource :lesson_like, only: [:create, :destroy]
  end


  get 'home/about'

end
