class ApplicationController < ActionController::Base
  include Pundit
  before_action :authenticate_user!

  rescue_from Pundit::NotAuthorizedError do
    respond_to do |format|
      format.html { redirect_to root_path, flash: { error: 'Unauthorized' } }
    end
  end
end
