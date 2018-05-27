class CartsController < ApplicationController
  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @carts }
    end
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    @cart = Cart.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @cart }
    end
  end

  # GET /carts/new
  # GET /carts/new.json
  def new
    @cart = Cart.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cart }
    end
  end

  # GET /carts/1/edit
  def edit
    @cart = Cart.find(params[:id])
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(params[:cart])

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render json: @cart, status: :created, location: @cart }
      else
        format.html { render action: "new" }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /carts/1
  # PUT /carts/1.json
  def update
    @cart = Cart.find(params[:id])

    respond_to do |format|
      if @cart.update_attributes(params[:cart])
        format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart = Cart.find(params[:id])
    @cart.destroy

    respond_to do |format|
      format.html { redirect_to carts_url }
      format.json { head :no_content }
    end
  end

  #add to cart
  def add_to_cart
    @item = Item.find(params[:item_id])
    @cart = $current_user.cart
    @store = @item.store
    if @store.present? and @store.pieces_remaining > 0
      @item_cart_mapping = ItemCartMapping.where(cart_id: $current_user.cart.id, item_id: @item.id).first_or_create
      @item_cart_mapping.item_quantity = @item_cart_mapping.item_quantity.to_i + 1
      @item_cart_mapping.save!
      pr = @store.pieces_remaining
      @store.update_attributes(pieces_remaining: pr-1)
      respond_to do |format|
        format.html { redirect_to items_path, notice: 'Cart was successfully updated.' }
        #format.json { head :no_content }
      end
    else
      @store.errors.add(:pieces_remaining, "Item out of stock")
      respond_to do |format|
        format.html { redirect_to items_path}
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def remove_from_cart
    @item = Item.find(params[:item_id])
    @cart = $current_user.cart
    @store = @item.store
    if @store.present?
      @item_cart_mapping = ItemCartMapping.where(cart_id: $current_user.cart.id, item_id: @item.id).last
      qu = @item_cart_mapping.item_quantity.to_i
      @item_cart_mapping.destroy!
      pr = @store.pieces_remaining
      @store.update_attributes(pieces_remaining: pr+qu)
      respond_to do |format|
        format.html { redirect_to @cart, notice: 'Item was successfully removed from Cart' }
        #format.json { head :no_content }
      end
    else
      @store.errors.add(:pieces_remaining, "Item not belonging to our store")
      respond_to do |format|
        format.html { redirect_to @cart, notice: 'Item could not be removed from Cart' }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end
end
