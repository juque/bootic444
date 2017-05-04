class DashboardController < ApplicationController
  before_filter :login_required

  def index
    @orders = if current_shop.has?(:orders)
        current_shop.orders(per_page:50, page:params.fetch(:p,1), sort: 'updated_on.desc')
      else
        []
      end
  end
end
