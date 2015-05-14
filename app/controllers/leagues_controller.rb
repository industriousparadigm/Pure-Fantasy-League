class LeaguesController < ApplicationController
  add_breadcrumb 'Leagues', :leagues_path
  before_action :authenticate_user!, :require_admin!
  before_action :set_league, only: [:show, :edit, :update, :destroy]


  # GET /leagues
  def index
    @leagues = League.all
  end

  # GET /leagues/1
  def show
  end

  # GET /leagues/new
  def new
    add_breadcrumb 'Creating...'
    @league = League.new
  end

  # GET /leagues/1/edit
  def edit
    add_breadcrumb 'Editing...'
  end

  # POST /leagues
  def create
    add_breadcrumb 'Creating...'
    @league = League.new(league_params)

    if @league.save
      redirect_to @league, notice: 'League was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /leagues/1
  def update
    add_breadcrumb 'Editing...'
    if @league.update(league_params)
      redirect_to @league, notice: 'League was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /leagues/1
  def destroy
    @league.destroy
    redirect_to leagues_url, notice: 'League was successfully destroyed.'
  end


  private

    # Use callbacks to share common setup or constraints between actions.
    def set_league
      @league = League.find(params[:id])
      add_breadcrumb @league, @league
    end

    # Only allow a trusted parameter "white list" through.
    def league_params
      params.require(:league).permit(:title)
    end

end
