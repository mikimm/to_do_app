Rails.application.routes.draw do
  devise_for :users
  root to: 'tasks#index'
   resources :tasks,only: [:index,:new,:create,:destroy,:edit] do
    resources :memos,only:[:index,:new,:create,:edit,:show]
   end
end
