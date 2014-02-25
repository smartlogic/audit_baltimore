class SignersController < ApplicationController
  def create
    session[:signer_id] = Signer.create!(signer_params).id

    redirect_to verify_signer_url
  end

  def update
    current_signer.update(signer_params)

    redirect_to verified_signer_url
  end

  private

  def current_signer
    @current_signer ||= Signer.find(session[:signer_id])
  end
  helper_method :current_signer

  def signer_params
    params.require(:signer).permit(:email)
  end

  def update_signer_params
    params.require(:signer).permit(:first_name, :last_name, :zipcode, :birthday_1i, :birthday_2i, :birthday_3i)
  end
end
