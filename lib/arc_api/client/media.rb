module ArcApi
  class Client < Footrest::Client
    module Media
      def initiate_media_upload(params = {})
        post(API_PATH + MEDIA_PATH + UPLOADS_PATH, params)
      end

      def upload_file(params = {})
        ext = File.extname(params[:file_path]).gsub!('.', '')
        conn = Faraday.new do |f|
          f.headers['Content-Type'] = "video/#{ext}"
          f.request :multipart
          f.request :url_encoded
          f.adapter :httpclient
        end

        file = Faraday::UploadIO.new(params[:file_path], "video/#{ext}")
        response = conn.put(params[:url], file)

        return response.to_hash[:url].to_s
      rescue StandardError => e
        raise "File upload failed - #{e}"
      end

      def create_media(params = {})
        post(API_PATH + MEDIA_PATH, params)
      end

      def complete_media_upload(params = {})
        post(API_PATH + MEDIA_PATH + UPLOADS_PATH + "/#{params[:id]}" + COMPLETE_PATH, params)
      end
    end
  end
end
