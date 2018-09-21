class BlandsController < ApplicationController
  def index
  end

  def show
    @bland = Bland::myfind( :bland_cd => params[:bland_cd] )
  end
end
