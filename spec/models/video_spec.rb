require 'spec_helper'

describe Video do
  it { should belong_to(:category) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:description) }

  describe ".search_by_title" do
  
    it "returns empty array if no match is found" do
      Video.create(title: "Mad Men", description: "American drama")
      Video.create(title: "Game of Thrones", description: "Science fiction")
      videos = Video.search_by_title("Walking Dead")
      expect(videos).to eq([])
    end

    it "returns an array of 1 video if exact match is found" do
      mad_men = Video.create(title: "Mad Men", description: "American drama")
      game_of_thrones = Video.create(title: "Game of Thrones", description: "Science fiction")
      videos = Video.search_by_title("Game of Thrones")
      expect(videos).to eq([game_of_thrones])
    end

    it "returns an array of 1 video if partial match is found" do
      mad_men = Video.create(title: "Mad Men", description: "American drama")
      game_of_thrones = Video.create(title: "Game of Thrones", description: "Science fiction")
      videos = Video.search_by_title("Thrones")
      expect(videos).to eq([game_of_thrones])
    end
    
    it "returns an array of all videos matched ordered by created_at" do
      mad_men = Video.create(title: "Mad Men of Thronos", description: "American drama")
      game_of_thrones = Video.create(title: "Game of Thrones", description: "Science fiction")
      videos = Video.search_by_title("Thron")
      expect(videos).to eq([game_of_thrones, mad_men])
    end

    it "returns an empty array if search term is an empty string" do
      mad_men = Video.create(title: "Mad Men of Thronos", description: "American drama")
      game_of_thrones = Video.create(title: "Game of Thrones", description: "Science fiction")
      videos = Video.search_by_title("")
      expect(videos).to eq([])
    end

  end


  describe "#average_rating" do
    
    it "returns 0 if there are no ratings" do
      video = Fabricate(:video)
      rating = video.average_rating
      expect(rating).to eq(0)
    end

    it "returns the rating if there is one rating" do
      video = Fabricate(:video)
      review = Fabricate(:review, rating: 1)
      video.reviews << review
      rating = video.average_rating
      expect(rating).to eq(1)
    end

    it "returns an average over all ratings if there is more than one rating" do
      video = Fabricate(:video)
      review1 = Fabricate(:review)
      review2 = Fabricate(:review)
      video.reviews = [review1, review2]
      
      calculated_rating = (review1.rating + review2.rating).to_f / video.reviews.count
      calculated_rating = calculated_rating.round(1)

      rating = video.average_rating
      expect(rating).to eq(calculated_rating)

    end

  end

end


