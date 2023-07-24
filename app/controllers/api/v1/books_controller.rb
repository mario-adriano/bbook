# typed: strict
# frozen_string_literal: true

module Api
  module V1
    class BooksController < ApplicationController
      before_action :set_book, only: [:show, :update]

      # GET /books
      sig { void }
      def index
        books = T.let(Book.all, ActiveRecord::Relation)
        render(json: books)
      end

      # GET /books/:id
      sig { void }
      def show
        book = T.let(@book, Book)
        render(json: book)
      end

      # TODO: implement the create method

      # PATCH/PUT /books/1
      sig { void }
      def update
        if @book.update(book_params)
          render(json: @book)
        else
          render(json: @book.errors, status: :unprocessable_entity)
        end
      end

      # TODO: implement the destroy method

      private

      sig { returns(ActionController::Parameters) }
      def book_params
        params.require(:book).permit(:title, :description, :original_publication_year)
      end

      sig { void }
      def set_book
        @book = T.let(Book.find(params[:id]), T.untyped)
      rescue ActiveRecord::RecordNotFound
        render(json: { error: "Record not found" }, status: :not_found)
      end
    end
  end
end
