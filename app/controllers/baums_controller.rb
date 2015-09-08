class BaumsController < ApplicationController
  before_filter :authenticate_user!, :except => [:form, :sum]
  load_and_authorize_resource
  def index
    @baums = Baum.all
    respond_to do |format|
      format.html
      format.csv { send_data @baums.to_csv }
      format.xls
    end
  end
  
  def new
    @baum = Baum.new
  end
  
  def show
  end
  
  def edit
  end
  
  def create
    @baum = Baum.new(baum_params)
    
    if @baum.save
      redirect_to baums_path
    else
      render 'new'
    end
  end
    
  def update
    if @baum.update(baum_params)
      redirect_to baums_path
    else
      render 'edit'
    end
  end
  
  def destroy
    @baum = Baum.find(params[:id])
    @baum.destroy
    
    redirect_to baums_path
  end
  
  def form
  end
  #####################################################
  #####################################################
  #####################################################
  def sum
  
    temp = Baum.new
    @hh = [];
    @sum = 0;
    
    if params[:archproject].to_f > 0
      @sum = @sum + Baum.find_by(label: :archproject).price
    end

    if params[:plfund].to_f > 0
      temp = Baum.find_by(label: :plfund)
    
      if params[:fundament1400]
         @sum = @sum + temp.price * params[:plfund].to_f * Baum.find_by(label: :fundament1400).price.to_f;
         @hh.push({"name" => Baum.find_by(label: :fundament1400).name.to_s, "value" => temp.price * params[:plfund].to_f*Baum.find_by(label: :fundament1400).price.to_f})
      elsif params[:fundament1200]
        @sum = @sum + temp.price * params[:plfund].to_f * Baum.find_by(label: :fundament1200).price.to_f;
         @hh.push({"name" => Baum.find_by(label: :fundament1200).name.to_s, "value" => temp.price * params[:plfund].to_f*Baum.find_by(label: :fundament1200).price.to_f})
      else
        @sum = @sum + temp.price * params[:plfund].to_f;
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plfund].to_f})
      end
    end
    
    
    #steny
    if params[:plsten].to_f > 0
      if params[:dikii]
        if params[:suhoiles].to_f > 0
          k = Baum.find_by(label: :suhoiles).price.to_f
        else
          k = 1
        end
        if params[:dikii200]
          temp = Baum.find_by(label: :dikii200)
          @sum = @sum + temp.price * params[:plsten].to_f * k
          @hh.push({"name" => temp.name, "value" => temp.price * params[:plsten].to_f})
        end
        if params[:dikii240]
          temp = Baum.find_by(label: :dikii240)
          @sum = @sum + temp.price * params[:plsten].to_f * k
          @hh.push({"name" => temp.name, "value" => temp.price * params[:plsten].to_f})
        end
        if params[:dikii260]
          temp = Baum.find_by(label: :dikii260)
          @sum = @sum + temp.price * params[:plsten].to_f * k
          @hh.push({"name" => temp.name, "value" => temp.price * params[:plsten].to_f})
        end
        if params[:dikii300]
          temp = Baum.find_by(label: :dikii300)
          @sum = @sum + temp.price * params[:plsten].to_f * k
          @hh.push({"name" => temp.name, "value" => temp.price * params[:plsten].to_f})
        end
      end
      
      if params[:cylindr]
        if params[:cylindr200]
          temp = Baum.find_by(label: :cylindr200)
          @sum = @sum + temp.price * params[:plsten].to_f
          @hh.push({"name" => temp.name, "value" => temp.price * params[:plsten].to_f})
        end
        if params[:cylindr240]
          temp = Baum.find_by(label: :cylindr240)
          @sum = @sum + temp.price * params[:plsten].to_f
          @hh.push({"name" => temp.name, "value" => temp.price * params[:plsten].to_f})
        end
        if params[:cylindr260]
          temp = Baum.find_by(label: :cylindr260)
          @sum = @sum + temp.price * params[:plsten].to_f
          @hh.push({"name" => temp.name, "value" => temp.price * params[:plsten].to_f})
        end
        if params[:cylindr300]
          temp = Baum.find_by(label: :cylindr300)
          @sum = @sum + temp.price * params[:plsten].to_f
          @hh.push({"name" => temp.name, "value" => temp.price * params[:plsten].to_f})
        end
      end
       
      if params[:profil]
        if params[:profil150]
          temp = Baum.find_by(label: :profil150)
          @sum = @sum + temp.price * params[:plsten].to_f
          @hh.push({"name" => temp.name, "value" => temp.price * params[:plsten].to_f})
        end
        if params[:profil180]
          temp = Baum.find_by(label: :profil180)
          @sum = @sum + temp.price * params[:plsten].to_f
          @hh.push({"name" => temp.name, "value" => temp.price * params[:plsten].to_f})
        end
        if params[:profil200]
          temp = Baum.find_by(label: :profil200)
          @sum = @sum + temp.price * params[:plsten].to_f
          @hh.push({"name" => temp.name, "value" => temp.price * params[:plsten].to_f})
        end
      end
    end
    
    #pokraska
    if params[:pokraska]
      temp = Baum.find_by(label: :pokraska)
      @sum = @sum + temp.price * params[:plsten].to_f
      @hh.push({"name" => temp.name, "value" => temp.price * params[:plsten].to_f})
    end
    
       
    
    
    #potolok
    if params[:plpot].to_f > 0
      if params[:vagonka]
      temp = Baum.find_by(label: :vagonka)
      @sum = @sum + temp.price * params[:plsten].to_f
      @hh.push({"name" => temp.name, "value" => temp.price * params[:plpot].to_f})
      end
      if params[:lakpotolok].to_f > 0
        temp = Baum.find_by(label: :lakpotolok)
        @sum = @sum + temp.price * params[:plpot].to_f
        @hh.push({"name" => temp.name, "value" => temp.price*params[:plpot].to_f})
      end
    end
    
    
    #perekrytie
    if params[:plper].to_f > 0
      temp = Baum.find_by(label: :plper)
      @sum = @sum + temp.price * params[:plper].to_f
      @hh.push({"name" => temp.name, "value" => temp.price * params[:plper].to_f})
      
      if params[:doskasosna]
        temp = Baum.find_by(label: :doskasosna)
        @sum = @sum + temp.price * params[:plper].to_f
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plper].to_f})
      end
      
      if params[:utiplenieper]
        temp = Baum.find_by(label: :utiplenieper)
        @sum = @sum + temp.price * params[:plper].to_f
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plper].to_f})
      end
      if params[:lakpol].to_f > 0
        temp = Baum.find_by(label: :lakpol)
        @sum = @sum + temp.price * params[:plper].to_f
        @hh.push({"name" => temp.name, "value" => temp.price*params[:plper].to_f})
      end
    end
    
    
    #krovlia
    if params[:plkrov].to_f > 0
      temp = Baum.find_by(label: :stropsistema)
      @sum = @sum + temp.price * params[:plkrov].to_f
      @hh.push({"name" => temp.name, "value" => temp.price * params[:plkrov].to_f})
      
      if params[:bitumkrov]
        temp = Baum.find_by(label: :bitumkrov)
        @sum = @sum + temp.price * params[:plkrov].to_f
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plkrov].to_f})
      end
      if params[:metkrov]
        temp = Baum.find_by(label: :metkrov)
        @sum = @sum + temp.price * params[:plkrov].to_f
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plkrov].to_f})
      end
      if params[:utipleniekrov]
        temp = Baum.find_by(label: :utipleniekrov)
        @sum = @sum + temp.price * params[:plkrov].to_f
        @hh.push({"name" => temp.name, "value" => temp.price * params[:plkrov].to_f})
      end
    end
    
    ##################
    ##################
    
    if params[:karniz].to_f > 0
      temp = Baum.find_by(label: :karniz)
      @sum = @sum + temp.price * params[:karniz].to_f
      @hh.push({"name" => temp.name, "value" => temp.price * params[:karniz].to_f})
    end
    
    if params[:vysotadoma].to_f > 0 && params[:perimetrkrovli].to_f > 0
      temp = Baum.find_by(label: :vysotadoma)
      temp1 = Baum.find_by(label: :perimetrkrovli)
      @sum = @sum + temp.price*params[:vysotadoma].to_f
      @hh.push({"name" => temp.name, "value" => temp.price*params[:vysotadoma].to_f})
      @sum = @sum + temp1.price*params[:perimetrkrovli].to_f
      @hh.push({"name" => temp1.name, "value" => temp1.price*params[:perimetrkrovli].to_f})
    end
    
    if params[:okna].to_f > 0
      temp = Baum.find_by(label: :okna)
      @sum = @sum + temp.price * params[:okna].to_f
      @hh.push({"name" => temp.name, "value" => temp.price*params[:okna].to_f})
    end
