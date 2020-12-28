Rails.application.routes.draw do
  post :user_token, to: 'user_token#create'
  resources :user 
  resources :questions
  resources :categories
  resources :quizzes
end
