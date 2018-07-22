Rails.application.routes.draw do
  root to: "home#world"
  get 'home/world' => "home#world"
  get 'home/rabbit_world' => "home#rabbit_world"
  get '/new_transaction' => "home#new_transaction"
end
