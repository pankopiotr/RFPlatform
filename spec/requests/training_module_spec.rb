require 'rails_helper'

RSpec.describe '/training_module', type: :request do
  # Pretty heavy specs, in real-life would consider running specs in parallel
  describe '/' do
    it 'returns paginated list of modules', :aggregated_failures, :slow do
      category_a = create(:category, name: 'A')
      category_z = create(:category, name: 'Z')
      course1 = create(:course, category: category_a)
      course2 = create(:course, category: category_z)
      tm_a = create(:training_module, name: 'A', courses: [course1])
      tm_z = create(:training_module, name: 'Z', courses: [course1])
      create_list(:training_module, 2, courses: [course2])

      get '/training_modules/?per_page=2&page=1'

      parsed_response_body = JSON.parse(response.body)
      expect(parsed_response_body.size).to eq(2)
      expect(parsed_response_body.first['id']).to eq(tm_a.id)
      expect(parsed_response_body.second['id']).to eq(tm_z.id)
    end

    it 'returns success status code' do
      get '/training_modules/'

      expect(response).to have_http_status(:success)
    end
  end

  describe '/top10' do
    it 'returns ten most popular modules', :aggregated_failures, :slow do
      most_popular_tm = create(:training_module, :with_activities, activities_count: 2)
      create_list(:training_module, 10, :with_activities, activities_count: 1)

      get '/training_modules/top10'

      parsed_response_body = JSON.parse(response.body)
      expect(parsed_response_body.size).to eq(10)
      expect(parsed_response_body.first['id']).to eq(most_popular_tm.id)
    end

    it 'returns success status code' do
      get '/training_modules/top10'

      expect(response).to have_http_status(:success)
    end
  end
end
