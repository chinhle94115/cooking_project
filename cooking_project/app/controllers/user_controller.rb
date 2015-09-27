class UserController < ApplicationController
  before_action :authenticate_user!
  def new
  end

  def index
    @users = User.all
  end

end
