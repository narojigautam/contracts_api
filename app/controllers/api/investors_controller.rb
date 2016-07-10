class Api::InvestorsController < ApplicationController

  def index
    @investors = Investor.all
    render json: @investors
  end

  def create
    @investor = Investor.create(investor_params)
    render json: @investor
  end

  private

  def investor_params
    params.require(:investor).permit(:name)
  end

end