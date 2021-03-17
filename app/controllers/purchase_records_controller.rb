class PurchaseRecordsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :itemsuite
  before_action :redirectroot, only: [:index, :create]

  def index
    @purchase_address = PurchaseAddress.new
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_record_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def itemsuite
    @item = Item.find(params[:item_id])
  end

  def purchase_record_params
    params.require(:purchase_address).permit(
      :postal_code, :area_id, :cities, :house_number, :building, :phone_number
    ).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: purchase_record_params[:token],
      currency:'jpy'
    )
  end

  def redirectroot
    if current_user.id == @item.user_id || @item.purchase_record.present?
      redirect_to root_path
    end
  end 

end

