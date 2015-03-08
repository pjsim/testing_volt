# See https://github.com/voltrb/volt#routes for more info on routes

get '/commodities', _action: 'commodities'
get '/commodities_show', _action: 'commodities_show'
get '/commodities_edit', _action: 'commodities_edit'
get '/commodities_new', _action: 'commodities_new'

get '/commodities_offer', _action: 'commodities_offer'

get '/haggles_counteroffer', _action: 'haggles_counteroffer'
get '/haggles_buyer', _action: 'haggles_buyer'
get '/haggles_seller', _action: 'haggles_seller'

get '/about', _action: 'about'

# Routes for login and signup, provided by user-templates component gem
get '/signup', _controller: 'user-templates', _action: 'signup'
get '/login', _controller: 'user-templates', _action: 'login'

# The main route, this should be last. It will match any params not
# previously matched.
get '/', {}









# # See https://github.com/voltrb/volt#routes for more info on routes

# get '/buyer', _action: 'buyer'
# get '/seller', _action: 'seller'

# get '/commodities', _action: 'commodities'
# get '/counteroffer', _action: 'counteroffer'

# get '/seller_offer', _action: 'seller_offer'
# get '/seller_offers', _action: 'seller_offers'

# get '/buyer_offer', _action: 'buyer_offer'
# get '/buyer_offers', _action: 'buyer_offers'

# get '/about', _action: 'about'

# # Routes for login and signup, provided by user-templates component gem
# get '/signup', _controller: 'user-templates', _action: 'signup'
# get '/login', _controller: 'user-templates', _action: 'login'

# # The main route, this should be last. It will match any params not
# # previously matched.
# get '/', {}
