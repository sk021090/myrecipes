class PagesController < ApplicationController
    
    def home
        redirect_to reecipes_path if logged_in?
    end
    
end