#    if params[:moskitka].to_f > 0
#      temp = Baum.find_by(label: :moskitka)
#      @sum = @sum + temp.price * params[:moskitka].to_f
#      @hh.push({"name" => temp.name, "value" => temp.price*params[:moskitka].to_f})
#    end
#    if params[:dveri].to_f > 0
#     temp = Baum.find_by(label: :dveri)
#      @sum = @sum + temp.price * params[:dveri].to_f
#      @hh.push({"name" => temp.name, "value" => temp.price*params[:dveri].to_f})
#    end
#    
   if params[:otmostka800].to_f > 0
      temp = Baum.find_by(label: :otmostka800)
      @sum = @sum + temp.price.to_f
      @hh.push({"name" => temp.name, "value" => temp.price*params[:otmostka800].to_f})
    end
    if params[:otmostka1000].to_f > 0
      temp = Baum.find_by(label: :otmostka1000)
      @sum = @sum + temp.price.to_f
      @hh.push({"name" => temp.name, "value" => temp.price*params[:otmostka1000].to_f})
    end
    
#    if params[:podokonniki].to_f > 0
 #     temp = Baum.find_by(label: :podokonniki)
  #    @sum = @sum + temp.price.to_f
   #   @hh.push({"name" => temp.name, "value" => temp.price.to_f*params[:podokonniki].to_f})
