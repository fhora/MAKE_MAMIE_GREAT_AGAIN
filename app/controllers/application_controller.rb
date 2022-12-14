class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  include Pundit::Authorization
  before_action :navbar_count

  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :verify_authorized, except: :index, unless: :skip_pundit?
  after_action :verify_policy_scoped, only: :index, unless: :skip_pundit?
  # Uncomment when you *really understand* Pundit!
  # rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  # def user_not_authorized
  #   flash[:alert] = "You are not authorized to perform this action."
  #   redirect_to(root_path)
  # end

  private

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name description phone_number])

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, keys: %i[photo first_name last_name description phone_number])
  end

  def skip_pundit?
    devise_controller? || params[:controller] =~ /(^(rails_)?admin)|(^pages$)/
  end

  def navbar_count
    @messages = 0
    chatrooms = Chatroom.joins(:mission_candidate).where(mission_candidate: { user: current_user }) + Chatroom.where(user: current_user)
    chatrooms.each do |chatroom|
      @messages += chatroom.messages.where(seen_date: nil).where.not(user: current_user).count
    end
  end
end
