class Users::SessionsController < Devise::SessionsController
   before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
   #  def new
   #    super
   #  end

  # POST /resource/sign_in
   #  def create
   #    super
   #  end

  # DELETE /resource/sign_out
    #  #def destroy
     #  if something_is_not_kosher
     #     # 1. log this event, 2. send notice
      #    redirect_to controller: 'devise/sessions', action: 'destroy', method: :delete and return
     #   end
   #  end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
   def configure_sign_in_params
     devise_parameter_sanitizer.permit(:sign_in, keys: [:name, :last_name, :facultad])
   end
end
