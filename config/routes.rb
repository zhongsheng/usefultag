Usefultag::Engine.routes.draw do
  root 'tags#home'
  resources :tags do
    collection do
      get 'home'
    end
  end
end
