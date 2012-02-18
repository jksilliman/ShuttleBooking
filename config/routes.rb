ShuttleBooking::Application.routes.draw do
  devise_for :users, :controllers => { :sessions => 'users/sessions'}

  namespace :admin do
    resources :users, :only => [:index, :new, :create, :destroy]
    resources :content, :only => [:index, :edit, :update]
    root :to => 'users#index', :as => ""
  end

  root :to => 'high_voltage/pages#show', :id => 'home'
end
