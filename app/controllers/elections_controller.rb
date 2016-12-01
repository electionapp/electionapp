require 'csv'

class ElectionsController < ApplicationController
  before_action :require_login
  before_action :set_election, only: [:show, :edit, :update, :destroy]

  # GET /elections
  # GET /elections.json
  def index
    @elections = current_user.elections
  end

  def show
    @election = Election.find(params[:id])
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
    respond_to do |format|
      if @election.save
        @election.users << current_user #add the current user to the users for this election
        format.html { redirect_to user_elections_path, notice: 'Election was successfully created.' }
        format.json { render :show, status: :created, location: @election }
      else
        format.html { render :new }
        format.json { render json: @election.errors, status: :unprocessable_entity }
      end
    end
  end

  def show_users
    @users = Election.find(params[:election_id]).users
  end

  def csv_users
    pp "*************************"
    #If the user uploaded a file
    if(!params[:users].nil? && !params[:users][:csv].nil?)
      pp "IN IF"
      #The election we want to add the users to 
      election = Election.find(params[:election_id])
      #The csv file the user uploaded
      myFile = params[:users][:csv]
      #Loop over each user in the file
      CSV.foreach(myFile.path) do |user|
        pp user
        election.users << User.where(email: user)
    end
  end
    pp "***************************"
  end

  def add_users
    #Will need to create a loop to loop over each user being added
    pp "**********************"
    pp params[:election_id]
    pp "****************************"
    election = Election.find(election_params[:id]) #Find the election we want to add the users to
    election.users << User.find(election_params[:user_id])
    new_user = params[:new_user] #Find new user to add
    if election.users.include? new_user #If that user already exists
      format.html { redirect_to elections_url, notice: 'User Already Exists.' } #Do nothing
    else 
      election << new_user #Add new user
    end
  end

  # PATCH/PUT /elections/1
  # PATCH/PUT /elections/1.json
  def update
    respond_to do |format|
      if @election.update(election_params)
        format.html { redirect_to user_elections_path, notice: 'Election was successfully updated.' }
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
      params.fetch(:election, {}).permit(:title, :description, :election_id)
    end
end
