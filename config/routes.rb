Rails.application.routes.draw do
  devise_for :users
  resources :beers do
    member do
      get "like", to: "beers#upvote"
      get "dislike", to: "beers#downvote"
    end
    resources :comments
  end


  root "beers#index"

end
