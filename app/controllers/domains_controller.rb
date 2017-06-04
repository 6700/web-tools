class DomainsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :new
  before_action :authenticate_user!

  def index
    @domains = Domain.all
  end

  def new
    @domain ||= Domain.new
    render :new
  end

  def create
    @domain = Domain.new(domain_params.merge(user: current_user))
    @domain.save!
    redirect_to domains_path
  end

  def destroy
    current_user.domains.find(params[:id]).destroy!
    redirect_to domains_path
  end

  private

  def domain_params
    params.require(:domain).permit(:name)
  end
end
