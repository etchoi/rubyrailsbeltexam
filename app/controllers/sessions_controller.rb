class SessionsController < ApplicationController
  def index
    @user = User.new
  end

  def show
    @user = User.find(session[:user])
    @all_products = Sell.joins(:user).all
  end

  def new
  end

  def edit
  end

  def create
    @user = User.find_by(email: params[:login][:email].downcase)
    respond_to do |format|
      if @user && @user.authenticate(params[:login][:password])
        session[:name] = @user.first_name
        session[:user] = @user.id
        format.html { redirect_to "/sessions/#{session[:user]}"}
        format.json { render :show, status: :created, location: "/sessions/#{session[:user]}"}
      else
        format.html { redirect_to '/',   notice: 'Your email and/or password were incorrect.'}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
  end
end
