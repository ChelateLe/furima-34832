class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new] 

  def new
    @item = Item.new
  end

  private

  def item_params
    params.require(:item).permit(:name,:info,:price,:category_id,:status_id,:cost_id,:area_id,:furimadate_id, :image).merge(user_id: current_user.id)
  end
end
