Rails.application.routes.draw do
  
  get "karkasdoms/form"
  get "karkasdoms/sum"
  resources :karkasdoms

  
  get 'components/index'
  get "elements/form"
  get "elements/sum"
  resources :elements
  
  get "baums/form"
  get "baums/sum"
  resources :baums
  root 'welcome#index'
  
  devise_for :users
  resources :form do
    resources :component
  end
  

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
