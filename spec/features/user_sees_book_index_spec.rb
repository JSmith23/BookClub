RSpec.describe "a visitor visits the book index page" do
  it 'should show a list of all books' do
    kristoff = Author.create(name: 'Jay Kristoff')
    illuminae = kristoff.books.create(title: 'Illuminae', pages: 608, year: 2015)
    obsidio = kristoff.books.create(title: 'Obsidio', pages: 621, year: 2018)
    gemina = kristoff.books.create(title: 'Gemina', pages: 665, year: 2016)

    visit "/books"

    expect(page).to have_content(kristoff.name)
    expect(page).to have_content(obsidio.title)
    expect(page).to have_content(gemina.title)
  end

  xit 'should show the statistics for each book on the page' do
    user_1 = User.create(name: "Renny Johnson")
    user_2 = User.create(name: "Tobi Lou")
    user_3 = User.create(name: "Athena Rogers")

    kaufman = Author.create(name: 'Amie Kaufman')
    kristoff = Author.create(name: 'Jay Kristoff')
    illuminae = Book.create(title: 'Illuminae', pages: 608, year: 2015)
    illuminae.authors << [kaufman,kristoff]
    review_1 = illuminae.reviews.create(title: 'Loved it!',
                            description: 'Instead of narrative, this book is presented through transcripts of interviews describing events, email conversations, reports, graphic elements.' ,
                            score: 5)
    review_2 = illuminae.reviews.create(title: 'Firefly Meets 2001: A Space Odyssey',
                            description: "Illuminae is like no other book I've ever read. It's told dossier-style, as a series of Instant-Message conversations, emails, interviews, and video transcriptions. And the rambling monologues of an ailing Artificial Intelligence system, BUT THAT'S PROBABLY NOT IMPORTANT.",
                            score: 3)
    review_3 = illuminae.reviews.create(title: 'Fast paced story',
                            description: 'Told through a series of case files, IM’s, emails, interviews, and more, Illuminae is a fast paced story about two regular teenagers forced to step up in order to save themselves and the ones they love.',
                            score: 5)

    user_1.reviews << review_1
    user_2.reviews << review_2
    user_3.reviews << review_3


    visit "/books"

    expect(page).to have_content("Total Reviews: 3")
    expect(page).to have_content("Average Rating: 4")
  end
end
