class Api::PaymentsController < Api::ApiApplicationController

  def index
    @payments = params[:contract_id] ? Payment.where(contract_id: params[:contract_id]) : Payment.with_contracts
    render json: @payments
  end

  def create
    @payment = Payment.create(payment_params)
    render json: @payment
  end

  def destroy
    @payment = Payment.find(params[:id])
    if @payment.destroy
      render json: {message: "OK"}, status: 200
    else
      render json: {message: "Could not delete"}, status: 403
    end
  end

  private

  def payment_params
    params.require(:payment).permit(:name, :description, :amount, :contract_id, :date)
  end

end