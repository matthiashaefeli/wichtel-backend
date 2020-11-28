class FotosController < ApplicationController
  before_action :authenticate_user!

  def home
    fotos = Foto.order(id: :desc)
    array = []
    fotos.each do |f|
      f_hash = f.as_json
      f_hash[:url] = url_for(f.main_image)
      array.push f_hash
    end
    render json: array
  end

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
