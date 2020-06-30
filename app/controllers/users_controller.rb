class UsersController < ApplicationController
  before_action :authenticate_user
  before_action :set_user, only: [:update]

  def find
    @user = User.find_by(email: params[:email])
    render :show
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    if @user.save
      render :show, status: :created, location: @user
    else
      render :show, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    if @user.update(user_params)
      render :show, status: :ok, location: @user
    else
      render :show, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      pre_params = params.require(:user).permit(
          :first_name, :last_name, :email
      )
      pre_params.merge!( password: params[:password] )
    end
end
