class VisitorsController < ApplicationController
  def index
    @q = BookInstance.ransack(params[:q])
    @last_books = Book.order(created_at: :asc).last(6)
  end
end
