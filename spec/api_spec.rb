require 'rails_helper'

RSpec.describe HomeController do
  describe 'pull_api_data_and_parse' do
    it 'returns correctly some data' do
      uri = URI('https://api.openweathermap.org/data/2.5/weather?q=london&appid=1&units=metric')
      response = Net::HTTP.get(uri)
      data = JSON.parse(response)

      expect(data).to be_kind_of(Hash)
      expect(data['name']).to eq('London')

      expect(data['weather'][0]['main']).to eq('Clouds')
      expect(data['weather'][0]['description']).to eq('few clouds')

      expect(data['main']['temp']).to eq(26.76)
      expect(data['main']['temp_min']).to eq(24.36)
      expect(data['main']['temp_max']).to eq(28.75)

      expect(data['sys']['sunrise']).to eq(1_658_635_935)
      expect(data['sys']['sunset']).to eq(1_658_692_886)

      expect(data['visibility']).to eq(10_000)
      expect(data['wind']['speed']).to eq(7.72)
    end
  end
end
