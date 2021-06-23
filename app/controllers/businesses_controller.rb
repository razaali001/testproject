class BusinessesController < ApplicationController

  before_action :authenticate_user!, except: [:index]
  before_action :set_business, only: [:show, :edit, :update, :destroy, :add_member, :create_member, :destroy_member]

  def index
    @businesses = Business.all.order('id ASC')
  end

  def show
  end

  def new
    @business = Business.new
  end

  def create
    @business = Business.new(my_params)
    if @business.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
  end

  def update

    if @business.update(my_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @business.destroy

    redirect_to root_path
  end

  def add_member
    @users = User.all
  end

  def create_member
    a = params[:user_ids]
    noEmptyids = a.reject { |c| c.empty? }

    if noEmptyids.present?
      noEmptyids.each do |val|
        @business_user = @business.users_businesses.create(user_id: val)
      end
    end
    redirect_to @business

  end

  def destroy_member
    ab = @business.users_businesses.find(params[:user_id])
    ab.destroy

    redirect_to request.referer
  end



  private
  def my_params
    params.require(:business).permit(:name, :description)
  end

  def set_business
    @business = Business.find(params[:id])
  end
end
