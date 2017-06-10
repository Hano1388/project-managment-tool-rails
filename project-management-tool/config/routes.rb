Rails.application.routes.draw do
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# get('/', to: 'welcome#home')
# get('/projects/', to: 'projects#index')
# get('/projects/:id', {to: 'projects#show', as: :project})
get('/tasks/', to: 'tasks#index')
get('/discussions/', to: 'discussions#index')
get('/comments/', to: 'comments#index')
#
# get('/projects/new/', {to: 'projects#new', as: :new_project})
# post('/projects', to: 'projects#create')

resources :projects do
  resources :favourites, only: [:create, :destroy]
end
# get('/projects/:id/edit', {to: 'projects#edit', as: :edit_project})
# patch('/projects/:id', {to: 'projects#update'})
# delete('/projects/:id', {to: 'projects#destroy'})
end
