# == Route Map
#
#                    Prefix Verb   URI Pattern                                                                              Controller#Action
#      users_messages_index GET    /users/messages/index(.:format)                                                          users/messages#index
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
#              admins_users GET    /admins/users(.:format)                                                                  admins/users#index
#               admins_user GET    /admins/users/:id(.:format)                                                              admins/users#show
#                           PATCH  /admins/users/:id(.:format)                                                              admins/users#update
#                           PUT    /admins/users/:id(.:format)                                                              admins/users#update
#            admins_lessons GET    /admins/lessons(.:format)                                                                admins/lessons#index
#             admins_lesson GET    /admins/lessons/:id(.:format)                                                            admins/lessons#show
#                           DELETE /admins/lessons/:id(.:format)                                                            admins/lessons#destroy
#     admins_lesson_comment DELETE /admins/lesson_comments/:id(.:format)                                                    admins/lesson_comments#destroy
#           admins_counsels GET    /admins/counsels(.:format)                                                               admins/counsels#index
#            admins_counsel GET    /admins/counsels/:id(.:format)                                                           admins/counsels#show
#                           DELETE /admins/counsels/:id(.:format)                                                           admins/counsels#destroy
#    admins_counsel_comment DELETE /admins/counsel_comments/:id(.:format)                                                   admins/counsel_comments#destroy
#          admins_admin_top GET    /admins/home/admin_top(.:format)                                                         admins/home#admin_top
#             admins_search GET    /admins/search(.:format)                                                                 admins/search#search
#     admins_category_users GET    /admins/category/users(.:format)                                                         admins/users#category_users
#   admins_category_lessons GET    /admins/category/lessons(.:format)                                                       admins/lessons#category_lessons
#  admins_category_counsels GET    /admins/category/counsels(.:format)                                                      admins/counsels#category_counsels
#             user_messages GET    /users/:user_id/messages(.:format)                                                       users/messages#index
#                           POST   /users/:user_id/messages(.:format)                                                       users/messages#create
#              user_message DELETE /users/:user_id/messages/:id(.:format)                                                   users/messages#destroy
#        user_relationships DELETE /users/:user_id/relationships(.:format)                                                  users/relationships#destroy
#                           POST   /users/:user_id/relationships(.:format)                                                  users/relationships#create
#              follows_user GET    /users/:id/follows(.:format)                                                             users/users#follows
#            followers_user GET    /users/:id/followers(.:format)                                                           users/users#followers
#     lesson_bookmarks_user GET    /users/:id/lesson_bookmarks(.:format)                                                    users/users#lesson_bookmarks
#          own_lessons_user GET    /users/:id/own_lessons(.:format)                                                         users/users#own_lessons
#         own_counsels_user GET    /users/:id/own_counsels(.:format)                                                        users/users#own_counsels
#       delete_account_user GET    /users/:id/delete_account(.:format)                                                      users/users#delete_account
#                           PATCH  /users/:id/delete_account(.:format)                                                      users/users#update_account
#                     users GET    /users(.:format)                                                                         users/users#index
#                 edit_user GET    /users/:id/edit(.:format)                                                                users/users#edit
#                      user GET    /users/:id(.:format)                                                                     users/users#show
#                           PATCH  /users/:id(.:format)                                                                     users/users#update
#                           PUT    /users/:id(.:format)                                                                     users/users#update
#           confirm_lessons GET    /lessons/confirm(.:format)                                                               users/lessons#confirm
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
#  counsel_counsel_comments POST   /counsels/:counsel_id/counsel_comments(.:format)                                         users/counsel_comments#create
#   counsel_counsel_comment DELETE /counsels/:counsel_id/counsel_comments/:id(.:format)                                     users/counsel_comments#destroy
#                  counsels GET    /counsels(.:format)                                                                      users/counsels#index
#                           POST   /counsels(.:format)                                                                      users/counsels#create
#               new_counsel GET    /counsels/new(.:format)                                                                  users/counsels#new
#              edit_counsel GET    /counsels/:id/edit(.:format)                                                             users/counsels#edit
#                   counsel GET    /counsels/:id(.:format)                                                                  users/counsels#show
#                           PATCH  /counsels/:id(.:format)                                                                  users/counsels#update
#                           PUT    /counsels/:id(.:format)                                                                  users/counsels#update
#                           DELETE /counsels/:id(.:format)                                                                  users/counsels#destroy
#                      root GET    /                                                                                        users/home#top
#                     about GET    /about(.:format)                                                                         users/home#about
#                    search GET    /search(.:format)                                                                        users/search#search
#            category_users GET    /category/users(.:format)                                                                users/users#category_users
#          category_lessons GET    /category/lessons(.:format)                                                              users/lessons#category_lessons
#         category_counsels GET    /category/counsels(.:format)                                                             users/counsels#category_counsels
#      lesson_comment_likes POST   /lesson_comments/:id/lesson_comment_likes(.:format)                                      users/lesson_comment_likes#create
#       lesson_comment_like DELETE /lesson_comments/:id/lesson_comment_likes(.:format)                                      users/lesson_comment_likes#destroy
#     counsel_comment_likes POST   /counsel_comments/:id/counsel_comment_likes(.:format)                                    users/counsel_comment_likes#create
#      counsel_comment_like DELETE /counsel_comments/:id/counsel_comment_likes(.:format)                                    users/counsel_comment_likes#destroy
#        rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename(.:format)                               active_storage/blobs#show
# rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename(.:format) active_storage/representations#show
#        rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename(.:format)                              active_storage/disk#show
# update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token(.:format)                                      active_storage/disk#update
#      rails_direct_uploads POST   /rails/active_storage/direct_uploads(.:format)                                           active_storage/direct_uploads#create

