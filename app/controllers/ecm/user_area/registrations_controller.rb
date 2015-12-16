class Ecm::UserArea::RegistrationsController < Devise::RegistrationsController
  def new
    if Ecm::UserArea::Configuration.registrations_disabled?
      handle_disabled_registration
    else
      super
    end
  end

  def create
    if Ecm::UserArea::Configuration.registrations_disabled?
      handle_disabled_registration
    else
      super
    end
  end

  private

  def handle_disabled_registration
    redirect_to root_path, notice: t('ecm.user_area.messages.notices.registrations_disabled')
  end
end
