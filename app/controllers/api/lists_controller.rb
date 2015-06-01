class Api::ListsController < ApplicationController

  def index
    @lists = List.order(:id)
    render json: @lists
  end

  def show
    @list = List.find(params[:id])
    render json: @list
  end
end
