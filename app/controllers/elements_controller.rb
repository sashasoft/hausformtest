class ElementsController < ApplicationController
  before_filter :authenticate_user!, :except => [:form, :sum]
  load_and_authorize_resource
  
  def index
    @elements = Element.all
  end
  
  def new
    @element = Element.new
  end
  
  def show
  end
  
  def edit
  end
  
  def create
    @element = Element.new(element_params)
    
    if @element.save
      redirect_to elements_path
    else
      render 'new'
    end
  end
    
  def update
    if @element.update(element_params)
      redirect_to elements_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @element = Element.find(params[:id])
    @element.destroy
    
    redirect_to elements_path
  end
  
  def form
  end
    
  #####################################################
  #####################################################
    
  def sum
    @hh = [];
    temp = Element.new 
    @sum = 0;
    
    if params[:archproject].to_f > 0
      @sum = @sum + Element.find_by(label: :archproject).price
    end
    
    
    if params[:plfund].to_f > 0
      temp = Element.find_by(label: :plfund)
      @sum = @sum + temp.price * params[:plfund].to_f;
      @hh.push({"name" => temp.name.to_s, "value" => temp.price * params[:plfund].to_f})
    end
        
    
    
    #steny
    if params[:plsten].to_f > 0
      if params[:sip160]
        temp = Element.find_by(label: :sip160)
        @sum = @sum + temp.price * params[:plsten].to_f
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plsten].to_f})
      end
       if params[:karkas150]
        temp = Element.find_by(label: :karkas150)
        @sum = @sum + temp.price * params[:plsten].to_f
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plsten].to_f})
          if params[:utiplenie]
            temp = Element.find_by(label: :utiplenie)
            @sum = @sum + temp.price * params[:plsten].to_f
            @hh.push({"name" => temp.name, "value" => temp.price * params[:plsten].to_f})
          end
        end
      if params[:saiding]
        temp = Element.find_by(label: :saiding)
        @sum = @sum + temp.price * params[:plsten].to_f
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plsten].to_f})
      end
      if params[:blockhaus]
        temp = Element.find_by(label: :blockhaus)
        @sum = @sum + temp.price * params[:plsten].to_f
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plsten].to_f})
      end
      if params[:shtukat]
        temp = Element.find_by(label: :shtukat)
        @sum = @sum + temp.price * params[:plsten].to_f
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plsten].to_f})
      end
      if params[:vagonka]
        temp = Element.find_by(label: :vagonka)
        @sum = @sum + temp.price * params[:plsten].to_f
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plsten].to_f})
      end
      if params[:gips]
        temp = Element.find_by(label: :gips)
        @sum = @sum + temp.price * params[:plsten].to_f
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plsten].to_f})
      end
    end
    
       
        
    
    #vnutren peregorodki
    if params[:plvnper].to_f > 0
      if params[:sip120]
        temp = Element.find_by(label: :sip120)
        @sum = @sum + temp.price * params[:plvnper].to_f
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plvnper].to_f})
      end
      if params[:karkas90]
        temp = Element.find_by(label: :karkas90)
        @sum = @sum + temp.price * params[:plvnper].to_f
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plvnper].to_f})
      end
      if params[:vagonkaperegorodka]
        temp = Element.find_by(label: :vagonkaperegorodka)
        @sum = @sum + temp.price * params[:plvnper].to_f * 2;
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plvnper].to_f * 2})
      end
      if params[:gipsperegorodka]
        temp = Element.find_by(label: :gipsperegorodka)
        @sum = @sum + temp.price * params[:plvnper].to_f * 2;
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plvnper].to_f * 2})
      end
      if params[:utiplenie100]
        temp = Element.find_by(label: :utiplenie100)
        @sum = @sum + temp.price * params[:plvnper].to_f
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plvnper].to_f})
      end
    end
    
    
    #potolok
    if params[:plpot].to_f > 0
      if params[:vagonkapot]
        temp = Element.find_by(label: :vagonkapot)
        @sum = @sum + temp.price * params[:plpot].to_f
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plpot].to_f})
      end
      if params[:gipspot]
        temp = Element.find_by(label: :gipspot)
        @sum = @sum + temp.price * params[:plpot].to_f
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plpot].to_f})
      end
    end
    
    
    #perekrytie
    if params[:plper].to_f > 0
      temp = Element.find_by(label: :perekosb)
      @sum = @sum + temp.price * params[:plper].to_f
      @hh.push({"name" => temp.name, "value" => temp.price * params[:plper].to_f})
      if params[:utiplenieper]
        temp = Element.find_by(label: :utiplenieper)
        @sum = @sum + temp.price * params[:plper].to_f
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plper].to_f})
      end
    end
    
    
    #krovlia
    if params[:plkrov].to_f > 0
      temp = Element.find_by(label: :krovlia)
      @sum = @sum + temp.price * params[:plkrov].to_f
      @hh.push({"name" => temp.name, "value" => temp.price * params[:plkrov].to_f})
    
      if params[:bitumkrov]
        temp = Element.find_by(label: :bitumkrov)
        @sum = @sum + temp.price * params[:plkrov].to_f
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plkrov].to_f})
      end
      if params[:metkrov]
        temp = Element.find_by(label: :metkrov)
        @sum = @sum + temp.price * params[:plkrov].to_f
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plkrov].to_f})
      end
      if params[:utipleniekrov]
        temp = Element.find_by(label: :utipleniekrov)
        @sum = @sum + temp.price * params[:plkrov].to_f
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plkrov].to_f})
      end
      
    end
    
    
    
      
      
    #dver
    if params[:dver]
      temp = Element.find_by(label: :dver)
      @sum = @sum + temp.price
      @hh.push({"name" => temp.name, "value" => temp.price})
    end
    if params[:plokna].to_f > 0
      temp = Element.find_by(label: :plokna)
      @sum = @sum + temp.price * params[:plokna].to_f
      @hh.push({"name" => temp.name, "value" => temp.price * params[:plokna].to_f})
    end
    
    
    
    #inzheneria
    if params[:elektrik]
      temp = Element.find_by(label: :elektrik)
      @sum = @sum + temp.price
      @hh.push({"name" => temp.name, "value" => temp.price})
    end
    if params[:vodoprovod]
      temp = Element.find_by(label: :vodoprovod)
      @sum = @sum + temp.price
      @hh.push({"name" => temp.name, "value" => temp.price})
    end
    if params[:kanalis]
      temp = Element.find_by(label: :kanalis)
      @sum = @sum + temp.price
      @hh.push({"name" => temp.name, "value" => temp.price})
    end
    if params[:otoplenie]
      temp = Element.find_by(label: :otoplenie)
      @sum = @sum + temp.price
      @hh.push({"name" => temp.name, "value" => temp.price})
    end
      
      
    
    
    #marketing
    if !(@sum == 0)
      @sum = @sum + Element.find_by(label: :marketing).price
      @sum = @sum + Element.find_by(label: :logistika).price
      if params[:akcionka]
        @sum = @sum + Element.find_by(label: :akcionka).price
      end
      if params[:regional]
        @sum = @sum + Element.find_by(label: :regional).price
      end
      
      
      
      if @sum >= Element.find_by(label: :sum2).price
        @sum = @sum * Element.find_by(label: :nacenka14).price
      elsif @sum >= Element.find_by(label: :sum1).price
        @sum = @sum * Element.find_by(label: :nacenka15).price
      else
        @sum = @sum * Element.find_by(label: :pribyl).price
      end
      
      
    end
  end

  
  
  private
    def element_params
      params.require(:element).permit(:name, :price, :label)
    end
        
 end
