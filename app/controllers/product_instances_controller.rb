class ProductInstancesController < ApplicationController
  # GET /product_instances
  # GET /product_instances.json
  def index
    @product_instances = ProductInstance.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_instances }
    end
  end

  # GET /product_instances/1
  # GET /product_instances/1.json
  def show
    @product_instance = ProductInstance.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_instance }
    end
  end

  # GET /product_instances/new
  # GET /product_instances/new.json
  def new
    @product_instance = ProductInstance.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_instance }
    end
  end

  # GET /product_instances/1/edit
  def edit
    @product_instance = ProductInstance.find(params[:id])
  end

  # POST /product_instances
  # POST /product_instances.json
  def create
    @product_instance = ProductInstance.new(params[:product_instance])

    respond_to do |format|
      if @product_instance.save
        format.html { redirect_to @product_instance, notice: 'Product instance was successfully created.' }
        format.json { render json: @product_instance, status: :created, location: @product_instance }
      else
        format.html { render action: "new" }
        format.json { render json: @product_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_instances/1
  # PUT /product_instances/1.json
  def update
    @product_instance = ProductInstance.find(params[:id])

    respond_to do |format|
      if @product_instance.update_attributes(params[:product_instance])
        format.html { redirect_to @product_instance, notice: 'Product instance was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_instance.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_instances/1
  # DELETE /product_instances/1.json
  def destroy
    @product_instance = ProductInstance.find(params[:id])
    @product_instance.destroy

    respond_to do |format|
      format.html { redirect_to product_instances_url }
      format.json { head :no_content }
    end
  end
end