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
    name = params[:name]
    amount = params[:amount]
    
    picks = params[:picks]
    picks.each do |category|
      @deductible.categories << category
    end
    @deductible.name = name
    @deductible.amount = amount

    if @deductible.save
      redirect_to("/categories/")
    else
      flash.alert = "one of the fields is invalid"
      redirect_to("/deductibles/create")
    end
  end

  def destroy
  end
end
