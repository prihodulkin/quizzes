class CategoriesController < ApiBaseController
    before_action :authenticate_user
    
    def index 
        categories=Category.all
        if categories.empty? 
            render status: :no_content
        else
            render json: categories
        end
    end
end