class FotosController < ApplicationController
  def index
    @fotos = Foto.all
  end

  def new
    @foto = Foto.new
  end

  def create
    @foto = Foto.new(foto_params)
    if @foto.save
      redirect_to fotos_path
    else
      render 'new'
    end
  end

  def destroy
    foto = Foto.find(params[:id])
    foto.main_image.purge
    foto.delete
    redirect_to fotos_path
  end

  private

  def foto_params
    params.require(:foto).permit(:title, :main_image)
  end
end
