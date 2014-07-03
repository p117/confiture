class JarsController < ApplicationController
  before_filter :check_access

  def index
    @jars = Jar.all
  end
  def new
    @jar = Jar.new
  end
  def create
    @jar = Jar.new(jar_params)
    if @jar.save
      redirect_to @jar
    else
      render "new"
    end
  end
  def show 
    @jar = Jar.find(params[:id])
  end
  def edit
    @jar = Jar.find(params[:id])
  end
  def update
    @jar = Jar.find(params[:id])

    if @jar.update(params[:jar].permit(:price, :text))
        redirect_to @jar
      else
        render 'edit'
      end
  end
  def destroy
    @jar = Jar.find(params[:id])
    @jar.destroy
 
      redirect_to jars_path
    end
  def jar_params
    params.require(:jar).permit(:price, :text)
  end
end