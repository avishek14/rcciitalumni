RCCIITAlumni::Application.routes.draw do
  get "gallery/gallery"
  get "gallery/one_image"

  get "event/event_all"
  get "event/event_one"
  get "admin/user_all"
  get "admin/user_one"
  get "admin/user_delete"
  get "admin/gallery_upload"
  post "admin/upload_image"
  get "admin/delete_image"
  get "admin/event_create"
  post "admin/create_event"
  get "admin/delete_event"

  get "user/logger"
  post "user/login"
  get "user/logout"
  get "user/register"
  post "user/create"
  get "user/page"
  get "user/edit"
  get "user/delete"

  root "site#home"
  get "site/contact"
  get "site/pdesk"
  get "site/feedback"
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