class ShortUrlController < ApplicationController
    before_action :set_new_url_bank, only: [:index, :create]

    def index
    end

    def create
        @url = UrlGenerator.new(url_bank_params[:actual_url]).tiny_url
        
        if @url[:error]
            flash[:error] = @url[:message]
        else
            @short_url = short_url_with_host(@url[:tiny_url])
            flash[:error] = @url[:message]
        end

        render :index
    end

    def show
        redirect_to root_path if params[:tiny_url] == 'short_url'
        url_entry = UrlBank.find_by(tiny_url: params[:tiny_url])
        if url_entry
            @actual_url = url_entry.actual_url
            redirect_to @actual_url
        else
            @no_record_found = true
        end
    end
    
    private

        def set_new_url_bank
            @url_bank = UrlBank.new
        end
    
        def url_bank_params
            params.require(:url_bank).permit(:actual_url)
        end

        def short_url_with_host(tiny_url)
            "http://#{request.host_with_port}/#{tiny_url}"
        end
end
