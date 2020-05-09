class CommentsController < ApplicationController
  def index
    @comments = Comment.all.order("created_at DESC")
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    comment = Comment.new(content: params[:content])

    if comment.save
      flash[:success] = "Le potin a été créé avec succès."
      redirect_to gossip_path(id: Gossip.find(gossip.id))
    else
      redirect_to gossip_path(id: Gossip.find(gossip.id))
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    comment = Comment.find(params[:id])

    if comment.update(content: params[:content])
      flash[:success] = "Le potin a été mis à jour avec succès."
      redirect_to gossip_path(id: comment.gossip.id)
    else
      render 'edit'
    end
  end

  # Delete a comment
  def destroy
    user_id = Comment.find(params[:id]).gossip.id
    Comment.find(params[:id]).delete
    redirect_to gossip_path(user_id)
  end
end
