class KarkasdomsController < ApplicationController
  before_action :set_karkasdom, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @karkasdoms = Karkasdom.all
    respond_with(@karkasdoms)
  end

  def show
    respond_with(@karkasdom)
  end

  def new
    @karkasdom = Karkasdom.new
    respond_with(@karkasdom)
  end

  def edit
  end

  def create
    @karkasdom = Karkasdom.new(karkasdom_params)
    @karkasdom.save
    respond_with(@karkasdom)
  end

  def update
    @karkasdom.update(karkasdom_params)
    respond_with(@karkasdom)
  end

  def destroy
    @karkasdom.destroy
    respond_with(@karkasdom)
  end

  private
    def set_karkasdom
      @karkasdom = Karkasdom.find(params[:id])
    end

    def karkasdom_params
      params.require(:karkasdom).permit(:name, :price, :label)
    end
end
