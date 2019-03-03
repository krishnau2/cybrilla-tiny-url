class HomeController < ApplicationController
  def index
    @url_bank = UrlBank.new
  end

  def create
    puts "params= #{params}"
    redirect_to root_path
  end

end
