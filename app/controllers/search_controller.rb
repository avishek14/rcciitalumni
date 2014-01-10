class SearchController < ApplicationController
  def search
  	unless current_user
  		return redirect_to root_path
  	end

    @departments = Department.all
  end

  def search_results
  	unless current_user
  		return redirect_to root_path
  	end

  	search_terms = params[:search_terms].split
  	@users = []

  	User.all.each do |u|
      if params[:search_terms].empty?
        if (params[:date][:year].empty? or u.yearofpassing.eql?(params[:date][:year].to_i)) and (params[:department].empty? or u.department_id.eql?(params[:department].to_i))
          @users.append u
        end
      else
  		  search_terms.each do |st|
  			 if u.fname.downcase.include? st.downcase or u.lname.downcase.include? st.downcase or u.email.downcase.include? st.downcase or u.phone === st.downcase
  			   	if (params[:date][:year].empty? or u.yearofpassing.eql?(params[:date][:year].to_i)) and (params[:department].empty? or u.department_id.eql?(params[:department].to_i))
             @users.append u
  				    break
            end
  			 end
  		  end
  	  end
    end
  end
end
