# frozen_string_literal: true
module Authorizable
  extend ActiveSupport::Concern
  included do
    before_action :authorize_controller
  end
  def authorize_controller
    authorize(controller_name.to_sym)
  end
end
