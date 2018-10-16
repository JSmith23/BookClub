require 'rails_helper'

describe Book, type: :model do
  describe 'Relationship' do
    it { should have_many(:reviews) }
    it { should have_many(:book_authors) }
    it { should have_many(:authors).through(:book_authors) }
  end

  describe 'class methods' do
    describe".sort_by" do
      it "returns books sorted by average review score descending" do
      illuminae = Book.create(title: 'Illuminae', pages: 608, year: 2015)
      review_1 = illuminae.reviews.create(title: 'Loved it!',
                            description: 'Instead of narrative, this book is presented through transcripts of interviews describing events, email conversations, reports, graphic elements.' ,
                            score: 5)
      review_2 = illuminae.reviews.create(title: 'Firefly Meets 2001: A Space Odyssey',
                            description: "Illuminae is like no other book I've ever read. It's told dossier-style, as a series of Instant-Message conversations, emails, interviews, and video transcriptions. And the rambling monologues of an ailing Artificial Intelligence system, BUT THAT'S PROBABLY NOT IMPORTANT.",
                            score: 3)
      review_3 = illuminae.reviews.create(title: 'Fast paced story',
                            description: 'Told through a series of case files, IM’s, emails, interviews, and more, Illuminae is a fast paced story about two regular teenagers forced to step up in order to save themselves and the ones they love.',
                            score: 4)

      obsidio = Book.create(title: 'Obsidio', pages: 621, year: 2018)
      review_4 = obsidio.reviews.create(title: 'Absolute perfection. This is how finales are supposed to be written',
                          description: 'Wow. Where do I even begin? This is one of my favorite series of all time, and I was so eager and terrified to see it end.',
                          score: 5)
      review_5 = obsidio.reviews.create(title: "Don't tell me Science Fiction is dead",
                          description: 'A million stars for the BEST series finale I have ever read! I want everyone to read it so this review will be spoiler-free.',
                          score: 4)

      expect(Book.sort_by('avg_score', 'DESC')).to eq [illuminae, obsidio]
      end
    end

    describe 'top_rated_books' do
      xit 'returns 3 books with the highest average rating' do

      illuminae = Book.create(title: 'Illuminae', pages: 608, year: 2015)
      review_1 = illuminae.reviews.create(title: 'Loved it!',
                              description: 'Instead of narrative, this book is presented through transcripts of interviews describing events, email conversations, reports, graphic elements.' ,
                              score: 5)
      review_2 = illuminae.reviews.create(title: 'Firefly Meets 2001: A Space Odyssey',
                              description: "Illuminae is like no other book I've ever read. It's told dossier-style, as a series of Instant-Message conversations, emails, interviews, and video transcriptions. And the rambling monologues of an ailing Artificial Intelligence system, BUT THAT'S PROBABLY NOT IMPORTANT.",
                              score: 5)
      review_3 = illuminae.reviews.create(title: 'Fast paced story',
                              description: 'Told through a series of case files, IM’s, emails, interviews, and more, Illuminae is a fast paced story about two regular teenagers forced to step up in order to save themselves and the ones they love.',
                              score: 3)

      obsidio = Book.create(title: 'Obsidio', pages: 621, year: 2018)
      review_4 = obsidio.reviews.create(title: 'Absolute perfection. This is how finales are supposed to be written',
                            description: 'Wow. Where do I even begin? This is one of my favorite series of all time, and I was so eager and terrified to see it end.',
                            score: 5)
      review_5 = obsidio.reviews.create(title: "Don't tell me Science Fiction is dead",
                            description: 'A million stars for the BEST series finale I have ever read! I want everyone to read it so this review will be spoiler-free.',
                            score: 4)

      gemina = Book.create(title: 'Gemina', pages: 665, year: 2016)
      review_6 = gemina.reviews.create(title: 'Fun YA Fiction',
                            description: 'Yup, this book is pretty amazing. I felt like it was better than Illuminae in some ways.',
                            score: 5)

      review_7 = gemina.reviews.create(title: "If you liked Illuminae you'll like this book",
                            description: "Gemina is the second book in the Illuminae Files, and it was told in much the same vein as Illuminae. Where Illuminae took place on a series of spaceships, Gemina takes place at the Heimdall, a space station that sits on a seven-way rip in spacetime. The Heimdall is a wormhole generator and serves as the connection point between the ENTIRE CIVILIZED UNIVERSE and the outskirt systems, such as the Kerenza system.",
                            score: 5)

      review_8 = gemina.reviews.create(title: "A great addition to a fantastic series!",
                            description: "After I finished reading Illuminae, I had every intention of taking a short break before starting the next book in the trilogy, Gemina. But did I? OF COURSE NOT. On the day I finished it, I broke down and started Gemina.",
                            score: 5)

      amazonia = Book.create(title: "Amazonia", pages: 544, year: 2009)
      review_9 = amazonia.reviews.create(title: 'A Creative Framework With Continuous Action',
                            description: "This was my first James Rollins book and it was a page turning thriller. The conceptual framework that kept the action moving was most creative. On the negative side readers have to suspend reality with regard to much of the story line. However as a positive, the action is almost continuous so one doesn't really have the time - or the inclination - to reflect on the absurdities.",
                            score: 5)

      expect(Book.top_rated_books).to eq [amazonia, gemina, obsidio]
      end
    end
    describe 'bottom_rated_books' do
      xit 'returns 3 books with the highest average rating' do

      illuminae = Book.create(title: 'Illuminae', pages: 608, year: 2015)
      review_1 = illuminae.reviews.create(title: 'Loved it!',
                              description: 'Instead of narrative, this book is presented through transcripts of interviews describing events, email conversations, reports, graphic elements.' ,
                              score: 3)
      review_2 = illuminae.reviews.create(title: 'Firefly Meets 2001: A Space Odyssey',
                              description: "Illuminae is like no other book I've ever read. It's told dossier-style, as a series of Instant-Message conversations, emails, interviews, and video transcriptions. And the rambling monologues of an ailing Artificial Intelligence system, BUT THAT'S PROBABLY NOT IMPORTANT.",
                              score: 3)
      review_3 = illuminae.reviews.create(title: 'Fast paced story',
                              description: 'Told through a series of case files, IM’s, emails, interviews, and more, Illuminae is a fast paced story about two regular teenagers forced to step up in order to save themselves and the ones they love.',
                              score: 3)

      obsidio = Book.create(title: 'Obsidio', pages: 621, year: 2018)
      review_4 = obsidio.reviews.create(title: 'Absolute perfection. This is how finales are supposed to be written',
                            description: 'Wow. Where do I even begin? This is one of my favorite series of all time, and I was so eager and terrified to see it end.',
                            score: 5)
      review_5 = obsidio.reviews.create(title: "Don't tell me Science Fiction is dead",
                            description: 'A million stars for the BEST series finale I have ever read! I want everyone to read it so this review will be spoiler-free.',
                            score: 4)

      gemina = Book.create(title: 'Gemina', pages: 665, year: 2016)
      review_6 = gemina.reviews.create(title: 'Fun YA Fiction',
                            description: 'Yup, this book is pretty amazing. I felt like it was better than Illuminae in some ways.',
                            score: 4)

      review_7 = gemina.reviews.create(title: "If you liked Illuminae you'll like this book",
                            description: "Gemina is the second book in the Illuminae Files, and it was told in much the same vein as Illuminae. Where Illuminae took place on a series of spaceships, Gemina takes place at the Heimdall, a space station that sits on a seven-way rip in spacetime. The Heimdall is a wormhole generator and serves as the connection point between the ENTIRE CIVILIZED UNIVERSE and the outskirt systems, such as the Kerenza system.",
                            score: 4)

      review_8 = gemina.reviews.create(title: "A great addition to a fantastic series!",
                            description: "After I finished reading Illuminae, I had every intention of taking a short break before starting the next book in the trilogy, Gemina. But did I? OF COURSE NOT. On the day I finished it, I broke down and started Gemina.",
                            score: 4)

      amazonia = Book.create(title: "Amazonia", pages: 544, year: 2009)
      review_9 = amazonia.reviews.create(title: 'A Creative Framework With Continuous Action',
                            description: "This was my first James Rollins book and it was a page turning thriller. The conceptual framework that kept the action moving was most creative. On the negative side readers have to suspend reality with regard to much of the story line. However as a positive, the action is almost continuous so one doesn't really have the time - or the inclination - to reflect on the absurdities.",
                            score: 5)

      expect(Book.bottom_rated_books).to eq [illuminae, gemina, obsidio]
      end
    end
  end

  describe 'instance methods' do
    describe"average_review_rating" do
      xit "returns the average of review scores" do
      review_1 = Review.create(title: 'Loved it!',
                            description: 'Instead of narrative',
                            score: 5)
      review_2 = Review.create(title: 'Firefly Meets 2001: A Space Odyssey',
                            description: "Illuminae is like no other book I've ever read.",
                            score: 3)
      review_3 = Review.create(title: 'Fast paced story',
                            description: 'Told through a series of case files',
                            score: 4)
      illuminae = Book.create(reviews: [review_1, review_2, review_3], title: 'Illuminae', pages: 608, year: 2015)
      obsidio = Book.create(title: 'Obsidio', pages: 621, year: 2018)

      expect(obsidio.average_review_rating).to eq 0
      expect(illuminae.average_review_rating).to eq 4
      end
    end
  end
end
