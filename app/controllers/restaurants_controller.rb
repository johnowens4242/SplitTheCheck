class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: %i[ show edit update destroy ]

  # GET /restaurants or /restaurants.json
  def index
    if (!user_signed_in?)
      redirect_to(new_user_registration_path)
    end

    if ((params[:name].nil? or params[:name] == "") and (params[:location].nil? or params[:location] == ""))
        @restaurants = Restaurant.all
        logger.info("all")
      elsif (!params[:location].nil? and (params[:name].nil? or params[:name] == ""))
        @restaurants = Restaurant.where(location: params[:location])
        logger.info("location only search")
        logger.info(params[:name])
        logger.info(params[:location])
      elsif (!params[:name].nil? and (params[:location].nil? or params[:location] == ""))
        @restaurants = Restaurant.where(name: params[:name])
        logger.info("name only search")
        logger.info(params[:name])
        logger.info(params[:location])
      else
        @restaurants = Restaurant.where(name: params[:name], location: params[:location])
        logger.info("both")
        logger.info(params[:name])
        logger.info(params[:location])
    end
  end

  def willSplit
    set_restaurant

    @restaurant.countWillSplit = @restaurant.countWillSplit + 1
    @restaurant.save

    redirect_to(restaurants_url)
  end

  def willNotSplit
    set_restaurant

    @restaurant.countWillNotSplit = @restaurant.countWillNotSplit + 1
    @restaurant.save

    redirect_to(restaurants_url)
  end

  # GET /restaurants/1 or /restaurants/1.json
  def show
  end

  # GET /restaurants/new
  def new
    @restaurant = Restaurant.new
  end

  # GET /restaurants/1/edit
  def edit
  end

  # POST /restaurants or /restaurants.json
  def create
    @restaurant = Restaurant.new(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to restaurant_url(@restaurant), notice: "Restaurant was successfully created." }
        format.json { render :show, status: :created, location: @restaurant }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /restaurants/1 or /restaurants/1.json
  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to restaurant_url(@restaurant), notice: "Restaurant was successfully updated." }
        format.json { render :show, status: :ok, location: @restaurant }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /restaurants/1 or /restaurants/1.json
  def destroy
    @restaurant.destroy

    respond_to do |format|
      format.html { redirect_to restaurants_url, notice: "Restaurant was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :location, :countWillSplit, :countWillNotSplit)
    end
end
