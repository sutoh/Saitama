Saitama::Application.routes.draw do
  devise_for :users
  devise_scope :user do
    get "/", :to => "devise/sessions#new"
  end
  
  get "profile/index"

  resources :customers
  
  resources :works do
    resources :work_details do
      resources :work_skills
    end
  end

  resources :skills
  resources :licenses
  resources :departments

  resources :employees do
    resources :employee_skills
    resources :employee_licenses
  end

  #ひとまずadmin用のrouteを追加
  #TODO 一般ユーザ用とadmin用のrouteを調整する（一般ユーザは照会系と自身のデータ更新のみ）
  namespace :admin do
    root to: "top#index"
    resources :users
    resources :customers
  
    resources :works do
      resources :work_details do
        resources :work_skills
      end
    end

    resources :skills
    resources :licenses
    resources :departments

    resources :employees do
      resources :employee_skills
      resources :employee_licenses
    end
    
  end

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  #root :to => 'Employees#index'
  #match "profile/index", :as => :user_root # ログイン後の遷移パス
  root to: "devise/sessions#new"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
