class ProductCoresController < ApplicationController
  before_filter :store_identify
  # GET /product_cores
  # GET /product_cores.json
  def index
    @product_cores = ProductCore.find_all_by_store_id(@storeid)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_cores }
    end
  end

  # GET /product_cores/1
  # GET /product_cores/1.json
  def show
    @product_core = ProductCore.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_core }
    end
  end

  # GET /product_cores/new
  # GET /product_cores/new.json
  def new
    @product_core = ProductCore.new(:store_id => params[:store_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_core }
    end
  end

  # GET /product_cores/1/edit
  def edit
    @product_core = ProductCore.find(params[:id])
  end

  # POST /product_cores
  # POST /product_cores.json
  def create
    @product_core = ProductCore.new(params[:product_core])
    @product_core.store_id = current_user.store_id
    @product_core.save

    respond_to do |format|
      if @product_core.save
        format.html { redirect_to store_product_cores_path, notice: 'Product core was successfully created.' }
        format.json { render json: @product_core, status: :created, location: @product_core }
      else
        format.html { render action: "new" }
        format.json { render json: @product_core.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_cores/1
  # PUT /product_cores/1.json
  def update
    @product_core = ProductCore.find(params[:id])

    respond_to do |format|
      if @product_core.update_attributes(params[:product_core])
        format.html { redirect_to store_product_cores_path, notice: 'Product core was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_core.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_cores/1
  # DELETE /product_cores/1.json
  def destroy
    @product_core = ProductCore.find(params[:id])
    @product_core.destroy

    respond_to do |format|
      format.html { redirect_to product_cores_url }
      format.json { head :no_content }
    end
  end

    private
    def store_identify
      @storeid = current_user.store_id
    end
end
