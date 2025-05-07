class ReadersController < ApplicationController
  before_action :set_reader, only: %i[ show edit update destroy ]

  # GET /readers or /readers.json
  def index
    @readers = Reader.all
  end

  # GET /readers/1 or /readers/1.json
  def show
  end

  # GET /readers/new
  def new
    @reader = Reader.new
  end

  # GET /readers/1/edit
  def edit
  end

  # POST /readers or /readers.json
  def create
    @reader = Reader.new(name: params[:reader][:name], email: params[:reader][:email], code: params[:reader][:code])

    respond_to do |format|
      if @reader.save
        format.html { redirect_to reader_url(@reader), notice: "Reader was successfully created." }
        format.json { render :show, status: :created, location: @reader }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @reader.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /readers/1 or /readers/1.json
  def update
    respond_to do |format|
      if @reader.update(name: params[:reader][:name], email: params[:reader][:email], code: params[:reader][:code])
        format.html { redirect_to reader_url(@reader), notice: "Reader was successfully updated." }
        format.json { render :show, status: :ok, location: @reader }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @reader.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /readers/1 or /readers/1.json
  def destroy
    @reader.destroy!

    respond_to do |format|
      format.html { redirect_to readers_url, notice: "Reader was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reader
      @reader = Reader.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def reader_params
      params.fetch(:reader, {})
    end
end
