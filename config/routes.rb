# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#         new_admin_session GET    /admins/sign_in(.:format)                                                                admins/sessions#new
#             admin_session POST   /admins/sign_in(.:format)                                                                admins/sessions#create
#     destroy_admin_session POST   /admins/sign_out(.:format)                                                               admins/sessions#destroy
#        new_admin_password GET    /admins/password/new(.:format)                                                           admins/passwords#new
#       edit_admin_password GET    /admins/password/edit(.:format)                                                          admins/passwords#edit
#            admin_password PATCH  /admins/password(.:format)                                                               admins/passwords#update
#                           PUT    /admins/password(.:format)                                                               admins/passwords#update
#                           POST   /admins/password(.:format)                                                               admins/passwords#create
# cancel_admin_registration GET    /admins/cancel(.:format)                                                                 admins/registrations#cancel
#    new_admin_registration GET    /admins/sign_up(.:format)                                                                admins/registrations#new
#   edit_admin_registration GET    /admins/edit(.:format)                                                                   admins/registrations#edit
#        admin_registration PATCH  /admins(.:format)                                                                        admins/registrations#update
#                           PUT    /admins(.:format)                                                                        admins/registrations#update
#                           DELETE /admins(.:format)                                                                        admins/registrations#destroy
#                           POST   /admins(.:format)                                                                        admins/registrations#create
#          new_user_session GET    /users/sign_in(.:format)                                                                 users/sessions#new
#              user_session POST   /users/sign_in(.:format)                                                                 users/sessions#create
#      destroy_user_session POST   /users/sign_out(.:format)                                                                users/sessions#destroy
#         new_user_password GET    /users/password/new(.:format)                                                            users/passwords#new
#        edit_user_password GET    /users/password/edit(.:format)                                                           users/passwords#edit
#             user_password PATCH  /users/password(.:format)                                                                users/passwords#update
#                           PUT    /users/password(.:format)                                                                users/passwords#update
#                           POST   /users/password(.:format)                                                                users/passwords#create
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
#     lesson_bookmarks_user GET    /users/:id/lesson_bookmarks(.:format)                                                    users#lesson_bookmarks
#          own_lessons_user GET    /users/:id/own_lessons(.:format)                                                         users#own_lessons
#                     users GET    /users(.:format)                                                                         users#index
#                      user GET    /users/:id(.:format)                                                                     users#show
#       lesson_lesson_likes DELETE /lessons/:lesson_id/lesson_likes(.:format)                                               users/lesson_likes#destroy
#                           POST   /lessons/:lesson_id/lesson_likes(.:format)                                               users/lesson_likes#create
#   lesson_lesson_bookmarks DELETE /lessons/:lesson_id/lesson_bookmarks(.:format)                                           users/lesson_bookmarks#destroy
#                           POST   /lessons/:lesson_id/lesson_bookmarks(.:format)                                           users/lesson_bookmarks#create
#    lesson_lesson_comments POST   /lessons/:lesson_id/lesson_comments(.:format)                                            users/lesson_comments#create
#     lesson_lesson_comment DELETE /lessons/:lesson_id/lesson_comments/:id(.:format)                                        users/lesson_comments#destroy
#                   lessons GET    /lessons(.:format)                                                                       users/lessons#index
#                           POST   /lessons(.:format)                                                                       users/lessons#create
#                new_lesson GET    /lessons/new(.:format)                                                                   users/lessons#new
#               edit_lesson GET    /lessons/:id/edit(.:format)                                                              users/lessons#edit
#                    lesson GET    /lessons/:id(.:format)                                                                   users/lessons#show
#                           PATCH  /lessons/:id(.:format)                                                                   users/lessons#update
#                           PUT    /lessons/:id(.:format)                                                                   users/lessons#update
#                           DELETE /lessons/:id(.:format)                                                                   users/lessons#destroy
#                    search GET    /search(.:format)                                                                        users/search#search
#      lesson_comment_likes POST   /lesson_comments/:id/lesson_comment_likes(.:format)                                      users/lesson_comment_likes#create
#       lesson_comment_like DELETE /lesson_comments/:id/lesson_comment_likes(.:format)                                      users/lesson_comment_likes#destroy
#                      root GET    /                                                                                        home#top
#                     about GET    /about(.:format)                                                                         home#about
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do

  devise_for :admins, path: 'admins', controllers: { registrations: 'admins/registrations', sessions: 'admins/sessions', passwords: 'admins/passwords' }


  devise_for :users, path: 'users', controllers: { registrations: 'users/registrations', sessions: 'users/sessions', passwords: 'users/passwords' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_scope :user do
    get 'users/edit/delete_account', to: 'users/registrations#delete_account', as: :delete_account
  end

  resources :users, only: [:index, :show] do
    resource :relationships, only: [:create, :destroy]
    member do
      get :follows
      get :followers
      get :lesson_bookmarks
      get :own_lessons
    end
  end
  scope module: :users do
    resources :lessons do
    #   collection do
    #     post :new, path: :new, as: :new, action: :back
    #     post :confirm
    #   end
      resource  :lesson_likes, only: [:create, :destroy]
      resource  :lesson_bookmarks, only: [:create, :destroy]
      resources :lesson_comments, only: [:create, :destroy]
    end
  get '/search' => 'search#search'
  post 'lesson_comments/:id/lesson_comment_likes', to: 'lesson_comment_likes#create', as: 'lesson_comment_likes'
  delete 'lesson_comments/:id/lesson_comment_likes', to: 'lesson_comment_likes#destroy', as: 'lesson_comment_like'
 end

  root 'home#top'
  get '/about' => 'home#about'

end
