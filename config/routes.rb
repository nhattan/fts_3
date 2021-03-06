Fts3::Application.routes.draw do

  root  "static_pages#home"
  
  match "/signup",  to: "users#new",            via: "get"
  match "/help",    to: "static_pages#help",    via: "get"
  match "/about",   to: "static_pages#about",   via: "get"

  resources "sessions", only: [:new, :create, :destroy]
  match "/signin", to: "sessions#new",          via: :get
  match "/signout", to: "sessions#destroy",      via: :delete

  resources "users"
  resources "users" do
    resources "trainee_courses" do
      resources "user_subjects", only: [:edit, :update]      
    end
  end

  resources "courses" do
    resources "course_subjects", only: [:show]
  end
  
  namespace :admin do
    match "/signin", to: "sessions#new",        via: :get
    match "/signout", to: "sessions#destroy",   via: :post
    resources "sessions", only: [:new, :create, :destroy]
    resources "users"
    resources "courses"
    resources "subjects"

    resources "courses" do
      resource "assign_trainees", only: [:edit, :create, :destroy]
      resource "assign_supervisors", only: [:edit, :create, :destroy]
      resources "course_subjects", only: [:show, :edit, :update]
      resources "trainee_courses", only: [:update]
    end
    match "csvs", to: "csvs#index", via: :get
    match "csvs/import", to: "csvs#import", via: :post
    match "csvs/export", to: "csvs#export", via: :get
  end
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
