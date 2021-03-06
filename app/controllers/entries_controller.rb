class EntriesController < ApplicationController
  before_action :set_entry, only: [:show, :edit, :update, :destroy]
  before_action :load_strategies, only: [:new, :edit, :create]
  before_action :load_setups, only: [:new, :edit, :create]
  before_action :load_symbols, only: [:new, :edit, :create]

  # GET /entries
  # GET /entries.json
  def index
    @entries = Entry.all
    @open_entries = Entry.where(close_date: nil)
    @closed_entries = Entry.where.not(close_date: nil)
  end

  # GET /entries/1
  # GET /entries/1.json
  def show
  end

  # GET /entries/new
  def new
    @entry = Entry.new(open_date: DateTime.now, risk_in_r: 1)
  end

  # GET /entries/1/edit
  def edit
  end

  # POST /entries
  # POST /entries.json
  def create
    @entry = Entry.create(entry_params)
    respond_to do |format|
      if @entry.save
        format.html { redirect_to entries_url, notice: 'Entry was successfully created.' }
        format.json { render :show, status: :created, location: @entry }
      else
        format.html { render :new }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /entries/1
  # PATCH/PUT /entries/1.json
  def update
    respond_to do |format|
      if @entry.update(entry_params)
        format.html { redirect_to entries_url, notice: 'Entry was successfully updated.' }
        format.json { render :show, status: :ok, location: @entry }
      else
        format.html { render :edit }
        format.json { render json: @entry.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /entries/1
  # DELETE /entries/1.json
  def destroy
    @entry.destroy
    respond_to do |format|
      format.html { redirect_to entries_url, notice: 'Entry was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def load_setups
      @setups = Setup.all
    end

    def load_symbols
      @instruments = Instrument.all
    end

    def load_strategies
      @strategies = Strategy.all
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_entry
      @entry = Entry.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def entry_params
      params.require(:entry).permit(:title, :instrument_id, :content, :open_date, :close_date, :setup_id, :strategy_id, :risk_in_amount)
    end
end
