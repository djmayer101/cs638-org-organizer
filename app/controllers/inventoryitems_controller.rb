class InventoryitemsController < ApplicationController
  # GET /inventoryitems
  # GET /inventoryitems.json
	helper_method :sort_column, :sort_direction  
def index 
    @inventoryitems = Inventoryitem.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 10, :page => params[:page])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @inventoryitems }
    end
  end

  # GET /inventoryitems/1
  # GET /inventoryitems/1.json
  def show
    @inventoryitem = Inventoryitem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @inventoryitem }
    end
  end

  # GET /inventoryitems/new
  # GET /inventoryitems/new.json
  def new
    @inventoryitem = Inventoryitem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @inventoryitem }
    end
  end

  # GET /inventoryitems/1/edit
  def edit
    @inventoryitem = Inventoryitem.find(params[:id])
  end

  # POST /inventoryitems
  # POST /inventoryitems.json
  def create
    @inventoryitem = Inventoryitem.new(params[:inventoryitem])

    respond_to do |format|
      if @inventoryitem.save
        format.html { redirect_to @inventoryitem, notice: 'Item was successfully created.' }
        format.json { render json: @inventoryitem, status: :created, location: @inventoryitem }
      else
        format.html { render action: "new" }
        format.json { render json: @inventoryitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /inventoryitems/1
  # PUT /inventoryitems/1.json
  def update
    @inventoryitem = Inventoryitem.find(params[:id])

    respond_to do |format|
      if @inventoryitem.update_attributes(params[:inventoryitem])
        format.html { redirect_to @inventoryitem, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @inventoryitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventoryitems/1
  # DELETE /inventoryitems/1.json
  def destroy
    @inventoryitem = Inventoryitem.find(params[:id])
    @inventoryitem.destroy

    respond_to do |format|
      format.html { redirect_to inventoryitems_url }
      format.json { head :no_content }
    end
  end
  private
  def sort_column
     Inventoryitem.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
