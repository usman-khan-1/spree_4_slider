module Spree
  module Admin
    class SlidesController < ResourceController
      respond_to :html

      def index
        @slides = Spree::Slide.order(:position)
      end

      private

      def location_after_save
        if @slide.created_at == @slide.updated_at
          edit_admin_slide_url(@slide)
        else
          admin_slides_url
        end
      end

      def slide_params
        params.require(:slide).permit(:name, :link_url, :published, :image, :position)
      end
    end
  end
end
