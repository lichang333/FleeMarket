class Api::V1::ItemsController < Api::V1::BaseController
  def index
    items = Item.all
    @items = items.select { |i| i.user != @current_user }
  end

  def show
  end

  def my_items
    items = Item.all
    @items = items.select { |i| i.user == @current_user}
  end

  def create
    @item = Item.new(item_params)
    @item.user = @current_user
    if @item.save
      render :my_items
    else
      render_error
  end

  def update
    if @item.update(item_params)
      render :show
    else
      render_error
    end
  end

  def destroy
    @item.destroy
    head :no_content
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def render_error
    render json: { errors: @item.errors.full_messages },
      status: :unprocessable_entity
  end

  def item_params
    params.require(:item).permit(:title, :condition, :cover_image, :description, :city)
  end
end
