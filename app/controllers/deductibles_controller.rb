class DeductiblesController < ApplicationController
  def index
  end

  def show
  end
  
  def creation
    @deductible = Deductible.new
  end

  def create
    @deductible = Deductible.new
    user = current_user
    @deductible.user_id = user.id
    temp = params[:deductible]
    name = temp[:name]
    amount = params[:amount]

    @deductible.name = name
    @deductible.amount = amount
    
    picks = params[:picks]
    if picks.nil?
      flash.alert = "you have to pick atleast one category"
      redirect_to("/deductibles/create")
    else
      picks.each do |category|
        true_category = Category.find(category)
        @deductible.categories << true_category
      end
  
      if @deductible.save
        redirect_to("/categories/")
      else
        flash.alert = "one of the fields is invalid"
        redirect_to("/deductibles/create")
      end
    end
  end

  def destroy
  end
end
