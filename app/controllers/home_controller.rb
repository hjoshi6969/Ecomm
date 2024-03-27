class HomeController < ApplicationController
  def index
    @home = Home.find(1)
  end
end
