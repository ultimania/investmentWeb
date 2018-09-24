class BlandsController < ApplicationController
  def index
  end

  def show
    @bland = Bland::getBland( params[:bland_cd] )

    #  0.id
    #  1.market_prod_cls
    #  2.current_price
    #  3.day_before_ratio
    #  4.opening_price
    #  5.high_orice
    #  6.low_price
    #  7.sales_volume
    #  8.created_at
    #  9.bland_cd
    @stock_price = Bland::selectStockPrice(100,[9,2])

  end
end

