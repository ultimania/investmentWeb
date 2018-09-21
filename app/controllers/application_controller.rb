class ApplicationController < ActionController::Base
    def show
        @bland = Bland.find( :bland_cd => param[:bland_cd] )
    end
end
