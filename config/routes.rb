Rails.application.routes.draw do
  post :user_token, to: 'user_token#create'
  put '/user/change_password', to: 'users#change_password'
  resource :user 
  resources :questions
  resources :categories
  resources :quizzes
end
