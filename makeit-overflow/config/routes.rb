Rails.application.routes.draw do

	root 'questions#index'

	resources :questions do
		member do
			post 'upvote'
			delete 'downvote'
		end
	end
	resources :answers do
		member do
			post 'upvote'
			delete 'downvote'
		end

end