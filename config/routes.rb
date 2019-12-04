Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'

  #building routes
  get '/buildings', to: 'buildings#index', as: 'buildings'
  get '/buildings/new', to: 'buildings#new', as: 'new_building'
  post '/buildings', to: 'buildings#create'
  get '/buildings/:id', to: 'buildings#show', as: 'building'
  get '/buildings/:id/edit', to: 'buildings#edit', as: 'edit_building'
  patch '/buildings/:id', to: 'buildings#update'
  delete '/buildings/:id', to: 'buildings#delete'

  #tenant routes
  get '/tenants', to: 'tenants#index', as: 'tenants'
  get '/signup', to: 'tenants#new', as: 'signup'
  post '/tenants', to: 'tenants#create'
  get '/tenants/:id', to: 'tenants#show', as: 'tenant'
  get '/tenants/:id/edit', to: 'tenants#edit', as: 'edit_tenant'
  patch '/tenants/:id', to: 'tenants#update'
  delete '/tenants/:id', to: 'tenants#delete'

  #building review routes
  get '/building-reviews', to: 'building_reviews#index', as: 'building_reviews'
  get '/building-reviews/new', to: 'building_reviews#new', as: 'new_building_review'
  post '/building-reviews', to: 'building_reviews#create'
  get '/building-reviews/new-specific-review', to: 'building_reviews#new_specific_review', as: 'new_specific_building_review'
  get '/building-reviews/:id', to: 'building_reviews#show', as: 'building_review'
  get '/building-reviews/:id/edit', to: 'building_reviews#edit', as: 'edit_building_review'
  patch '/building-reviews/:id', to: 'building_reviews#update'
  delete '/building-reviews/:id', to: 'building_reviews#delete'

  #custom building review routes
  post '/specific-building-reviews', to: 'building_reviews#create_specific_review'
  post '/specific-landlord-reviews', to: 'landlord_reviews#create_specific_review'

  #welcome route
  get '/home', to: 'main#home', as: 'home'

  #landlord routes
  get '/landlords', to: 'landlords#index', as: 'landlords'
  get '/landlords/new', to: 'landlords#new', as: 'new_landlord'
  post '/landlords', to: 'landlords#create'
  get '/landlords/:id', to: 'landlords#show', as: 'landlord'
  get '/landlords/:id/edit', to: 'landlords#edit', as: 'edit_landlord'
  patch '/landlords/:id', to: 'landlords#update'
  delete '/landlords/:id', to: 'landlords#delete'

  #landlord review routes
  get '/landlord-reviews', to: 'landlord_reviews#index', as: 'landlord_reviews'
  get '/landlord-reviews/new', to: 'landlord_reviews#new', as: 'new_landlord_review'
  post '/landlord-reviews', to: 'landlord_reviews#create'
  get '/landlord-reviews/new-specific-review', to: 'landlord_reviews#new_specific_review', as: 'new_specific_landlord_review'
  get '/landlord-reviews/:id', to: 'landlord_reviews#show', as: 'landlord_review'
  get '/landlord-reviews/:id/edit', to: 'landlord_reviews#edit', as: 'edit_landlord_review'
  patch '/landlord-reviews/:id', to: 'landlord_reviews#update'
  delete '/landlord-reviews/:id', to: 'landlord_reviews#delete'

  #login routes
  get '/login', to: 'sessions#new', as: 'login'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy', as: 'logout'

end
