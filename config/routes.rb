AgileBoard::Application.routes.draw do
  
  resources :projects do
    #get 'backlog', :on => :member
    resources :user_stories do
      post 'change_status', :on => :member
    end
  end
  
end
