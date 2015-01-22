Rails.application.routes.draw do

  root "pages#index"
  get "/about" => "pages#about", as: :about
  get "/blog" => "pages#blog", as: :blog
  get "/admin" => "pages#admin", as: :admin
  get "/wob" => "pages#wob", as: :wob
  get "/videos" => "pages#videos", as: :videos
  get "/facebook" => "pages#facebook"





  # Effort to connect facebook using omni-auth without koala
  # get "/auth/:facebook/callback" => "sessions#create"

# # # # #  # # # # # # #  # # # # # # #  # # # # # #  # # # #  # # #

  # setting up kaola to work in tandem with omniauth
  # from http://www.gotealeaf.com/blog/facebook-graph-api-using-omniauth-facebook-and-koala
  # get 'auth/facebook', as: "auth_provider"
  # get 'auth/facebook/callback', to: 'users#login'
  # root to: 'users#index', via: :get


  resources :beards


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
