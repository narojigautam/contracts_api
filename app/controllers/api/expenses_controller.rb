class Api::ExpensesController < Api::ApiApplicationController

  def index
    @expenses = params[:contract_id] ? Expense.where(contract_id: params[:contract_id]) : Expense.with_contracts
    render json: @expenses
  end

  def create
    @expense = Expense.create(expense_params)
    render json: @expense
  end

  def destroy
    @expense = Expense.find(params[:id])
    if @expense.destroy
      render json: {message: "OK"}, status: 200
    else
      render json: {message: "Could not delete"}, status: 403
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :description, :amount, :contract_id, :date)
  end

end