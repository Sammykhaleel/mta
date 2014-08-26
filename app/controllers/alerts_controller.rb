class AlertsController < ApplicationController
   def index
    @alerts = current_user.alerts
   end
   
   def new
    @alert = Alert.new
   end

   def show
    @alert = current_user.alerts.find(params[:id])
    @train_name = @alert.service_name
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path
   end
  
  def create  
    @alert = Alert.new(alert_params)
    @alert.user_id = current_user.id
    respond_to do |format|
      if @alert.save
        format.html { redirect_to @alert, notice: 'alert was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def edit
    @alert= current_user.alerts.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    redirect_to root_path
  end

  def update
    @alert = Alert.find(params[:id])
    respond_to do |format|
      if @alert.update(alert_params)
        format.html { redirect_to @alert, notice: 'alert was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end
  
  def destroy
     @alert = Alert.find(params[:id])
    @alert.destroy
    respond_to do |format|
      format.html { redirect_to root_path, notice: 'Alert was successfully deleted.' }
    end
  end

  
private
    # Use callbacks to share common setup or constraints between actions.
    def set_alert
      @alert = alert.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def alert_params
      params.require(:alert).permit(:start, :end, :last_sent, :sms, :email, :user_id, :line_id, :service_name, :recipient_id)
    end
end
