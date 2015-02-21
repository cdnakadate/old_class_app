class UsermailersController < ApplicationController
  before_action :set_usermailer, only: [:show, :edit, :update, :destroy]

  # GET /usermailers
  # GET /usermailers.json
  def index
    @usermailers = Usermailer.all
  end

  # GET /usermailers/1
  # GET /usermailers/1.json
  def show
  end

  # GET /usermailers/new
  def new
    @usermailer = Usermailer.new
  end

  # GET /usermailers/1/edit
  def edit
  end

  # POST /usermailers
  # POST /usermailers.json
  def create
    @usermailer = Usermailer.new(usermailer_params)
    @mail = @usermailer.email
    Notification.send_email(@mail).deliver
    respond_to do |format|
      if @usermailer.save
        format.html { redirect_to @usermailer, notice: 'Usermailer was successfully created.' }
        format.json { render :show, status: :created, location: @usermailer }
      else
        format.html { render :new }
        format.json { render json: @usermailer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /usermailers/1
  # PATCH/PUT /usermailers/1.json
  def update
    respond_to do |format|
      if @usermailer.update(usermailer_params)
        format.html { redirect_to @usermailer, notice: 'Usermailer was successfully updated.' }
        format.json { render :show, status: :ok, location: @usermailer }
      else
        format.html { render :edit }
        format.json { render json: @usermailer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /usermailers/1
  # DELETE /usermailers/1.json
  def destroy
    @usermailer.destroy
    respond_to do |format|
      format.html { redirect_to usermailers_url, notice: 'Usermailer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_usermailer
      @usermailer = Usermailer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def usermailer_params
      params.require(:usermailer).permit(:name, :email, :login)
    end
end
