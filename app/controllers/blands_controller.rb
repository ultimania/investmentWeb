class BlandsController < ApplicationController
  def index
  end

  def show
    @bland = Bland::myfind( params[:bland_cd] )
  end
end
