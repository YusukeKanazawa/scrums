# Plugin's routes
# See: http://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  resources :projects do
    resources :product_backlogs
  end
end
