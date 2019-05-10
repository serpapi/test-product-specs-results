describe "SerpApi Specs Results JSON" do

  describe "Specs results for Sceptre X505BV-FSR - 50 LED TV - 1080p" do

    before :all do
      @response = HTTP.get 'https://serpapi.com/search.json?engine=google_product&product=16618293882053925702&specs=true&source=test'
      @json = @response.parse
    end

    it "returns http success" do
      expect(@response.code).to be(200)
    end

    it "contains Specs results hash" do
      expect(@json["specs_results"]).to be_an(Hash)
    end

    describe "have first Specs result" do

      before :all do
        @first_result = @json["specs_results"]
      end

      it "is hash" do
        expect(@first_result).to be_an(Hash)
      end

      it "first key is `General`" do
        expect(@json["specs_results"].keys.first).to eq("General")
      end

      it "key `General` first name `Diagonal Size`" do
        expect(@first_result["General"][0]["name"]).to eq("Diagonal Size")
      end
      
      it "key `General` first text `50`" do
        expect(@first_result["General"][0]["text"]).to eq("50")
      end

    end

  end

end