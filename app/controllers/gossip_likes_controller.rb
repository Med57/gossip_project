class GossipLikesController < ApplicationController
  def new
  end

  def create
    @gossip_like = Gossip_like.create
  end

  def destroy
  end
end
