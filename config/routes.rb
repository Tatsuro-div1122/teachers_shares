# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#         new_admin_session GET    /admins/sign_in(.:format)                                                                admins/sessions#new
#             admin_session POST   /admins/sign_in(.:format)                                                                admins/sessions#create
#     destroy_admin_session DELETE /admins/sign_out(.:format)                                                               admins/sessions#destroy
#        new_admin_password GET    /admins/password/new(.:format)                                                           devise/passwords#new
#       edit_admin_password GET    /admins/password/edit(.:format)                                                          devise/passwords#edit
#            admin_password PATCH  /admins/password(.:format)                                                               devise/passwords#update
#                           PUT    /admins/password(.:format)                                                               devise/passwords#update
#                           POST   /admins/password(.:format)                                                               devise/passwords#create
# cancel_admin_registration GET    /admins/cancel(.:format)                                                                 devise/registrations#cancel
#    new_admin_registration GET    /admins/sign_up(.:format)                                                                devise/registrations#new
#   edit_admin_registration GET    /admins/edit(.:format)                                                                   devise/registrations#edit
#        admin_registration PATCH  /admins(.:format)                                                                        devise/registrations#update
#                           PUT    /admins(.:format)                                                                        devise/registrations#update
#                           DELETE /admins(.:format)                                                                        devise/registrations#destroy
#                           POST   /admins(.:format)                                                                        devise/registrations#create
#          new_user_session GET    /users/sign_in(.:format)                                                                 users/sessions#new
#              user_session POST   /users/sign_in(.:format)                                                                 users/sessions#create
#      destroy_user_session DELETE /users/sign_out(.:format)                                                                users/sessions#destroy
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
#              admins_users GET    /admins/users(.:format)                                                                  admins/users#index
#               admins_user GET    /admins/users/:id(.:format)                                                              admins/users#show
#                           PATCH  /admins/users/:id(.:format)                                                              admins/users#update
#                           PUT    /admins/users/:id(.:format)                                                              admins/users#update
#            admins_lessons GET    /admins/lessons(.:format)                                                                admins/lessons#index
#        edit_admins_lesson GET    /admins/lessons/:id/edit(.:format)                                                       admins/lessons#edit
#             admins_lesson GET    /admins/lessons/:id(.:format)                                                            admins/lessons#show
#                           DELETE /admins/lessons/:id(.:format)                                                            admins/lessons#destroy
#     admins_lesson_comment DELETE /admins/lesson_comments/:id(.:format)                                                    admins/lesson_comments#destroy
#          admins_admin_top GET    /admins/home/admin_top(.:format)                                                         admins/home#admin_top
#        user_relationships DELETE /users/:user_id/relationships(.:format)                                                  users/relationships#destroy
#                           POST   /users/:user_id/relationships(.:format)                                                  users/relationships#create
#              follows_user GET    /users/:id/follows(.:format)                                                             users/users#follows
#            followers_user GET    /users/:id/followers(.:format)                                                           users/users#followers
#     lesson_bookmarks_user GET    /users/:id/lesson_bookmarks(.:format)                                                    users/users#lesson_bookmarks
#          own_lessons_user GET    /users/:id/own_lessons(.:format)                                                         users/users#own_lessons
#                     users GET    /users(.:format)                                                                         users/users#index
#                      user GET    /users/:id(.:format)                                                                     users/users#show
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
#                      root GET    /                                                                                        users/home#top
#                     about GET    /about(.:format)                                                                         users/home#about
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do

  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  devise_for :users,  controllers: { registrations: 'users/registrations', sessions: 'users/sessions' }

  devise_scope :user do
    get 'users/edit/delete_account', to: 'users/registrations#delete_account', as: :delete_account
  end

  namespace :admins do
    resources :users, only: [:index, :show, :update]
    resources :lessons, only: [:index, :show, :edit, :destroy]
    resources :lesson_comments, only: [:destroy]
    get 'home/admin_top', as: :admin_top
    get '/search', to: 'search#search'
  end

  scope module: :users do
    resources :users, only: [:index, :show] do
      resource :relationships, only: [:create, :destroy]
      member do
        get :follows
        get :followers
        get :lesson_bookmarks
        get :own_lessons
      end
    end
    resources :lessons do
      #   collection do
      #     post :new, path: :new, as: :new, action: :back
      #     post :confirm
      #   end
        resource  :lesson_likes,      only: [:create, :destroy]
        resource  :lesson_bookmarks,  only: [:create, :destroy]
        resources :lesson_comments,   only: [:create, :destroy]
    end

    get     '/search' => 'search#search'
    post    'lesson_comments/:id/lesson_comment_likes', to: 'lesson_comment_likes#create', as: 'lesson_comment_likes'
    delete  'lesson_comments/:id/lesson_comment_likes', to: 'lesson_comment_likes#destroy', as: 'lesson_comment_like'
    root  'home#top'
    get   '/about' => 'home#about'
  end


end
