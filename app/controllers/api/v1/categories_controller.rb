# typed: true
# frozen_string_literal: true

module Api
  module V1
    class CategoriesController < Api::V1::ApplicationController
      before_action :set_category, only: [:show, :update, :destroy]

      rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

      # GET /categories
      def index
        @categories = Category.all
        render(json: @categories)
      end

      # GET /categories/1
      def show
        render(json: @category)
      end

      # POST /categories
      def create
        @category = Category.new(category_params)

        if @category.save
          render(json: @category, status: :created)
        else
          render(json: @category.errors, status: :unprocessable_entity)
        end
      end

      # PATCH/PUT /categories/1
      def update
        if @category.update(category_params)
          render(json: @category)
        else
          render(json: @category.errors, status: :unprocessable_entity)
        end
      end

      # DELETE /categories/1
      def destroy
        @category.destroy
      end

      private

      sig { returns(ActionController::Parameters) }
      def category_params
        params.require(:category).permit(:name)
      end

      sig { returns(Category) }
      def set_category
        @category = Category.find(params[:id])
      end

      sig { returns(T.untyped) }
      def record_not_found
        render(json: { error: "Record not found" }, status: :not_found)
      end
    end
  end
end
