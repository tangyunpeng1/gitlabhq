class Groups::NotificationSettingsController < Groups::ApplicationController
  def update
    notification_setting = group.notification_settings.find_by(user_id: current_user)
    saved = notification_setting.update_attributes(notification_setting_params)

    render json: { saved: saved }
  end

  private

  def notification_setting_params
    params.require(:notification_setting).permit(:level)
  end
end
