class ForumController < ApplicationController
  def main
  	unless current_user
  		flash[:error] = "Only registered users may access the Open Forum."
  		return redirect_to root_path
  	end

    set_title "Open Forum"

  	@topics = Topic.all
  end

  def topic
  	unless current_user
  		flash[:error] = "Only registered users may access the Open Forum."
  		return redirect_to root_path
  	end

  	@topic = Topic.find params[:id]
  	@posts = Post.where( topic_id: params[:id] ).order( 'updated_at ASC')

    set_title @topic.title
  end

  def post
  	unless current_user
  		flash[:error] = "Only registered users may access the Open Forum."
  		return redirect_to root_path
  	end

    set_title 'New Post'
  end

  def new_post
  	unless current_user
  		flash[:error] = "Only registered users may access the Open Forum."
  		return redirect_to root_path
  	end
  end

  def new_reply
    unless current_user
      flash[:error] = "Only registered users may access the Open Forum."
      return redirect_to root_path
    end

    set_title 'Reply to Post'
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
  	post = Post.create title: params[:title], content: params[:content], user_id: current_user.id, 
  		topic_id: topic.id, primary: true

  	redirect_to forum_topic_path( id: topic.id)
  end

  def delete_post
  	unless current_user
  		flash[:error] = "Only registered users may access the Open Forum."
  		return redirect_to root_path
  	end

  	post = Post.find(params[:id])
  	tid = post.topic.id

    unless post.user.id === current_user.id
      return redirect_to forum_topic_path(id: tid)
    end

  	if post.primary
  		Topic.find(tid).destroy

  		Post.where(topic_id: tid).each do |p|
  			p.delete
  		end
  		return redirect_to forum_main_path
  	else
  		post.delete
   	end
  	return redirect_to forum_topic_path(id: tid)
  end
end
