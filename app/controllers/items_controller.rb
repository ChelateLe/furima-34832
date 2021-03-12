class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit] 

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end


  def index
    @items = Item.all.order(created_at: :desc)
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:name,:info,:price,:category_id,:status_id,:cost_id,:area_id,:furimadate_id, :image).merge(user_id: current_user.id)
  end
end
