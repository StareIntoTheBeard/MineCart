class ProductCoresController < ApplicationController
  before_filter :orientation
  after_filter :proliferate, :only => :update
  # GET /product_cores
  # GET /product_cores.json
  def index
    @product_cores = @store.product_cores.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_cores }
    end
  end

  # GET /product_cores/1
  # GET /product_cores/1.json
  def show
    @product_core = @store.product_cores.find(params[:id])
    @categories = Category.all
    @allinstances = ProductInstance.find_all_by_sku(@product_core.sku)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_core }
    end
  end

  # GET /product_cores/new
  # GET /product_cores/new.json
  def new
    # @product_core = ProductCore.new(:store_id => params[:store_id])
    @product_core = @store.product_cores.new(:store_id => params[:store_id])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_core }
    end
  end

  # GET /product_cores/1/edit
  def edit
    # @product_core = ProductCore.find(params[:id])
    @product_core = @store.product_cores.find(params[:id])
  end

  # POST /product_cores
  # POST /product_cores.json
  def create
    @product_core = @store.product_cores.new(params[:product_core])

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
    @product_core = @store.product_cores.find(params[:id])

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
    @product_core = @store.product_cores.find(params[:id])
    @product_core.destroy

    respond_to do |format|
      format.html { redirect_to store_product_cores_url }
      format.json { head :no_content }
    end
  end

    private
    def orientation
      @store = Store.find(params[:store_id])
    end

    def proliferate
      @allinstances = ProductInstance.find_all_by_sku(@product_core.sku)
      if @product_core.applytoall == true
        @allinstances.each do |i|
          if i.description != params[:product_core][:description]
            i.update_attribute(:description,  params[:product_core][:description])
          end
          if i.image != params[:product_core][:image]
            i.update_attribute(:image, params[:product_core][:image])
          end
          if i.active != params[:product_core][:active]
            i.update_attribute(:active, params[:product_core][:active])
          end
          if i.price != params[:product_core][:price]
            i.update_attribute(:price, params[:product_core][:price])
          end
          if i.sku != params[:product_core][:sku]
            i.update_attribute(:sku, params[:product_core][:sku])
          end
          i.save
        end
      end
    end
end
