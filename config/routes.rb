Rails.application.routes.draw do
  scope '/api' do
    resources :books
  end

  root to: 'books#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
