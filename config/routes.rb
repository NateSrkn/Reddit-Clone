Rails.application.routes.draw do

  resources :questions
  resources :advertisements
  resources :posts 

  resources :topics do
    resources :posts, except: [:index]
  end
  
  get 'questions' => 'welcome#questions'
  get 'advertisements' => 'welcome#advertisements'
  get 'posts' => 'welcome#posts'
  get 'about' => 'welcome#about'
  root 'welcome#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
