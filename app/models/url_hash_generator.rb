class UrlHashGenerator
    def initialize()
        @key = nil
    end

    def unique_key
        while(@key == nil)
            new_key = generate_random_key
            if isUniqueKey?(new_key)
                @key = new_key
                break
            end
        end
        @key
    end

    def generate_random_key
        SecureRandom.urlsafe_base64(4)
    end

    private

    def find_duplicate(new_key)
        UrlBank.find_by(tiny_url: new_key)
    end

    def isUniqueKey?(new_key)
        find_duplicate(new_key).nil?
    end
end