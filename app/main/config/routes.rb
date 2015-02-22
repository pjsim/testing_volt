# See https://github.com/voltrb/volt#routes for more info on routes

get '/seller_offer', _action: 'seller_offer'
get '/seller_counteroffer', _action: 'seller_counteroffer'
get '/seller_offers', _action: 'seller_offers'
get '/buyer_offer', _action: 'buyer_offer'
get '/buyer_offers', _action: 'buyer_offers'
get '/about', _action: 'about'

# Routes for login and signup, provided by user-templates component gem
get '/signup', _controller: 'user-templates', _action: 'signup'
get '/login', _controller: 'user-templates', _action: 'login'

# The main route, this should be last. It will match any params not
# previously matched.
get '/', {}