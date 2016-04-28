class UsersController < ApplicationController
  def index
    @user = User.find(session[:user])
    @not_sold = Sell.where(user_id:session[:user])
    @sold = Buy.all

    @past_sales = Buy.joins(:user).where(user_id:session[:user])

    @purchased = Buy.joins(:user).where(buyer:session[:user])


  end

  def show

  end

  def new
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        session[:name] = @user.first_name
        session[:user] = @user.id
        format.html { redirect_to "/sessions/#{session[:user]}", notice: 'User was successfully created.' }
          format.json { render :show, status: :created, location: "/sessions/#{session[:user]}"}
      else
        format.html { redirect_to '/', notice: @user.errors.full_messages}
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
  end

  def destroy
    session[:user] = nil
    redirect_to '/'
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end
