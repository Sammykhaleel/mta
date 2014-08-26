Rails.application.routes.draw do

  resources :recipients 

  #resources :pins
  resources :alerts
  # devise_for :views
  # devise_for :installs

  devise_for :users

  resources :contacts

  
  

  # devise_for :users, :controllers => {:sessions => 'devise/sessions', :registrations => 'devise/registrations',
  #                                     :passwords => 'devise/passwords'}, :skip => [:sessions] do
  #   get '/login' => 'devise/sessions#new', :as => :new_user_session
  #   post '/login' => 'devise/sessions#create', :as => :user_session
  #   get '/logout' => 'devise/sessions#destroy', :as => :destroy_user_session
  # end


  root "pages#home"
  get "about" => "pages#about"
  get "recipients" => "pages#recipients"
  get "alerts" => "recipients#alerts"
  get "go" => "alerts#go", as: 'go_alert'
  get "setting" => "pages#setting"
  get "*path", to: redirect('/')

  #get "/appointmentreminder/makecall" => "twilio#makecall"
  
   

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

end
