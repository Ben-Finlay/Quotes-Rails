Rails.application.routes.draw do
  root to: 'qquotes#show'
  resources :qquotes, only: [:show]
end
