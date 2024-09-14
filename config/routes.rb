Rails.application.routes.draw do
  devise_for :customers
  devise_for :admins
  namespace :admin do
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end
  # #devise_for :admins, controllers: {
  #   sessions: 'admin/sessions'
  # }

   scope module: :public do
    root to: 'homes#top'
    #root to: 'homes#about'
    resources :items, only: [:index, :show]
    resource :customers, only: [:show, :edit, :update] do
      collection do
        get 'unsubscribe'
        patch 'withdraw'
      end
    end
    resources :cart_items, only: [:index, :create, :update, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end
    resources :orders, only: [:new, :create, :index, :show] do
      collection do
        post 'confirm'
        get 'thanks'
      end
    end
    resources :addresses, only: [:index, :create, :edit, :update, :destroy]
  end
  # devise_for :customers, controllers: {
  #   registrations: 'public/registrations',
  #   sessions: 'public/sessions'
  # }
end

 # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html