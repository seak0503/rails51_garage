module Garage
  module HypermediaResponder
    def transform(resources)
      if resources.respond_to?(:map) && resources.respond_to?(:to_a)
        data = { data: resources.map {|resource| encode_to_hash(resource, partial: true) } }
        meta_data = {
          total_count: resources.count,
          total_pages: 1,
          current_page: 1,
          first_page: true,
          last_page: true,
          next_page: nil,
          prev_page: nil,
        }
        if resources.respond_to?(:total_count)
          meta_data[:total_count] = resources.total_count
          meta_data[:total_pages] = resources.total_pages
          meta_data[:current_page] = resources.current_page
          meta_data[:first_page] =  resources.first_page?
          meta_data[:last_page] = resources.last_page?
          meta_data[:next_page] = resources.next_page
          meta_data[:prev_page] = resources.prev_page
        end
        meta_data.merge(data)
      else
        encode_to_hash(resources)
      end
    end

  end
end