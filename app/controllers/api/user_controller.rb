class Api::UserController < Api::BaseController
  # skip_before_action :authenticate_user!

  def auth
    render json: { msg: 'Ok!' }
  end
end
