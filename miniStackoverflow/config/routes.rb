Rails.application.routes.draw do
  # get 'questions/index'
  root 'questions#index'
  resources :questions do
    member do
      post "up_vote"
      delete 'down_vote'
    end
  end

  resources :answers
  # post 'questions/:id/up_vote' => "questions#up_vote"
end
