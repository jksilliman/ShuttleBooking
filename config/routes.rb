ShuttleBooking::Application.routes.draw do
  
  resources :shuttles, :only => [:index] do
    collection do
      post :select
    end
  end

  devise_for :users, :controllers => { :sessions => 'users/sessions'}

  namespace :admin do
    resources :shuttles, :only => [:index, :new, :create, :destroy, :show] do
      member do
        delete 'delete_user'
      end
    end
    resources :users, :only => [:index, :new, :create, :destroy]
    resources :content, :only => [:index, :edit, :update]
    root :to => 'shuttles#index', :as => ""
  end

  root :to => 'shuttles#index'
end
