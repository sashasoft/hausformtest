class KarkasdomsController < ApplicationController
  before_action :set_karkasdom, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:form, :sum]
  load_and_authorize_resource

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
  
  
  
  def sum
    @hh = [];
    temp = Karkasdom.new 
    @sum = 0;
    
    if params[:archproject].to_f > 0
      @sum = @sum + Karkasdom.find_by(label: :archproject).price
    end
    
    
    if params[:plfund].to_f > 0
      temp = Karkasdom.find_by(label: :plfund)
      if params[:fundament1400]
         @sum = @sum + temp.price * params[:plfund].to_f * Karkasdom.find_by(label: :fundament1400).price.to_f;
         @hh.push({"name" => Karkasdom.find_by(label: :fundament1400).name.to_s, "value" => temp.price * params[:plfund].to_f*Karkasdom.find_by(label: :fundament1400).price.to_f})
      else
        @sum = @sum + temp.price * params[:plfund].to_f;
        @hh.push({"name" => temp.name.to_s, "value" => temp.price * params[:plfund].to_f})
      end
    end
        
    
    
    #steny
    if params[:plsten].to_f > 0
      if params[:sip160]
        temp = Karkasdom.find_by(label: :sip160)
        @sum = @sum + temp.price * params[:plsten].to_f
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plsten].to_f})
      end
       if params[:karkas150]
        temp = Karkasdom.find_by(label: :karkas150)
        @sum = @sum + temp.price * params[:plsten].to_f
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plsten].to_f})
          if params[:utiplenie]
            temp = Karkasdom.find_by(label: :utiplenie)
            @sum = @sum + temp.price * params[:plsten].to_f
            @hh.push({"name" => temp.name, "value" => temp.price * params[:plsten].to_f})
          end
        end
      if params[:saiding]
        temp = Karkasdom.find_by(label: :saiding)
        @sum = @sum + temp.price * params[:plsten].to_f
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plsten].to_f})
      end
      if params[:blockhaus]
        temp = Karkasdom.find_by(label: :blockhaus)
        @sum = @sum + temp.price * params[:plsten].to_f
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plsten].to_f})
      end
      if params[:shtukat]
        temp = Karkasdom.find_by(label: :shtukat)
        
        if params[:koroedsvetlyi].to_f > 0
          @sum = @sum + temp.price * params[:plsten].to_f * Karkasdom.find_by(label: :koroedsvetlyi).price
          @hh.push({"name" => temp.name, "value" => temp.price * params[:plsten].to_f*Karkasdom.find_by(label: :koroedsvetlyi).price})
        elsif params[:koroedarkii].to_f > 0
          @sum = @sum + temp.price * params[:plsten].to_f * Karkasdom.find_by(label: :koroedarkii).price
          @hh.push({"name" => temp.name, "value" => temp.price * params[:plsten].to_f*Karkasdom.find_by(label: :koroedarkii).price})
        else
          @sum = @sum + temp.price * params[:plsten].to_f
          @hh.push({"name" => temp.name, "value" => temp.price * params[:plsten].to_f})
        end
      end
      if params[:vagonka]
        temp = Karkasdom.find_by(label: :vagonka)
        @sum = @sum + temp.price * params[:plsten].to_f
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plsten].to_f})
      end
      if params[:gips]
        temp = Karkasdom.find_by(label: :gips)
        @sum = @sum + temp.price * params[:plsten].to_f
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plsten].to_f})
      end
    end
    
       
        
    
    #vnutren peregorodki
    if params[:plvnper].to_f > 0
      if params[:sip120]
        temp = Karkasdom.find_by(label: :sip120)
        @sum = @sum + temp.price * params[:plvnper].to_f
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plvnper].to_f})
      end
      if params[:karkas90]
        temp = Karkasdom.find_by(label: :karkas90)
        @sum = @sum + temp.price * params[:plvnper].to_f
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plvnper].to_f})
      end
      if params[:vagonkaperegorodka]
        temp = Karkasdom.find_by(label: :vagonkaperegorodka)
        @sum = @sum + temp.price * params[:plvnper].to_f * 2;
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plvnper].to_f * 2})
      end
      if params[:gipsperegorodka]
        temp = Karkasdom.find_by(label: :gipsperegorodka)
        @sum = @sum + temp.price * params[:plvnper].to_f * 2;
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plvnper].to_f * 2})
      end
      if params[:utiplenie100]
        temp = Karkasdom.find_by(label: :utiplenie100)
        @sum = @sum + temp.price * params[:plvnper].to_f
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plvnper].to_f})
      end
    end
    
    
    #potolok
    if params[:plpot].to_f > 0
      if params[:vagonkapot]
        temp = Karkasdom.find_by(label: :vagonkapot)
        @sum = @sum + temp.price * params[:plpot].to_f
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plpot].to_f})
      end
      if params[:gipspot]
        temp = Karkasdom.find_by(label: :gipspot)
        @sum = @sum + temp.price * params[:plpot].to_f
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plpot].to_f})
      end
    end
    
    
    #perekrytie
    if params[:plper].to_f > 0
      temp = Karkasdom.find_by(label: :perekosb)
      @sum = @sum + temp.price * params[:plper].to_f
      @hh.push({"name" => temp.name, "value" => temp.price * params[:plper].to_f})
      if params[:utiplenieper]
        temp = Karkasdom.find_by(label: :utiplenieper)
        @sum = @sum + temp.price * params[:plper].to_f
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plper].to_f})
      end
    end
    
    
    #krovlia
    if params[:plkrov].to_f > 0
      temp = Karkasdom.find_by(label: :krovlia)
      @sum = @sum + temp.price * params[:plkrov].to_f
      @hh.push({"name" => temp.name, "value" => temp.price * params[:plkrov].to_f})
    
      if params[:bitumkrov]
        temp = Karkasdom.find_by(label: :bitumkrov)
        @sum = @sum + temp.price * params[:plkrov].to_f
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plkrov].to_f})
      end
      if params[:metkrov]
        temp = Karkasdom.find_by(label: :metkrov)
        @sum = @sum + temp.price * params[:plkrov].to_f
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plkrov].to_f})
      end
      if params[:utipleniekrov]
        temp = Karkasdom.find_by(label: :utipleniekrov)
        @sum = @sum + temp.price * params[:plkrov].to_f
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plkrov].to_f})
      end
      
    end
    
    
    
      
      
    #dver
    if params[:dver]
      temp = Karkasdom.find_by(label: :dver)
      @sum = @sum + temp.price
      @hh.push({"name" => temp.name, "value" => temp.price})
    end
    if params[:plokna].to_f > 0
      temp = Karkasdom.find_by(label: :plokna)
      @sum = @sum + temp.price * params[:plokna].to_f
      @hh.push({"name" => temp.name, "value" => temp.price * params[:plokna].to_f})
    end
    
    
    
    #inzheneria
    if params[:elektrik]
      temp = Karkasdom.find_by(label: :elektrik)
      @sum = @sum + temp.price
      @hh.push({"name" => temp.name, "value" => temp.price})
    end
    if params[:vodoprovod]
      temp = Karkasdom.find_by(label: :vodoprovod)
      @sum = @sum + temp.price
      @hh.push({"name" => temp.name, "value" => temp.price})
    end
    if params[:kanalis]
      temp = Karkasdom.find_by(label: :kanalis)
      @sum = @sum + temp.price
      @hh.push({"name" => temp.name, "value" => temp.price})
    end
    if params[:otoplenie]
      temp = Karkasdom.find_by(label: :otoplenie)
      @sum = @sum + temp.price
      @hh.push({"name" => temp.name, "value" => temp.price})
    end
      
    #########################################################
    #########################################################
    #####DOPFORMA############################################
      
    if params[:karniznaiapodshivka].to_f > 0 
      temp = Karkasdom.find_by(label: :karniznaiapodshivka)
      @sum = @sum + temp.price
      @hh.push({"name" => temp.name, "value" => temp.price*params[:karniznaiapodshivka].to_f})
    end
    
    ###vodostok#####
    if params[:vodostokkrovlia].to_f > 0  && params[:vodostokvysota].to_f > 0 
      temp = Karkasdom.find_by(label: :vodostokkrovlia)
      temp1 = Karkasdom.find_by(label: :vodostokvysota)
      @sum = @sum + temp.price*params[:vodostokkrovlia].to_f
      @hh.push({"name" => temp.name, "value" => temp.price*params[:vodostokkrovlia].to_f})
      @sum = @sum + temp1.price*params[:vodostokvysota].to_f
      @hh.push({"name" => temp1.name, "value" => temp1.price*params[:vodostokvysota].to_f})
    end
    
    if params[:otmostka800].to_f > 0
      temp = Karkasdom.find_by(label: :otmostka800)
      @sum = @sum + temp.price
      @hh.push({"name" => temp.name, "value" => temp.price*params[:otmostka800].to_f})
    end
    if params[:otmostka1000].to_f > 0
      temp = Karkasdom.find_by(label: :otmostka1000)
      @sum = @sum + temp.price
      @hh.push({"name" => temp.name, "value" => temp.price*params[:otmostka1000].to_f})
    end
    if params[:podokonniki].to_f > 0
      temp = Karkasdom.find_by(label: :podokonniki)
      @sum = @sum + temp.price
      @hh.push({"name" => temp.name, "value" => temp.price*params[:podokonniki].to_f})
    end
    
    if params[:moskitka].to_f > 0
      temp = Karkasdom.find_by(label: :moskitka)
      @sum = @sum + temp.price * params[:moskitka].to_f
      @hh.push({"name" => temp.name, "value" => temp.price*params[:moskitka].to_f})
    end
    if params[:otliv].to_f > 0
      temp = Karkasdom.find_by(label: :otliv)
      @sum = @sum + temp.price * params[:otliv].to_f
      @hh.push({"name" => temp.name, "value" => temp.price*params[:otliv].to_f})
    end
    
    if params[:stupenki].to_f > 0
      temp = Karkasdom.find_by(label: :stupenki)
      @sum = @sum + temp.price
      @hh.push({"name" => temp.name, "value" => temp.price})
    end
    if params[:naves].to_f > 0
      temp = Karkasdom.find_by(label: :naves)
      @sum = @sum + temp.price
      @hh.push({"name" => temp.name, "value" => temp.price})
    end
    
    
    if params[:tsokol].to_f > 0
      temp = Karkasdom.find_by(label: :tsokol)
      @sum = @sum + temp.price * params[:tsokol].to_f
      @hh.push({"name" => temp.name, "value" => temp.price*params[:tsokol].to_f})
    end
    
    if params[:mezhkom].to_f > 0
        temp = Karkasdom.find_by(label: :mezhkom)
        @sum = @sum + temp.price * params[:mezhkom].to_f
        @hh.push({"name" => temp.name, "value" => temp.price*params[:mezhkom].to_f})
    end
    
    if params[:lestnica].to_f > 0
      temp = Karkasdom.find_by(label: :lestnica)
      @sum = @sum + temp.price * params[:lestnica].to_f
      @hh.push({"name" => temp.name, "value" => temp.price*params[:lestnica].to_f})
    end
    
    if params[:osbstenvnutri].to_f > 0
        temp = Karkasdom.find_by(label: :osbstenvnutri)
        @sum = @sum + temp.price * params[:osbstenvnutri].to_f
        @hh.push({"name" => temp.name, "value" => temp.price*params[:osbstenvnutri].to_f})
    end
    if params[:osbperegorodok2].to_f > 0
        temp = Karkasdom.find_by(label: :osbperegorodok2)
        @sum = @sum + temp.price * params[:osbperegorodok2].to_f
        @hh.push({"name" => temp.name, "value" => temp.price*params[:osbperegorodok2].to_f})
    end
    if params[:osbperegorodok1].to_f > 0
        temp = Karkasdom.find_by(label: :osbperegorodok1)
        @sum = @sum + temp.price * params[:osbperegorodok1].to_f
        @hh.push({"name" => temp.name, "value" => temp.price*params[:osbperegorodok1].to_f})
    end
    
    ###############END#########################################
    ###########################################################
    ###########################################################
    #marketing
    if !(@sum == 0)
      @sum = @sum + Karkasdom.find_by(label: :marketing).price
      @sum = @sum + Karkasdom.find_by(label: :logistika).price
      if params[:akcionka]
        @sum = @sum + Karkasdom.find_by(label: :akcionka).price
      end
      if params[:regional]
        @sum = @sum + Karkasdom.find_by(label: :regional).price
      end
      
      
      
      if @sum >= Karkasdom.find_by(label: :sum2).price
        @sum = @sum * Karkasdom.find_by(label: :nacenka14).price
      elsif @sum >= Karkasdom.find_by(label: :sum1).price
        @sum = @sum * Karkasdom.find_by(label: :nacenka15).price
      else
        @sum = @sum * Karkasdom.find_by(label: :pribyl).price
      end
      
      
    end
  end

  
  
  

  private
    def set_karkasdom
      @karkasdom = Karkasdom.find(params[:id])
    end

    def karkasdom_params
      params.require(:karkasdom).permit(:name, :price, :label)
    end
end
