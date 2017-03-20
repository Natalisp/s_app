Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


scope module: :v1, constraints: ApiConstraint.new(version: 1) do
  get '/people', to: "people#index"
end
resources :people
root 'people#index'
get '/guides', to: "pages#guides"
end
