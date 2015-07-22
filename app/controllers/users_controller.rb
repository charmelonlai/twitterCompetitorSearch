class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  helper_method :search
  require 'csv'

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    @query = (params[:query])
    respond_to do |format|
      format.html
      format.json
      format.csv { send_data @users.to_csv, filename: "competitors-#{Date.today}.csv" }
    end
  end

  def twitter_client
    Twitter::REST::Client.new do |config|
      config.consumer_key = "8kCvnGwxy9krcTIxmzyIGOMqx"
      config.consumer_secret = "aaXmt7P6QHnPyHciKk1vbv8KT9unR5SnqbaRqjSYL64q4v3tCb"
      config.access_token = "3255900630-caSyr5fSnYyxLEhEYoMBA0eFO3w3HTYfoOn0NzF"
      config.access_token_secret = "Z6T4XJEzAjpJDRUA2MUYOF6Sl5DwuMZTL9FzQ1Lic1ZGb"
    end
  end

  def search
    query = params[:query]
    data = twitter_client.user_search(query,{include_entities: "1"})
    render :json => data
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to root_url, notice: 'User was successfully created.' }
        format.json { render :json => @user.as_json }
        format.js {}
      else
        format.html { render :new }
        format.json { render :json => @user.as_json, status: :unprocessable_entity }
        format.js {}
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to root_url, notice: 'User was successfully updated.' }
        format.json { render :json => @user.as_json }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :search, :competitor)
    end
end
