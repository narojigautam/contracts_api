class Api::ContractsController < ApplicationController

  def index
    @contracts = Contract.all
    render json: @contracts
  end

  def create
    @contract = Contract.create(contract_params)
    render json: @contract
  end

  def show
    @contract = Contract.find(params[:id])
    render json: @contract
  end

  def update
    id = params[:id]
    @contract = Contract.find(id)
    if @contract.update(contract_params)
      render json: @contract
    else
      render json: {message: "Could not update"}, status: 403
    end
  end

  private

  def contract_params
    params.require(:contract).permit(:name, :description, :tender_amount, :date, :profit_amount, :bill_amount)
  end

end