Rails.application.routes.draw do

  get 'advertisements/index'
  get 'advertisements/new'
  get 'advertisements/show'
  get 'advertisements/create'
  resources :posts
  get 'posts' => 'welcome#posts'
  get 'about' => 'welcome#about'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
