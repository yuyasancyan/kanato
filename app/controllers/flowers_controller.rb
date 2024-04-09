class FlowersController < ApplicationController
     before_action :authenticate_user!

    def index
        @flowers = Flower.all

        if params[:tag_ids]
            @flowers = []
            params[:tag_ids].each do |key, value|      
              
            end
            @flowers.uniq!
          end
    
          if params[:tag]
            Tag.create(name: params[:tag])
          end

    end

    

    def show
        @flower = Flower.find(params[:id])
        @comments = @flower.comments
        @comment = Comment.new
    end

    def new
        @flower = Flower.new
      end

      def edit
        @flower = Flower.find(params[:id])
      end

      def update
        flower = Flower.find(params[:id])
        if flower.update(flower_params)
          redirect_to :action => "show", :id => flower.id
        else
          redirect_to :action => "new"
        end
      end
    
      def create
        flower = Flower.new(flower_params)
        flower.user_id = current_user.id
        if flower.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end

      def destroy
        flower = Flower.find(params[:id])
        flower.destroy
        redirect_to action: :index
      end
    
    

      private
      def flower_params
        params.require(:flower).permit(:hana, :photo, :image, :overall)
      end 

end
