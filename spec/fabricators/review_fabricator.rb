Fabricator(:review) do
  content { Faker::Lorem.paragraph(1) }
  rating { [1,2,3,4,5].sample }
end
