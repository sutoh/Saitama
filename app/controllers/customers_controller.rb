class CustomersController < ApplicationController
  before_filter :set_customer, only: [:show, :edit, :update, :destroy]
  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.page(params[:page]).per(10)
  end

  # GET /customers/1
  # GET /customers/1.json
  def show
  end

  # GET /customers/new
  # GET /customers/new.json
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(params[:customer])

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /customers/1
  # PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update_attributes(params[:customer])
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy

    respond_to do |format|
      format.html { redirect_to customers_url }
    end
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end
end
