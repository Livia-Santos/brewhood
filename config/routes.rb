Rails.application.routes.draw do
  devise_for :users
  resources :beers do
    resources :comments
  end


  root "beers#index"

end
