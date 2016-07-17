class Api::InvestmentsController < ApplicationController

  def index
    @investments = params[:investor_id] ? Investment.where(investor_id: params[:investor_id]) : Investment.with_investors
    render json: @investments
  end

  def create
    @investment = Investment.create(investment_params)
    render json: @investment
  end

  def destroy
    @investment = Investment.find(params[:id])
    if @investment.destroy
      render json: {message: "OK"}, status: 200
    else
      render json: {message: "Could not delete"}, status: 403
    end
  end

  private

  def investment_params
    params.require(:investment).permit(:date, :description, :amount, :investor_id)
  end

end