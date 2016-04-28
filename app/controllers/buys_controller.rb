class BuysController < ApplicationController
  def index
  end

  def show

  end

  def new
  end

  def edit
  end

  def create
    @buy = Buy.new(product:params[:buy][:product],amount:params[:buy][:amount],user_id:params[:buy][:user],buyer:session[:user], buyer_name:session[:name])

    respond_to do |format|
      if @buy.save
        Sell.find(params[:buy][:id]).delete
        format.html { redirect_to "/users", notice: 'You purchased this item'}
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
  end
end
