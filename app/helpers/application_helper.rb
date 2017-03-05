module ApplicationHelper

  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])
    if alert
      alert_generator alert
    end
  end


  def alert_generator msg
    js add_gritter(msg, :title => "Start Side-Walkin!", :sticky => false)
  end
end
