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
    @users = Election.find(params[:id]).users
  end

  def csv_users
    #If the user uploaded a file
    if(!params[:users].nil? && !params[:users][:csv].nil?)
      election = Election.find(params[:election_id]) #The election we want to add the users to
      myFile = params[:users][:csv] #The csv file the user uploaded

      #Loop over each user in the file
      CSV.foreach(myFile.path) do |userEmail|
        #If the user is NOT already a user in this election
        if(election.users.where(email: userEmail)[0].nil?)
          #Then add them to the election
          election.users << User.where(email: userEmail)
        end
    end
    redirect_to election_users_path, notice: "Users were added"
  end
  end

  def add_users
      if(!params[:new_user].nil?)
      election = Election.find(params[:election_id])
      user = User.where(email: params[:new_user]).first
      if(!user.nil? && !election.users.where(email: user.email).nil?)
      election.users << user
      return redirect_to election_users_path, notice: "User was added"
    end
    return redirect_to election_users_path, notice: "User was not added"
      end
  end

  # PATCH/PUT /elections/1
  # PATCH/PUT /elections/1.json
  def update
    pp "*********************"
    pp params[:election]
    pp "*******************"
    respond_to do |format|
      if @election.update_attributes(election_params[:id])
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
      params.fetch(:election, {}).permit(:title, :description, :election_id, :close_date)
    end
end
