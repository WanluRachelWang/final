Rails.application.routes.draw do
  root 'users#index'

  ##### Sign Up and Sign In and Sign Out
  get "/signup" => 'users#new'
  post "/users" => 'users#create'
  
  get "/logout" => 'sessions#delete'
  get "/login" => 'sessions#new'
  post '/sessions' => 'sessions#create'
  #########################################################
  # The "Golden 7" for accessing the "posts" resource

  get '/posts/new' => 'posts#new', as: 'new_post'
  get '/posts' => 'posts#index', as: 'posts'

  post '/posts' => 'posts#create'
  
  #no page for single post
  #get '/posts/:id' => 'posts#show', as: 'post'

  #posts can not be re-edit and update
  #get '/posts/:id/edit' => 'posts#edit', as: 'edit_posts'
  #patch '/posts/:id' => 'movies#posts'

  delete '/posts/:id' => 'posts#destroy'

  #########################################################
  # The "Golden 7" for accessing the "users" resource

  #get '/users/new' => 'users#new', as: 'new_user'

  #no users page, there is only page for single user
  get '/users' => 'users#index'#, as: 'users'
  
  #for register
  #post '/users' => 'users#create'

  #index page for a single user
  get '/users/:id' => 'users#show', as: 'user'

  get '/users/:id/edit' => 'users#edit', as: 'edit_user'
  patch '/users/:id' => 'users#update'

  delete '/users/:id' => 'users#destroy'

  #########################################################
  # The "Golden 7" for accessing the "restaurant" resource

  #no new

  #shows a list of restaurant according to get params
  get '/restaurants' => 'restaurants#index', as: 'restaurants'
  get '/restaurants/data' => 'restaurants#get_by_geoLocation'
  #no create

  #for a single resataurant
  get '/restaurants/:id' => 'restaurants#show', as: 'restaurant'

  #no edit,update and destroy

end
