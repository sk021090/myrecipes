class ReecipesController < ApplicationController
   before_action :set_reecipe, only: [:edit, :update, :show, :like]
   before_action :require_user, except: [:show, :index]
   before_action :require_same_user, only: [:edit, :update]
   
  def index
    @reecipes = Reecipe.paginate(page: params[:page], per_page: 4 )
  end
  
  def show
   
  end 
  
  def new
    @reecipe = Reecipe.new
  end 
  
  def create 
         @reecipe = Reecipe.new(reecipe_params)
         @reecipe.chef = current_user
         
         
   if @reecipe.save
     flash[:success] = "your reecipe was created successfully!"
     redirect_to reecipes_path
   else
     render :new
   end 
  end

    def edit
      
    end
    
    def update
      
      if @reecipe.update(reecipe_params)
        flash[:success] = "your reecipe was updated successfully"
        redirect_to reecipe_path(@reecipe)
      else 
        render :edit
      end 
    end 

      def like
      
       Like.create(like: params[:like], chef: current_user, reecipe: @reecipe)
       if like.valid?
         flash[:success] = "your selection was success"
       redirect_to :back
     else
       flash[:danger] = "you can only like/dislike a reecipe once"
       end 
      end 
   
      
    private
    
            def reecipe_params
            params.require(:reecipe).permit(:name, :summary, :description, :picture)
            end
            
          def set_reecipe
           @reecipe = Reecipe.find(params[:id])
          end
         
        def require_same_user
           if current_user != @reecipe.chef
            flash[:danger] = "you can't edit others profile"
            redirect_to reecipes_path
           end 
        end
end

 

