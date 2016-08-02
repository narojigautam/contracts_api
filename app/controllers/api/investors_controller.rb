class Api::InvestorsController < Api::ApiApplicationController

  def index
    @investors = Investor.all
    render json: @investors
  end

  def create
    @investor = Investor.create(investor_params)
    render json: @investor
  end

  def show
    @investor = Investor.find(params[:id])
    render json: @investor
  end

  def destroy
    @investor = Investor.find(params[:id])
    if @investor.destroy
      render json: {message: "OK"}, status: 200
    else
      render json: {message: "Could not delete"}, status: 403
    end
  end

  private

  def investor_params
    params.require(:investor).permit(:name)
  end

end