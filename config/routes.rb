AgileBoard::Application.routes.draw do
  
  resources :projects do
    resources :user_stories do
      collection do
        post 'update_all'
        post 'update_release_plan'
        post 'update_iteration'
        post 'update_status'
      end
    end
    resources :release_plans do
      resources :iterations
    end
  end
  
  root :to => 'projects#index'
  
end
