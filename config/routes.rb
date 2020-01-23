Rails.application.routes.draw do
  root to: 'statics#home_page'
  resources :products do
    resources :reviews
  end
end
