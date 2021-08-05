Rails.application.routes.draw do
  devise_for :customers, controllers: {
    sessions: 'customers/sessions',
    passwords:     'customers/passwords',
    registrations: 'customers/registrations'
  }
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.htm

  scope module: :public do
    root :to => "homes#top"
    resources :items, only: [:index, :show] do
     resource :bookmarks, only: [:create, :destroy]
    end
    resources :customers,only: [:edit,:update]
    get 'customers/:id/my_page' => 'customers#show', as: 'my_page'
    get 'customers/:id' => 'customers#show'
    put 'customers/:id/withdrawal' =>  'customers#withdrawal', as: 'customers_withdrawal'
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :cart_items, only: [:index, :update, :destroy, :create]
     resources :requests, only: [:create]
    post 'order/comfirm' => 'orders#comfirm'
    get 'order/thanks' => 'orders#thanks'
    put 'order/:id/item_return' => 'orders#item_return', as: 'item_return'
    resources :orders, only: [:new, :create, :index, :show ]
  end

end
