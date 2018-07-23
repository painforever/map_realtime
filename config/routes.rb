Rails.application.routes.draw do
  root to: "home#world"
  get 'home/world' => "home#world"
  get 'home/rabbit_world' => "home#rabbit_world"
  get 'home/google_map_markers' => "home#google_map_markers"
  get "home/live_status" => 'home#live_status'
  get "home/live_status_demo" => 'home#live_status_demo'
  get '/new_transaction' => "home#new_transaction"
end
