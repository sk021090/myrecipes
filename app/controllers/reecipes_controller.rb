class ReecipesController < ApplicationController
   
  def index
    @reecipes = Reecipe.all
  end
  
  def show
   @reecipe = Reecipe.find(params[:id])
  end 
  
  def new
    @reecipe = Reecipe.new
  end 
  
  def create 
         @reecipe = Reecipe.new(reecipe_params)
         @reecipe.chef = Chef.find(4)
   if @reecipe.save
     flash[:success] = "your reecipe was created successfully"
     redirect_to reecipes_path
   else
     render :new
   end 
  end
    def edit
      @reecipe = Reecipe.find(params[:id])
    end
    
    def update
      @reecipe = Reecipe.find(params[:id])
      if @reecipe.update(reecipe_params)
        flash[:success] = "your reecipe was updated successfully"
        redirect_to reecipe_path(@reecipe)
      else 
        render :edit
      end 
    end 
       private
            def reecipe_params
            params.require(:reecipe).permit(:name, :summary, :description, :picture)
            end

end
