Rails.application.routes.draw do
  resources :contacts, only: [:create, :new]
  get 'static_pages/about'

  get 'static_pages/contact'

  devise_for :users , :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  resources :walks
  resources :issues

  authenticated :user do
    root to: "walks#index" , as: :authenticated_root
  end
  root :to => 'contacts#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
