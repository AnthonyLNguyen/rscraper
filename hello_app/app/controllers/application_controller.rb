require "container.rb"
class ApplicationController < ActionController::Base

    protect_from_forgery with: :exception

    def index
    end
    
    def hello
        render html: "Ruby Scraper"
    end
    
end