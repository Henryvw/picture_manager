class MonumentsController < ApplicationController
  before_action :require_user_session!
  before_action :set_monument, only: [:show, :edit, :update, :destroy]

  # GET /monuments
  # GET /monuments.json
  def index
    @monuments = Monument.all
  end

  # GET /monuments/1
  # GET /monuments/1.json
  def show
  end

  # GET /monuments/new
  def new
    @collection = Collection.find(params[:collection_id])
    @monument = Monument.new(collection_id: @collection.id)
  end

  # GET /monuments/1/edit
  def edit
  end

  # POST /monuments
  # POST /monuments.json
  def create
    @collection = Collection.find(params[:collection_id])
    @monument = @collection.monuments.create(monument_params)

    respond_to do |format|
      if @monument.save
        format.html { redirect_to @monument, notice: 'Monument was successfully created.' }
        format.json { render action: 'show', status: :created, location: @monument }
      else
        format.html { render action: 'new' }
        format.json { render json: @monument.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /monuments/1
  # PATCH/PUT /monuments/1.json
  def update
    respond_to do |format|
      if @monument.update(monument_params)
        format.html { redirect_to @monument, notice: 'Monument was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @monument.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /monuments/1
  # DELETE /monuments/1.json
  def destroy
    @monument.destroy
    respond_to do |format|
      format.html { redirect_to monuments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_monument
      @monument = Monument.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def monument_params
      params.require(:monument).permit(:name, :description, :category_id, :collection_id)
    end
end
