Refinery::Application.routes.draw do
  resources :jobs, :only => [:show, :index]

  scope(:path => 'refinery', :as => 'admin', :module => 'admin') do
    resources :jobs 
  end
end

