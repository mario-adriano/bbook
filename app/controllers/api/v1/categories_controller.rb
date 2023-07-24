# typed: strict
# frozen_string_literal: true

module Api
  module V1
    class CategoriesController < Api::V1::ApplicationController
      before_action :set_category, only: [:show, :update, :destroy]

      # GET /categories
      sig { void }
      def index
        categories = T.let(Category.all, ActiveRecord::Relation)
        render(json: categories)
      end

      # GET /categories/1
      sig { void }
      def show
        category = T.let(@category, Category)
        render(json: category)
      end

      # POST /categories
      sig { void }
      def create
        category = T.let(Category.new(category_params), Category)

        if category.save
          render(json: category, status: :created)
        else
          render(json: category.errors, status: :unprocessable_entity)
        end
      end

      # PATCH/PUT /categories/1
      sig { void }
      def update
        if @category.update(category_params)
          render(json: @category)
        else
          render(json: @category.errors, status: :unprocessable_entity)
        end
      end

      # DELETE /categories/1
      sig { void }
      def destroy
        @category.destroy
      end

      private

      sig { returns(ActionController::Parameters) }
      def category_params
        params.require(:category).permit(:name)
      end

      sig { void }
      def set_category
        @category = T.let(Category.find(params[:id]), T.untyped)
      rescue ActiveRecord::RecordNotFound
        render(json: { error: "Record not found" }, status: :not_found)
      end
    end
  end
end
