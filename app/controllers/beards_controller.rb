class BeardsController < ApplicationController

      def index
        @beards = Beard.all
      end

      def new
        @beard = Beard.new
      end
   
      def create
        beard_params = params.require(:beard).permit(:length, :rating)
        @beard = Beard.new(beard_params)
        @beard.save
        redirect_to beards_path
      end

      def show
        @beard = Beard.find(params[:id])
      end

      def edit
        @beard = Beard.find(params[:id])
      end

      def update
        beard_params = params.require(:beard).permit(:length, :rating)
        @beard = Beard.find(params[:id])
        @beard.update(beard_params)
        redirect_to beards_path
      end

      def destroy
        @beard = Beard.find(params[:id])
        @beard.destroy
        redirect_to beards_path
      end

    end
