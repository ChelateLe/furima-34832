class PurchaseRecordsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def new
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_record_params)
    if @purchase_address.valid?
      @purchase_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def purchase_record_params
    params.require(:purchase_address).permit(:postal_code, :area_id, :cities, :house_number, :buiding, :phone_number).merge(user_id: current_user.id, item_id: price)
  end

end

