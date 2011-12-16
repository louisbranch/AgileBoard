AgileBoard::Application.routes.draw do
  
  resources :projects do
    resources :user_stories do
      post 'statuses', :on => :collection
    end
  end
  
  root :to => 'projects#index'
  
end
