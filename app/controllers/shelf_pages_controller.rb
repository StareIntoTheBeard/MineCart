class ShelfPagesController < ApplicationController
  # GET /shelf_pages
  # GET /shelf_pages.json
  before_filter :orientation
  def index
    @shelf_pages = @shelf.shelf_pages.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shelf_pages }
    end
  end

  # GET /shelf_pages/1
  # GET /shelf_pages/1.json
  def show
    @shelf_page = @shelf.shelf_pages.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shelf_page }
    end
  end

  # GET /shelf_pages/new
  # GET /shelf_pages/new.json
  def new
    @shelf_page = @shelf.shelf_pages.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @shelf_page }
    end
  end

  # GET /shelf_pages/1/edit
  def edit
    @shelf_page = @shelf.shelf_pages.find(params[:id])
  end

  # POST /shelf_pages
  # POST /shelf_pages.json
  def create
    @shelf_page = @shelf.shelf_pages.new(params[:shelf_page])

    respond_to do |format|
      if @shelf_page.save
        format.html { redirect_to shelf_shelf_pages_path, notice: 'Shelf page was successfully created.' }
        format.json { render json: @shelf_page, status: :created, location: @shelf_page }
      else
        format.html { render action: "new" }
        format.json { render json: @shelf_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shelf_pages/1
  # PUT /shelf_pages/1.json
  def update
    @shelf_page = @shelf.shelf_pages.find(params[:id])

    respond_to do |format|
      if @shelf_page.update_attributes(params[:shelf_page])
        format.html { redirect_to shelf_shelf_pages_path, notice: 'Shelf page was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @shelf_page.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shelf_pages/1
  # DELETE /shelf_pages/1.json
  def destroy
    @shelf_page = @shelf.shelf_pages.find(params[:id])
    @shelf_page.destroy

    respond_to do |format|
      format.html { redirect_to shelf_shelf_pages_url }
      format.json { head :no_content }
    end
  end

  private
    def orientation
      @shelf = Shelf.find(params[:shelf_id])
    end
end
