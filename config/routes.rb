Rails.application.routes.draw do

  post 'relationships/follow_profile/:id', to: 'relationships#follow_profile', as: :follow_profile
  post 'relationships/unfollow_profile/:id', to: 'relationships#unfollow_profile', as: :unfollow_profile

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

  get 'thanks', to: 'orders#thanks'
  get 'my_profile', to: 'profiles#my_profile'

  root "beers#index"
end
