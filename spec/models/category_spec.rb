require 'spec_helper'

describe Category do
  
  it { should have_many(:videos) }

  describe "#recent_videos" do
    it "returns empty array if there are no videos" do
      category = Category.create(title: "Drama")
      videos = category.recent_videos
      expect(videos).to eq([])
    end

    it "returns all videos if there are less than 6 videos" do
      drama = Category.create(title: "Drama")
      game_of_thrones = Video.create(title: "Game of Thrones", description: "Sci fi series", category: drama)
      mad_men = Video.create(title: "Mad Men", description: "American history", category: drama)
      videos = drama.recent_videos
      expect(drama.videos).to eq(videos)
    end
    
    it "returns 6 videos if there are more than 6 videos" do
      drama = Category.create(title: "Drama")
      7.times do
        Video.create(title: "Mad Men", description: "American history", category: drama)
      end
      videos = drama.recent_videos
      expect(videos.count).to eq(6)
    end
   

    it "returns an array of videos sorted by created_at in descending order" do
      drama = Category.create(title: "Drama")
      game_of_thrones = Video.create(title: "Game of Thrones", description: "Sci fi series", category: drama, created_at: 1.day.ago)
      mad_men = Video.create(title: "Mad Men", description: "American history", category: drama)
      videos = drama.recent_videos
      expect(videos).to eq([mad_men, game_of_thrones])
    end
  end

end

