Rails.application.routes.draw do
  resources :transfers
  resources :abonos
  resources :item_lista
  resources :item_pedidos
  resources :pedidos
  resources :lista
  resources :categoria_proveedors
  resources :item_proveedors
  resources :items
  resources :restaurantes
  resources :categoria
  resources :proveedors
  devise_for :users
  root 'items#index'
  get 'user_info', to: 'items#user_info', :as => 'user_info' #PERFIL
  get 'new_user', to: 'items#new_user', :as => 'new_user'    #NUEVO USUARIO
  get 'all_users', to: 'items#all_users', :as => 'all_users' #TODOS LOS USUARIOS
  post 'create_new_user', to: 'items#create_new_user', :as => 'create_new_user'
  get 'change_password', to: 'items#change_password', :as => 'change_password' #CAMBIAR CONTRASENA
  post 'new_change_password', to: 'items#new_change_password', :as => 'new_change_password'
  post 'update_estado_actual', to: 'pedidos#update_estado_actual', :as => 'update_estado_actual'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
