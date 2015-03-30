Rails.application.routes.draw do
  root 'questions#index'

  resources :questions do
    member do
      post "up_vote"
      delete 'down_vote'
    end
  end

  resources :answers do
    member do
      post "up_vote"
      delete 'down_vote'
    end
  end

end
