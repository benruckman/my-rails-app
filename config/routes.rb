Rails.application.routes.draw do
  get '/contact', to: "root#contact"
  get '/checkout', to: "root#checkout"
  get '/faq', to: "root#faq"
  get '/listings', to: "root#listings"
  get '/listings/checkout', to: "root#checkout"
  get '/about', to: "root#about"
  get '/response', to: "root#api"
  get '/home', to: "root#home"
  get '/checkoutbilling', to: "root#checkoutbilling"
  get '/cart', to: "root#cart"
  get '/checkoutpay', to: "root#checkoutpay"
  get '/user/:id/:name', to: "root#user" #:id/:name are returned as variables to the method, to use to set up the page. 
  #post '/addaddress/:id/:firstname/:lastname/:email/:address1/:address2/:country/:state/:zip', to: "root#addaddress"
  post '/addaddress', to: "root#addaddress"
  post '/add_to_cart/:product_id' => 'cart#add_to_cart', :as => 'add_to_cart'
  post '/add', to: "root#add"
  root "root#home" #This defines the root route, so it's not just the ruby on rails page
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
