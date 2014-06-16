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

end


