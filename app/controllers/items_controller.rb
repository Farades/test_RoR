class ItemsController < ApplicationController
  
  def index
    @items = Item

    order = params[:order] == "asc" ? "asc" : "desc"
    @items = @items.order("created_at #{order}")
    @items = @items.paginate(per_page: 10, page: params[:page])
  end

  def show
    @item = Item.find(params[:id])
  end

  def new
    @item = Item.new
  end

  def create
    item_params = params.require(:item).permit(:name, :description, :price, :weight)
    @item = Item.create(item_params) 
    if @item.errors.empty?
      redirect_to @item
    else
      render "new"
    end
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    item_params = params.require(:item).permit(:name, :description, :price, :weight)
    @item.update_attributes(item_params)
    if @item.errors.empty?
      redirect_to @item
    else
      render "edit"
 end
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to items_path
  end

end