#    end
 #   
  #  if params[:moskitka2].to_f > 0
   #   temp = Baum.find_by(label: :moskitka2)
    #  @sum = @sum + temp.price * params[:moskitka2].to_f
     # @hh.push({"name" => temp.name, "value" => temp.price*params[:moskitka2].to_f})
#    end
 #   
  #  
   # if params[:otliv].to_f > 0
    #  temp = Baum.find_by(label: :otliv)
     # @sum = @sum + temp.price * params[:otliv].to_f
      #@hh.push({"name" => temp.name, "value" => temp.price*params[:otliv].to_f})
#    end
    
    if params[:stupenki].to_f > 0
      temp = Baum.find_by(label: :stupenki)
      @sum = @sum + temp.price.to_f
      @hh.push({"name" => temp.name, "value" => temp.price})
    end
    
    if params[:naves].to_f > 0
      temp = Baum.find_by(label: :naves)
      @sum = @sum + temp.price.to_f
      @hh.push({"name" => temp.name, "value" => temp.price})
    end
    
    
    if params[:tsokol].to_f > 0
      if params[:tsokolklinker]
        temp = Baum.find_by(label: :tsokolklinker)
        @sum = @sum + temp.price * params[:tsokol].to_f
        @hh.push({"name" => temp.name, "value" => temp.price*params[:tsokol].to_f})
      end
      if params[:tsokolpeschanik]
        temp = Baum.find_by(label: :tsokolpeschanik)
        @sum = @sum + temp.price * params[:tsokol].to_f
        @hh.push({"name" => temp.name, "value" => temp.price*params[:tsokol].to_f})
      end
      if params[:tsokolplitka]
        temp = Baum.find_by(label: :tsokolplitka)
        @sum = @sum + temp.price * params[:tsokol].to_f
        @hh.push({"name" => temp.name, "value" => temp.price*params[:tsokol].to_f})
      end
    end
    
    if params[:mezhkom].to_f > 0
        temp = Baum.find_by(label: :mezhkom)
        @sum = @sum + temp.price * params[:mezhkom].to_f
        @hh.push({"name" => temp.name, "value" => temp.price*params[:mezhkom].to_f})
    end
    
    
    
    
    if params[:lestnica].to_f > 0
      if params[:v1]
        temp = Baum.find_by(label: :v1)
        @sum = @sum + temp.price * params[:lestnica].to_f
        @hh.push({"name" => temp.name, "value" => temp.price*params[:lestnica].to_f})
      end
      if params[:v2]
        temp = Baum.find_by(label: :v2)
        @sum = @sum + temp.price * params[:lestnica].to_f
        @hh.push({"name" => temp.name, "value" => temp.price*params[:lestnica].to_f})
      end
      if params[:v3]
        temp = Baum.find_by(label: :v3)
        @sum = @sum + temp.price * params[:lestnica].to_f
        @hh.push({"name" => temp.name, "value" => temp.price*params[:lestnica].to_f})
      end
    end
    ##################
    ##################
    
    
    
    
    
    #marketing
    if !(@sum == 0)
      @sum = @sum + Baum.find_by(label: :marketing).price
      @sum = @sum + Baum.find_by(label: :logistika).price
      if params[:akcionka]
        @sum = @sum + Baum.find_by(label: :akcionka).price
      end
      if params[:regional]
        @sum = @sum + Baum.find_by(label: :regional).price
      end
           
      
      if @sum >= Baum.find_by(label: :sum2).price
        @sum = @sum * Baum.find_by(label: :nacenka14).price
      elsif @sum >= Baum.find_by(label: :sum1).price
        @sum = @sum * Baum.find_by(label: :nacenka15).price
      else
        @sum = @sum * Baum.find_by(label: :pribyl).price
      end
      
      
      
    end
  end

  
  
  
  
  private
    def baum_params
      params.require(:baum).permit(:name, :price, :label)
    end
end
