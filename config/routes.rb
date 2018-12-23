Rails.application.routes.draw do
	resources :posts
	get 'posts_pictures', to: 'posts#pictures', as: 'posts_pictures'
	devise_for :users, path: '' #, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
	root 'posts#landing'
end