class ProfilesController < ApplicationController
  before_action :ensure_frame_response, only: [:new]

  def index; end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
      if @profile.save
        respond_to do |format|
          format.html { redirect_to new_employer_path }
          format.turbo_stream { redirect_to new_employer_path }
        end
      else
        render :new, status: :unprocessable_entity
      end
  end

  private
    def ensure_frame_response
      return unless Rails.env.development?
    end

    def profile_params
      params.require(:profile).permit(:first_name, :last_name, :nick_name, :email_address, :phone_number)
    end
end
