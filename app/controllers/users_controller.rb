class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def index
    @user = User.all
  end

  def new
    @user = User.new
  end

  def create
    params.require(:user).permit(:first_name, :last_name, :email, :age, :password)
    @user = User.new(first_name: params[:user][:first_name],
                    last_name: params[:user][:last_name],
                    email: params[:user][:email],
                    age: params[:user][:age],
                    password: params[:user][:password],
                    city_id: 90)
    if @user.save
      redirect_to gossips_path
    else
      render :new
    puts "$" * 100
    puts params.inspect
    puts "$" * 100
    end
  end
end
