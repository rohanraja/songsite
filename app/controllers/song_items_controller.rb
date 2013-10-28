class SongItemsController < ApplicationController
  before_action :set_song_item, only: [:show, :edit, :update, :destroy]

  # GET /song_items
  # GET /song_items.json
  def index
    @song_items = SongItem.order("id DESC").all
  end

  # GET /song_items/1
  # GET /song_items/1.json
  def show
  end

  # GET /song_items/new
  def new
    @song_item = SongItem.new
  end

  # GET /song_items/1/edit
  def edit
  end

  # POST /song_items
  # POST /song_items.json
  def create
    @song_item = SongItem.new(song_item_params)

    respond_to do |format|
      if @song_item.save
        format.html { redirect_to @song_item, notice: 'Song item was successfully created.' }
        format.json { render action: 'show', status: :created, location: @song_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @song_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /song_items/1
  # PATCH/PUT /song_items/1.json
  def update
    respond_to do |format|
      if @song_item.update(song_item_params)
        format.html { redirect_to @song_item, notice: 'Song item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @song_item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /song_items/1
  # DELETE /song_items/1.json
  def destroy
    @song_item.destroy
    respond_to do |format|
      format.html { redirect_to song_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_song_item
      @song_item = SongItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def song_item_params
      params.require(:song_item).permit(:path, :title, :album, :artist, :genre)
    end
end
