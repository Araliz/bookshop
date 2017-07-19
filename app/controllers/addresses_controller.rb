class AddressesController < ApplicationController
  before_action :authenticate_user!
  def new
    if current_user.address.nil?
      @address = current_user.build_address
    else
      redirect_to edit_address_path(current_user)
    end
  end

  def create
    @address = current_user.build_address(address_params)
    if @address.save
      redirect_to root_path, notice: "Address updated"
    else
      render :new
    end
  end

  def edit
    @address = current_user.address
  end

  def update
    @address = current_user.address
    if @address.update_attributes(address_params)
      redirect_to root_path, notice: "Address updated"
    else
      render :new
    end
  end

  private

  def address_params
    params.require(:address).permit(
      :last_name,
      :first_name,
      :street,
      :city,
      :zip_code
    )
  end
end
