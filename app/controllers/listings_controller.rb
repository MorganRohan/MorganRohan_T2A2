class ListingsController < ApplicationController
  before_action :set_listing, only: %i[ show edit update destroy place_order ]
  before_action :set_form_vars, only: %i[ new edit ]
  # Create before_actions to determine authentication and authorisation of the user
  # Only authenticated users can create, edit or destroy their own listings
  # Purchasing of said listings is handled by the Orders Controller
  before_action :authenticate_account!, except: [:index, :show]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  #CRUD operations for listings managed by methods below
  # GET /listings or /listings.json
  def index
    @listings = Listing.all
  end

  # GET /listings/1 or /listings/1.json
  def show
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings or /listings.json
  def create
    @listing = Listing.new(listing_params)
    @listing.account = current_account

    respond_to do |format|
      if @listing.save
        format.html { redirect_to listing_url(@listing), notice: "Listing was successfully created." }
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1 or /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to listing_url(@listing), notice: "Listing was successfully updated." }
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1 or /listings/1.json
  def destroy
    @listing.destroy

    respond_to do |format|
      format.html { redirect_to listings_url, notice: "Listing was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # Define a method for placing an order, which creates the order object with the listing_id, buyer_id and seller_id
  # Will also update sold status to prevent item being sold again (secondhand marketplace = unique items)
  # Will also redirect to success path to show success view
  def place_order
    Order.create(
      listing_id: @listing.id,
      seller_id: @listing.account_id, 
      buyer_id: current_account.id
    )

    @listing.update(sold: true)

    redirect_to orders_success_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    def set_form_vars
      @categories = Category.all
      @conditions = Listing.conditions.keys
    end

    def authorize_user
      if @listing.account_id != current_account.id
        flash[:alert] = "Not Authorised To Make Changes"
        redirect_to listings_path
      end
    end

    # Only allow a list of trusted parameters through.
    def listing_params
      params.require(:listing).permit(:title, :author, :description, :condition, :price, :sold, :account_id, :category_id, :picture)
    end
end
