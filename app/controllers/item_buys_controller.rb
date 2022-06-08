class ItemBuysController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item_buy, only: [:index, :create]

  def index
    @item_buy = ItemBuyForm.new
    redirect_to root_path if current_user.id == @item.user_id || !@item.item_buy.nil?
  end

  def create
    @item_buy = ItemBuyForm.new(item_buy_params)
    if @item_buy.valid?
      pay_item
      @item_buy.save
      redirect_to root_path
    else
      @item = Item.find(params[:item_id])
      render :index
    end
  end

  private

  def item_buy_params
    params.require(:item_buy_form).permit(:postal, :area_id, :cities, :house_number, :building, :telephone).merge(
      token: params[:token], user_id: current_user.id, item_id: params[:item_id]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: item_buy_params[:token],
      currency: 'jpy'
    )
  end

  def set_item_buy
    @item = Item.find(params[:item_id])
  end
end
