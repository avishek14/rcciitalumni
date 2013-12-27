class SearchController < ApplicationController
  def search
  	unless current_user
  		return redirect_to root_path
  	end
  end

  def search_results
  	unless current_user
  		return redirect_to root_path
  	end

  	search_terms = params[:search_terms].split
  	@users = []

  	User.all.each do |u|
  		search_terms.each do |st|
  			if u.fname.downcase.include? st.downcase or u.lname.downcase.include? st.downcase or u.email.downcase.include? st.downcase or u.phone === st.downcase
  				@users.append u
  				break
  			end
  		end
  	end
  end
end
