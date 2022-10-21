# frozen_string_literal: true

class ProfileModalComponent < ViewComponent::Base
  include Turbo::FramesHelper

  def initialize(title:)
    @title = title
  end

end
