class UsersController < ApplicationController
  def index
    raise 'Only admin can access this action.' unless current_user.admin?
    @users = User.all.order(:id)
  end

  def sign_in_as
    raise 'Only admin can access this action.' unless current_user.admin?
    id = params[:id]
    sign_in(User.find(id))
    redirect_to root_path, notice: "Signed in as ID: #{id}"
  end
end
