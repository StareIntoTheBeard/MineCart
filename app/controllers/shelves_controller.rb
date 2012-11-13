class ShelvesController < ApplicationController
  before_filter :orientation
  # GET /shelves
  # GET /shelves.json
  def index
    @shelves = @store.shelves.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shelves }
    end
  end

  # GET /shelves/1
  # GET /shelves/1.json
  def show
    @shelf = @store.shelves.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shelf }
    end
  end

  # GET /shelves/new
  # GET /shelves/new.json
  def new
    @shelf = @store.shelves.new(:store_id => params[:store_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shelf }
    end
  end

  # GET /shelves/1/edit
  def edit
    @shelf = @store.shelves.find(params[:id])
  end

  # POST /shelves
  # POST /shelves.json
  def create
    @shelf = @store.shelves.new(params[:shelf])
    @shelf.store_id = current_user.store_id
    @shelf.save

    respond_to do |format|
      if @shelf.save
        format.html { redirect_to store_shelves_path, notice: 'Shelf was successfully created.' }
        format.json { render json: @shelf, status: :created, location: @shelf }
      else
        format.html { render action: "new" }
        format.json { render json: @shelf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shelves/1
  # PUT /shelves/1.json
  def update
    @shelf = @store.shelves.find(params[:id])

    respond_to do |format|
      if @shelf.update_attributes(params[:shelf])
        format.html { redirect_to store_shelves_path, notice: 'Shelf was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shelf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shelves/1
  # DELETE /shelves/1.json
  def destroy
    @shelf = @store.shelves.find(params[:id])
    @shelf.destroy

    respond_to do |format|
      format.html { redirect_to store_shelves_url }
      format.json { head :no_content }
    end
  end

  private
    def orientation
      @store = Store.find(params[:store_id])
      @storeid = current_user.store_id
    end
end
