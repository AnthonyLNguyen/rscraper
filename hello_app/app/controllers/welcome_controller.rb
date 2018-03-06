require "container.rb"
class WelcomeController < ApplicationController
  def index
  end
  
  def tester
    @url = params[:my_url]
    @tag = params[:my_tag]
    render html: @url
  end
  
  def scrape
      begin
        url = params[:my_url]
        tag = params[:my_tag]
        elements = Container.new(url).parse_tags(tag).children.map { |elements| elements.text }.compact
        result = "<style>* {background-color: D3D3D3;text-align: center;} button{font-variant:small-caps;background-color: #f44336; border: none;color: white;padding: 15px 32px;text-decoration: none;display: inline-block;font-size: 16px;} textarea{text-align: left;resize:none;background-color: white;display: block;margin-left: auto;margin-right: auto;} h1 {font-size: 72px;color: #E95A5F;margin-left: 20px;font-variant:small-caps;text-align:center;}h2{text-align:center;}</style><h1>Ruby Scraper</h1><h2>Results</h2><textarea rows='25' cols='80'>"
        (0...elements.size).each do |index|
	        #result.concat "===== Instance: #{index+1} =====<br>"
	        result.concat "#{elements[index]}\n"
        end
        result.concat "</textarea><br><button onclick='goBack()'>Go Back</button><script>function goBack() {window.history.back();}</script>"
        render html: result.html_safe
      rescue Exception
        render html: "<style>* {background-color: D3D3D3;text-align:center;}button{font-variant:small-caps;background-color: #f44336; border: none;color: white;padding: 15px 32px;text-decoration: none;display: inline-block;font-size: 16px;}</style><h1>Invalid URL or poor request. Try Again</h1><button onclick='goBack()'>Go Back</button><script>function goBack() {window.history.back();}</script>".html_safe
      end
  end
end
