Rails.application.routes.draw do
	# get('posts',{ controller: 'posts', action: index})
	# get 'posts',  controller: 'posts', action: 'index'
	get '/posts' => 'posts#index'
	post '/posts' => 'posts#create'
	get '/posts/new' => 'posts#new', as: 'new_post'
	# new has to be placed before show because the url http://localhost:3000/posts/new will put new to id and error 
	get '/posts/:id' => 'posts#show', as: 'post'
	delete 'posts/:id' => 'posts#destroy'

	# get 'posts/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "posts#index"
  #the above line make the index to be posts/index instaed of the default rails
end
