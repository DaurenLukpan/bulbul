class UsersController < ApplicationController
   
  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end
  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      flash[:success] = "Welcome to the Bulbul!"
      redirect_to @user
    else
      render 'new'
    end
    def edit
    @user = User.find(params[:id])
    end
    
    def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
       flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
      # Handle a successful update.
     private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
      def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
      def signed_in_user
      redirect_to signin_url, notice: "Please sign in." unless signed_in?
    end
      def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
      def index
    @users = User.paginate(page: params[:page])
  end
 end
