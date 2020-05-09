class GossipsController < ApplicationController
  include ApplicationHelper

  before_action :authenticate_user, except: :index

  def index
    @gossips = Gossip.all
  end

  def new
    @gossip = Gossip.new
  end

  def create
    params.require(:gossip).permit(:title, :content)
    puts params.inspect
    @gossip = Gossip.new(title: params[:gossip][:title],
                            content: params[:gossip][:content],
                            user: current_user)
    if @gossip.save
      redirect_to gossips_path
    else
      render :new
    end
  end

  def show
    @gossip = Gossip.find(params[:id])
    @comments = Comment.all.order("created_at DESC")
    @comment =   Comment.new(content: "")
    puts "%" * 100
    puts params
    puts "%" * 100
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    params_goss = params.require(:gossip).permit(:title, :content)
    @gossip = Gossip.find(params[:id])
      if @gossip.update(params_goss) && @gossip.user == current_user
        redirect_to @gossip
      else
        render :edit
      end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    if @gossip.user == current_user
      @gossip.destroy
    end
    redirect_to gossips_path
  end

end
