class CategoriesController < ApplicationController
  # GET /categories
  # GET /categories.json
  before_filter :orientation

  def index
    @categories = @shelf.categories.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @categories }
    end
  end

  # GET /categories/1
  # GET /categories/1.json
  def show
    @category = @shelf.categories.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/new
  # GET /categories/new.json
  def new
    @category = @shelf.categories.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @category }
    end
  end

  # GET /categories/1/edit
  def edit
    @category = @shelf.categories.find(params[:id])
  end

  # POST /categories
  # POST /categories.json
  def create
    @category = @shelf.categories.new(params[:category])

    respond_to do |format|
      if @category.save
        format.html { redirect_to shelf_categories_path, notice: 'Category was successfully created.' }
        format.json { render json: shelf_categories_path, status: :created, location: @category }
      else
        format.html { render action: "new" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /categories/1
  # PUT /categories/1.json
  def update
    @category = @shelf.categories.find(params[:id])

    respond_to do |format|
      if @category.update_attributes(params[:category])
        format.html { redirect_to shelf_categories_path, notice: 'Category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1
  # DELETE /categories/1.json
  def destroy
    @category = @shelf.categories.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to shelf_categories_path(@shelf.store,@shelf) }
      format.json { head :no_content }
    end
  end

  private

    def orientation
      @shelf = Shelf.find(params[:shelf_id])
    end
end
