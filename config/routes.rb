Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

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
  get '/tenants/new', to: 'tenants#new', as: 'new_tenant'
  post '/tenants', to: 'tenants#create'
  get '/tenants/:id', to: 'tenants#show', as: 'tenant'
  get '/tenants/:id/edit', to: 'tenants#edit', as: 'edit_tenant'
  patch '/tenants/:id', to: 'tenants#update'
  delete '/tenants/:id', to: 'tenants#delete'

  #building review routes
  get '/building-reviews', to: 'building_reviews#index', as: 'building_reviews'
  get '/building-reviews/new', to: 'building_reviews#new', as: 'new_building_review'
  post '/building-reviews', to: 'building_reviews#create'
  get '/building-reviews/:id', to: 'building_reviews#show', as: 'building_review'
  get '/building-reviews/:id/edit', to: 'building_reviews#edit', as: 'edit_building_review'
  patch '/building-reviews/:id', to: 'building_reviews#update'
  delete '/building-reviews/:id', to: 'building_reviews#delete'

end
