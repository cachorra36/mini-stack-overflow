Rails.application.routes.draw do

	root 'questions#index'

	resources :questions do
		member do
			post 'upvote'
			post 'downvote'
		end

		resources :answers do
			member do
				post 'upvote'
				post 'downvote'
			end
		end
	end
end