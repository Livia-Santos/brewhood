Rails.application.routes.draw do
  resources :profiles
  devise_for :users
  resources :orders, only: [:new, :create]
  resources :beers do
    member do
      get "like", to: "beers#upvote"
      get "dislike", to: "beers#downvote"
    end
    resources :comments
  end

  get 'thanks', to: 'orders#thanks', as: 'thanks'

  root "beers#index"
end
