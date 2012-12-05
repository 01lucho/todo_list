class ListsController < ApplicationController
  def index
    @incomplete_lists = List.incomplete_lists
    @complete_lists = List.complete_lists
  end
  
  def new
    @list = List.new
  end

  def create
   @list = List.create!(params[:list])
   respond_to do |format|
      format.html { redirect_to lists_path}
      format.js
   end
  end

  def update
    @list = List.find(params[:id])
    @list.update_attributes!(params[:list])
    respond_to do |format|
      format.html { redirect_to lists_url}
      format.js
   end
  end

  def destroy
    @list = List.destroy(params[:id])
    respond_to do |format|
      format.html { redirect_to lists_url}
      format.js
   end
  end

end
