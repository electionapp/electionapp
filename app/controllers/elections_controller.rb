class ElectionsController < ApplicationController
  before_action :require_login
  before_action :set_election, only: [:show, :edit, :update, :destroy]

  # GET /elections
  # GET /elections.json
  def index
    # @elections = Election.all
    @elections = current_user.elections
  end

  def show
    @elections = Election.all
    # @elections = current_user.elections
  end

  # GET /elections/new
  def new
    @election = Election.new
  end

  # GET /elections/1/edit
  def edit
  end

  # POST /elections
  # POST /elections.json
  def create
    @election = Election.new(election_params)
    # @election.save
    # redirect_to 'http://localhost:3000'

    respond_to do |format|
      if @election.save
        @election.users << current_user
        format.html { redirect_to @election, notice: 'Election was successfully created.' }
        format.json { render :show, status: :created, location: @election }
      else
        format.html { render :new }
        format.json { render json: @election.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_users
  end


  # PATCH/PUT /elections/1
  # PATCH/PUT /elections/1.json
  def update
    respond_to do |format|
      if @election.update(election_params)
        format.html { redirect_to @election, notice: 'Election was successfully updated.' }
        format.json { render :show, status: :ok, location: @election }
      else
        format.html { render :edit }
        format.json { render json: @election.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /elections/1
  # DELETE /elections/1.json
  def destroy
    @election.destroy
    respond_to do |format|
      format.html { redirect_to elections_url, notice: 'Election was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_election
      rescue ActiveRecord::RecordNotFound  
       redirect_to :controller => "main", :action => "index"
       return
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def election_params
      params.fetch(:election, {}).permit(:title, :description)
    end
end
