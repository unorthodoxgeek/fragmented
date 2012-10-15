module Fragmented
  class CacheManager
    
    def initialize(cache)
      @cache = cache
    end

    def build_fetch_list(objects, &block)
      fetch_list = []
      objects.each do |object|
        fetch_list << object unless @cache.exist?(cache_key(object, &block))
      end
      fetch_list
    end

    def cache_key(object, &block)
      if block_given?
        yield(object)
      else
        object
      end
    end

  end
end