class BookmarksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_list, only: [:create, :destroy]


  def index
    @bookmarks = current_user.bookmarks
  end

  def create
    current_user.bookmarked_events << @event # Ajoute l'événement actuel aux signets de l'utilisateur
    redirect_to events_path, notice: "Event bookmarked successfully"
  end

  def destroy
    current_user.bookmarked_events.delete(@event) # Supprime l'événement actuel des signets de l'utilisateur
    redirect_to events_path, notice: "Event removed from bookmarks"
  end

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def set_bookmark
    @bookmark = current_user.bookmarks.find(params[:id])
  end
end
