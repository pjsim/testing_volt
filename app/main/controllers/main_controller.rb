# By default Volt generates this controller for your Main component
class MainController < Volt::ModelController

  def commodities_list
    page._commodities = [
      { title: 'Lexus', price: '3000', description: 'kinda old', new_offer: false },
      { title: 'Banana', price: '3000', description: 'it\'s yellow', new_offer: true },
      { title: 'Carbon Rod', price: '3000', description: 'Look it glows', new_offer: false }
    ] if page._commodities.blank?
  end

  # Pages

  def index
  end

  def commodities
    commodities_list
  end

  def commodities_show
    commodities_list
    page._commodity = page._commodities.first
  end

  def commodities_edit
    commodities_list
    page._commodity = page._commodities.first
  end

  def commodities_new
    page._status = ''
    page._title = 'Blank'
    page._description = 'None'
    page._price = ''
  end

  def commodities_offer
    page._status = ''
    commodities_list
    page._commodity = page._commodities.first
    page._haggle = []
  end

  def haggles_counteroffer
    page._status = ''
    commodities_list
    page._commodity = page._commodities.first
  end

  def haggles_buyer

  end

  def haggles_seller

  end

  # Forms

  def list_commodity
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
      page._price = "#{page._new_price}"
      page._price_changed = true
      page._new_price = ''
    end
    commodities_list
    page._commodities << { title: page._title, description: page._description, price: page._price }
    flash._successes << "Your data has been saved"
    page._status = 'commodity_listed'
  end

  def make_offer
    flash._successes << "Offer made!"
    page._status = 'offer_made'
    page._haggle << { commodity: page._commodities.first._title, price: page._offer_price }
  end

  def make_counteroffer
    flash._successes << "Counteroffer made!"
    page._status = 'offer_made'
    page._haggle << { commodity: page._commodities.first._title, price: page._offer_price }
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
