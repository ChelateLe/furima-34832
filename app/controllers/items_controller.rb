class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy] 
  before_action :itemsuite, only: [:edit, :update, :show, :destroy]
  before_action :redirectindex, only: [:edit, :update]
  before_action :redirectroot, only: [:edit, :update]

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
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end


  def index
    @items = Item.all.order(created_at: :desc)
  end

  def show
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name,:info,:price,:category_id,:status_id,:cost_id,:area_id,:furimadate_id, :image).merge(user_id: current_user.id)
  end

  def itemsuite
    @item = Item.find(params[:id])
  end

  def redirectindex
    unless current_user.id == @item.user_id
      redirect_to action: :index
    end
  end  

  def redirectroot
    if @item.purchase_record.present?
      recirect root_path
    end
  end

end
