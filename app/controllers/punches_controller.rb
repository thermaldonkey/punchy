class PunchesController < ApplicationController
  def index
    @punches = policy_scope(Punch)
  end

  def new
    @punch = Punch.new
    @current_user_dept = current_user.department
    @current_user_initials = current_user.initials
  end

  def create
    if Punch.create(punches_params)
      flash[:notice] = "Punched!"
      redirect_to action: :index
    else
      render :new
    end
  end

  private

    def punches_params
      params.require(:punch).permit(
        :current_date,
        :department,
        :initials,
        :week_end_date,
        :issue,
        :description,
        :start_time,
        :end_time,
        :activity,
        :notes,
        :user_id,
      )
    end
end
