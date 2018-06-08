module Garage
  module PaginatingResponder
    def paginate(rs)
      @options[:hard_limit] ||= 1000 if @options[:hide_total] # backward compat for hide_total

      if controller.params[:per_page].present?
        per_page = controller.params[:per_page]
      elsif @options[:per_page].present?
        per_page = @options[:per_page]
      end

      #per_page = controller.params[:per_page].to_i1 || @options[:per_page] == "all" || @options[:per_page] ].min

      rs = rs.page(controller.params[:page] || 1).per(per_page) if per_page.present?

      set_total_count(rs, per_page)

      # paginationしない時にエラーになるのとヘッダに情報はいらいなのでコメントアウトする
      #unless hide_total?
      #  controller.response.headers['X-List-TotalCount'] = total_count(rs).to_s
      #end

      # FIXME construct_links must be called after calling rs.total_count to avoid invalid count cache
      # paginationしない時にエラーになるのとヘッダに情報はいらいなのでコメントアウトする
      #construct_links(rs, per_page)

      if hide_total?
        if rs.offset_value > hard_limit
          rs = []
        elsif rs.offset_value + per_page > hard_limit
          rs = rs.slice 0, (hard_limit - rs.offset_value) # becomes Array here, and hope it's ok
        end
      end

      rs
    end
  end
end
