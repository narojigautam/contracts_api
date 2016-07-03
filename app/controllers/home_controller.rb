class HomeController < ApplicationController
  def index
    @user = { name: "Shubham", age: 20 }
  end
end
