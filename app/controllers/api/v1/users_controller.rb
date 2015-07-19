class Api::V1::UsersController < ApplicationController

  def search
    @users = User.search(params[:query])
    render :json => @users
  end

  # Authentication
  def sign_up
    @user = User.new(user_attrs)
    @user.access_token = SecureRandom.hex

    if @user.password.nil?
       @user.password = SecureRandom.hex
       # パスワードを書いたメールを送る?
    end

    puts @user.access_token
    if @user.save!
      render :json => @user.to_json(:only => "access_token")
    else
      render :json => {"type" => "unauthorized", "message" => "You are not authorized."}, :status => 401
    end
  end

  def sign_in
    @user = User.where(:email => params[:user][:email])
    if user.try(:authenticate, params[:user][:password])
      @user.access_token = SecureRandom.hex
      @user.save
      render :json => @user.access_token
    else
      render :json => {"type" => "unauthorized", "message" => "You are not authorized."}, :status => 401
    end
  end

  def sign_out
    @user.access_token = nil
    @user.save
    render :json => {"type" => "logout", "message" => "logout"}
  end

  private
  
  def user_attrs
    params.require(:user).permit(:name, :screen_name, :email, :password, :uid, :sns_type, :uid)
  end

end
