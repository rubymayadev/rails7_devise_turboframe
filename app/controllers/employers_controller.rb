class EmployersController < ApplicationController
  before_action :ensure_frame_response, only: [:new]

  def new
    @employer = Employer.new
  end

  def create
    byebug
    @employer = Employer.create(employer_params)
      if @employer
        respond_to do |format|
          format.html { redirect_to employers_url(@employer), status: :ok}
          format.turbo_stream { redirect_to employer_url(@employer) }
        end
      else
        render :new, status: :unprocessable_entity
      end
  end

  private
    def ensure_frame_response
      return unless Rails.env.development?
    end

    def employer_params
      params.require("_json").map do | param |
        param.permit(:employment, :start_date, :end_date, :profile_id)
      end
    end
end