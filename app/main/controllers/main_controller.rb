# By default Volt generates this controller for your Main component
class MainController < Volt::ModelController

  def commodities_list
    page._commodities = [
      { title: 'Lexus', price: '$3000', description: 'kinda old', new_offer: false },
      { title: 'Banana', price: '$3000', description: 'it\'s yellow', new_offer: true },
      { title: 'Carbon Rod', price: '$3000', description: 'Look it glows', new_offer: false }
    ] if page._commodities.blank?
  end

  def index
  end
  def about
  end
  def seller
  end
  def buyer
  end

  def commodities
    commodities_list
  end

  def buyer_offer
    commodities_list
    commodity_id = params._id
    page._offer_price = page._commodities.first._price
  end

  def change_price
    page._offer_price = "$#{page._new_price}"
    page._price_changed = true
    page._new_price = ''
  end

  def current_offer
    page._my_offers[params._index.or(0).to_i]
  end

  def buyer_offers
    page._my_offers = [
      { title: 'Lexus', description: 'kinda old', new_offer: false },
      { title: 'Banana', description: 'it\'s yellow', new_offer: true },
      { title: 'Carbon Rod', description: 'Look it glows', new_offer: false }
    ]
  end

  def seller_offer
  end

  def make_commodity
    page._title = 'Blank'
    page._description = 'None'
    page._price = '$0'
    unless page._new_title.blank?
      page._title = page._new_title
      page._title_changed = true
      page._new_title = ''
    end
    unless page._new_description.blank?
      page._description = page._new_description
      page._description_changed = true
      page._new_description = ''
    end
    unless page._new_price.blank?
      page._price = "$#{page._new_price}"
      page._price_changed = true
      page._new_price = ''
    end
    commodities_list
    page._commodities << { title: page._title, description: page._description, price: page._price }
  end

  def seller_counteroffer
    page._offer = { title: 'Lexus', description: 'old', price: '$2000' }
  end

  def make_counter
    page._offer._price = "$#{page._new_price}"
    page._price_changed = true
    page._new_price = ''
  end

  def seller_offers
    page._my_commodities = [
      { title: 'Lexus', description: 'kinda old', new_offer: false, offers: { price: '$1000' } },
      { title: 'Banana', description: 'it\'s yellow', new_offer: true, offers: { price: '$2000' } },
      { title: 'Carbon Rod', description: 'Look it glows', new_offer: false }
    ]
  end


  private

  # The main template contains a #template binding that shows another
  # template.  This is the path to that template.  It may change based
  # on the params._controller and params._action values.
  def main_path
    params._controller.or('main') + '/' + params._action.or('index')
  end

  # Determine if the current nav component is the active one by looking
  # at the first part of the url against the href attribute.
  def active_tab?
    url.path.split('/')[1] == attrs.href.split('/')[1]
  end
end
