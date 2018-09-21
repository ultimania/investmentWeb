class BlandsController < ApplicationController
  def index
  end

  def show
    @bland = Bland.find( :bland_cd => param[:bland_cd] )
  end
end
