class SellsController < ApplicationController
  def index
  end

  def show
  end

  def new
  end

  def edit
  end

  def create
    @sell = Sell.new(product:params[:sell][:name], amount:params[:sell][:amount] , user_id:session[:user], seller_name:session[:name])

    respond_to do |format|
      if @sell.save
        format.html { redirect_to "/users", notice: 'Your item was listed for sale' }
          format.json { render :show, status: :created, location: "/users"}
      else
        format.html { redirect_to '/users', notice: @sell.errors.full_messages}
        format.json { render json: @sell.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
    # render json:params[:id]
    Sell.find(params[:id]).delete
    redirect_to '/users'
    # Sells.where(product:params[:id]).destroy
  end
end
