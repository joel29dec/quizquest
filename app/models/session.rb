class Session < ApplicationRecord
    belongs_to :user	    


    def category_id
        @category = Category.find_by(id: params[:id])
    
    end	    
end	