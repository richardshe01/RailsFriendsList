class FriendTablesController < ApplicationController
  before_action :set_friend_table, only: %i[ show edit update destroy ]
  #if not authenticated, dont let them do anything except see index and show page
  before_action :authenticate_user!, except: [:index, :show]
  #make sure if correct user, only for pages where one can edit update and destroy
  before_action :correct_user, only: [:edit, :update, :destroy]

  # GET /friend_tables or /friend_tables.json
  def index
    @friend_tables = FriendTable.all
  end

  # GET /friend_tables/1 or /friend_tables/1.json
  def show
  end

  # GET /friend_tables/new
  def new
    #@friend_table = FriendTable.new
    #tf is this
    @friend_table = current_user.friend_tables.build
  end

  # GET /friend_tables/1/edit
  def edit
  end

  # POST /friend_tables or /friend_tables.json
  def create
    #@friend_table = FriendTable.new(friend_table_params)
    #wtf is this
    @friend_table = current_user.friend_tables.build(friend_table_params)

    respond_to do |format|
      if @friend_table.save
        format.html { redirect_to @friend_table, notice: "Friend table was successfully created." }
        format.json { render :show, status: :created, location: @friend_table }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @friend_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friend_tables/1 or /friend_tables/1.json
  def update
    respond_to do |format|
      if @friend_table.update(friend_table_params)
        format.html { redirect_to @friend_table, notice: "Friend table was successfully updated." }
        format.json { render :show, status: :ok, location: @friend_table }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @friend_table.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friend_tables/1 or /friend_tables/1.json
  def destroy
    @friend_table.destroy
    respond_to do |format|
      format.html { redirect_to friend_tables_url, notice: "Friend table was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @friend_table = current_user.friend_tables.find_by(id: params[:id])
    redirect_to friend_tables_path, notice: "Not Authorized to Edit" if @friend_table.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend_table
      @friend_table = FriendTable.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friend_table_params
      params.require(:friend_table).permit(:first_name, :last_name, :email, :age, :user_id)
    end
end
