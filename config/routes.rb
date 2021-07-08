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
    resources :items, only: [:index, :show]
    resources :customers,only: [:edit,:update]
    get 'customers/:id' => 'customers#show', as: 'my_page'
    resources :cart_items, only: [:index, :update, :destroy, :create]
    delete 'cart_items/destroy_all' => 'cart_items#destroy_all'
    resources :order, only: [:new, :create, :index, :show ]
    post 'orders/comfirm' => 'order#comfirm'
    get 'orders/thanks' => 'order#thanks'
  end

end
