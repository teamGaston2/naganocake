Rails.application.routes.draw do

  devise_for :customers,skip: [:passwords], controllers: {
  registrations: 'public/registrations',
    sessions: 'public/sessions'
  }

   devise_for :admins, controllers: {
    sessions: 'admin/sessions'
   }

  namespace :admin do
    root to: "homes#top"
    resources :items, only: [:index, :new, :create, :show, :edit, :update]
    resources :genres, only: [:index, :create, :edit, :update]
    resources :customers, only: [:index, :show, :edit, :update]
    resources :orders, only: [:show, :update]
    resources :order_details, only: [:update]
  end


   scope module: :public do
    root to: 'homes#top'
    get '/about' => 'homes#about' ,as: 'about'

    get '/customers/my_page' => 'customers#show' ,as: 'my_page'
    get '/customers/information/edit' => 'customers#edit' ,as: 'information_edit'
    get '/customers/unsubscribe' => 'customers#unsubscribe' ,as: 'unsubscribe'
    patch '/customers/information' => 'customers#update' ,as: 'information'
    patch '/customers/withdraw' => 'customers#withdraw' ,as: 'withdraw'

    resources :items, only: [:index, :show]
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

end

 # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html