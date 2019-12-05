class MainController < ApplicationController

    def home
        @tenant = current_tenant
    end 

end 