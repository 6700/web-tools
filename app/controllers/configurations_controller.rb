class ConfigurationsController < ApplicationController
  def index
    @configuration = current_user
  end

  def update
    current_user.update!(configuration_params)
    redirect_to configurations_path
  end

  private

  def configuration_params
    params.require(:user).permit(:first_name, :email)
  end
end
