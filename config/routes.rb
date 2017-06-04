Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }

  authenticated :user do
    root 'dashboard#index'
  end

  root 'welcome#index'
end
