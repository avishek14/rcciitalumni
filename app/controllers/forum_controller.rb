class ForumController < ApplicationController
  def main
  	unless current_user
  		flash[:error] = "Only registered users may access the Open Forum."
  		return redirect_to root_path
  	end
  	@topics = Topic.all
  end

  def topic
  	unless current_user
  		flash[:error] = "Only registered users may access the Open Forum."
  		return redirect_to root_path
  	end

  	@topic = Topic.find params[:id]
  	@posts = Post.where topic_id: params[:id]
  end

  def post
  	unless current_user
  		flash[:error] = "Only registered users may access the Open Forum."
  		return redirect_to root_path
  	end
  end

  def new_post
  	unless current_user
  		flash[:error] = "Only registered users may access the Open Forum."
  		return redirect_to root_path
  	end
  end

  def new_reply
  end

  def create_reply
  	unless current_user
  		flash[:error] = "Only registered users may access the Open Forum."
  		return redirect_to root_path
  	end

  	Post.create title: params[:title], user_id: current_user.id, topic_id: params[:topic_id], content: params[:content]
  	redirect_to forum_topic_path(id: params[:topic_id])
  end

  def create_post
  	unless current_user
  		flash[:error] = "Only registered users may access the Open Forum."
  		return redirect_to root_path
  	end

  	topic = Topic.create title: params[:title], user_id: current_user.id
  	post = Post.create title: params[:title], content: params[:content], user_id: current_user.id, topic_id: topic.id

  	redirect_to forum_topic_path( id: topic.id)
  end
end
