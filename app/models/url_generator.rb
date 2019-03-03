class UrlGenerator

    def initialize(actual_url)
        @actual_url = actual_url
        @new_url_entry = UrlBank.new(actual_url: @actual_url) 
    end

    def is_valid_url?
        @new_url_entry.valid?
    end

    def tiny_url
        if is_valid_url?
            return save_new_url_entry
        else
            return { 
                    actual_url: @actual_url, 
                    error: true, 
                    message: "Not a valid URL."
                }
        end
    end

    def save_new_url_entry
        @new_url_entry.tiny_url = UrlHashGenerator.new.unique_key
        if @new_url_entry.save
            return {
                    actual_url: @new_url_entry.actual_url,
                    tiny_url: @new_url_entry.tiny_url,
                    error: false
                }
        else
            return { 
                    actual_url: @actual_url, 
                    error: true, 
                    message: "Something went wrong, Couldn't create short url."
                }
        end
    end
end