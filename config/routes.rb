Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  authenticated :user do
    root 'domains#index'

    resources :configurations, only: [:index, :update]
    resources :domains, only: [:index, :new, :create, :destroy]
  end

  root 'welcome#index'
end
