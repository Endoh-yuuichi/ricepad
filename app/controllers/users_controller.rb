class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
      @user = User.find(params[:id])
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, success: '登録が完了しました'
    else
      flash.now[:danger] = "登録に失敗しました"
      render :new
  end
end
  def edit
      @user = User.find(params[:id])
  end
  def update
     @user = User.find(params[:id])
     if @user.update_attributes(name: params[:user][:name], email: params[:user][:email])
       redirect_to root_path, success: '編集が完了しました'
     else
       flash.now[:danger] = "編集に失敗しました"
       render :new
     end
  end
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :introduce, :image)
  end
end
