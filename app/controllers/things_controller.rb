class ThingsController < ApplicationController
  def edit
    @thing = Thing.find(params[:id])
  end

  def update
    @thing = Thing.find(params[:id])
    @thing.update(thing_params)
    if @thing.save
      respond_to do |format|
        format.html
      end
    else
      flash[:alert] = "Oops, your thing could not be saved: " + @thing.errors.collect{|k,v| "#{k} #{v}"}.join(", ")
      redirect_to edit_thing_path(@thing)
    end
  end

  def thing_params
    params.require(:thing).permit(:name, :age)
  end
end