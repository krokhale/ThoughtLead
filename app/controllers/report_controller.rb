require 'fastercsv'

class ReportController < ApplicationController
  
  before_filter :owner_login_required
  
  # example action to return the contents
  # of a table in CSV format
  def export_users
    users = User.find(:all)
    csv_string = FasterCSV.generate do |csv| 
      csv << ["login","display_name","email"]
      users.each do |u|
        csv << [u.login, u.display_name, u.email]
      end
    end
    send_data csv_string, :type => "text/plain", 
    :filename=>"export_users.csv", 
    :disposition => 'attachment'
  end
  
end