Rails.application.routes.draw do

  namespace :users do
    get 'messages/index'
  end
  devise_for :admins, controllers: { sessions: 'admins/sessions' }
  devise_for :users,  controllers: {
   registrations: 'users/registrations',
   sessions: 'users/sessions'
  }


  namespace :admins do
    resources :users, only: [:index, :show, :update]
    resources :lessons, only: [:index, :show, :destroy]
    resources :lesson_comments, only: [:destroy]
    resources :counsels, only: [:index, :show, :destroy]
    resources :counsel_comments, only: [:destroy]
    get 'home', to: 'home#top'
    get 'search', to: 'search#search'
    get 'category/users', to: 'users#category_users'
    get 'category/lessons', to: 'lessons#category_lessons'
    get 'category/counsels', to: 'counsels#category_counsels'
  end

  scope module: :users do
    resources :users, only: [:index, :show, :edit, :update] do
      resources :messages,      only: [:index, :create, :destroy]
      resource  :relationships, only: [:create, :destroy]
      member do
        get :follows
        get :followers
        get :lesson_bookmarks
        get :own_lessons
        get :own_counsels
        get   'delete_account', to: 'users#delete_account'
        patch 'delete_account', to: 'users#update_account'
        delete 'delete_all_messages', to: 'messages#destroy_all'
      end
    end

    resources :lessons do
        resource  :lesson_likes,      only: [:create, :destroy]
        resource  :lesson_bookmarks,  only: [:create, :destroy]
        resources :lesson_comments,   only: [:create, :destroy]
        # collection do
        #   post 'confirm', to: 'lessons#confirm', as: :confirm
        # end
    end

    resources :counsels do
        resources :counsel_comments,   only: [:create, :destroy]
    end

    root    'home#top'
    get     'about', to: 'home#about'
    get     'search', to: 'search#search'
    get     'category/users', to: 'users#category_users'
    get     'category/lessons', to: 'lessons#category_lessons'
    get     'category/counsels', to: 'counsels#category_counsels'
    post    'lesson_comments/:id/lesson_comment_likes', to: 'lesson_comment_likes#create', as: 'lesson_comment_likes'
    delete  'lesson_comments/:id/lesson_comment_likes', to: 'lesson_comment_likes#destroy', as: 'lesson_comment_like'
    post    'counsel_comments/:id/counsel_comment_likes', to: 'counsel_comment_likes#create', as: 'counsel_comment_likes'
    delete  'counsel_comments/:id/counsel_comment_likes', to: 'counsel_comment_likes#destroy', as: 'counsel_comment_like'
  end


end
