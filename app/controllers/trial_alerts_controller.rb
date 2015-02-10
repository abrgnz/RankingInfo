class TrialAlertsController < ApplicationController
  before_action :set_trial_alert, only: [:destroy]



  # DELETE /trials/1
  # DELETE /trials/1.json
  def destroy
    @trialAlert.destroy
    redirect_to dashboard_path
  end



  private
    def set_trial_alert
      @trialAlert = TrialAlert.find(params[:id])
    end



end
