class CategoriesController < ApplicationController
  before_action :set_category, only: [:show, :destroy, :edit, :update]

  before_action :require_admin, only: [:update, :edit, :create, :destroy]

  def index
    @categories = Category.all
  end

  def show
    @items = @category.items
  end

  def new
    @category = Category.new
  end

  def edit
  end

  # PATCH/PUT /categories/1
  # PATCH/PUT /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to @category, notice: 'Item was successfully updated.' }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def create
    @category = Category.new(category_params)
    respond_to do |format|
      if @category.save
        format.html { redirect_to @category, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |format|
      format.html { redirect_to categories_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :avatar)
  end

  def set_category
    @category = Category.find(params[:id])
  end
end
