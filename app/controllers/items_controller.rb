class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :all_categories, only: [:new, :edit, :create]
  before_action :set_user, only: [:edit, :destroy]
  before_action :require_user, only: [:new, :create, :edit, :update, :destroy]
  # GET /items
  # GET /items.json
  def index
    @items = Item.all
  end

  # GET /items/1
  # GET /items/1.json
  def show
  end

  # GET /items/new
  def new
    @item = Item.new
  end

  # GET /items/1/edit
  def edit
    redirect_to root_url if @user && @user.id != current_user.id
  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(item_params)
    @category = Category.find(params[:category]) unless params[:category].nil?
    respond_to do |format|
      if @item.save
        @category.items << @item if @category
        current_user.items << @item
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render :show, status: :created, location: @item }
      else

        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /items/1
  # PATCH/PUT /items/1.json
  def update
    redirect_to(root_url) && return if @user && @user.id != current_user.id
    @category = Category.find(params[:category]) unless params[:category].nil?
    respond_to do |format|
      if @item.update(item_params)
        @category.items << @item if @category
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    if @user.id != current_user.id
      redirect_to '/'
    else
      @item.destroy
      respond_to do |format|
        format.html { redirect_to root_url, notice: 'Item was successfully destroyed.' }
        format.json { head :no_content }
      end
    end
  end

  # GET /items/search
  def search
    @items = Item.where("name LIKE :query", query: "%#{params[:query]}%")
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_item
    @item = Item.find(params[:id])
  end

  def set_user
    @user = Item.find(params[:id]).user
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def item_params
    params.require(:item).permit(:name, :content, :price, :unit, :location, :rent, :avatar)
  end

  def all_categories
    @categories = Category.all
  end
end
