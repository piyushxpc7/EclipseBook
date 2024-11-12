import SwiftUI
struct ExploreView: View {
    @State private var searchText = ""
    @State private var isSwipeScreenPresented = false
    @State private var isFullScreenPresented = false
   
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                SearchBar(searchText: $searchText)
                
                BackgroundCard(title: "New Releases 📖", description: "Discover the latest additions to our collection.", color: Color.white.opacity(0.9)) {
                    NewReleasesView()
                }
                
                GenreSelectionView(genres: genres)
                    .padding(.leading, 15)
                
                BackgroundCard(title: "Swipe to Find the Perfect Book", description: "Swipe through books and find your perfect match. ❤️", color: Color.white.opacity(0.9)) {
                    SwipeCard(books: books)
                }
                .padding(.top, 10)
                .padding(.bottom, 10)
                .onTapGesture {
                    isSwipeScreenPresented = true
                }
                .fullScreenCover(isPresented: $isSwipeScreenPresented) {
                    SwipeScreenWrapper()
                        .ignoresSafeArea() // To present in full screen
                }
            
            
            

                BackgroundCard(title: "Featured Authors ✍🏽", description: "Meet the brilliant minds behind your favorite books.", color: Color.white.opacity(0.9)) {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            ForEach(authors, id: \.name) { author in
                                AuthorCardExplore(author: author)
                            }
                        }
                        .padding(.horizontal)
                    }
                }

                BackgroundCard(title: "From Book to the Screen 🎬", description: "Spoiler Alert: The Book is ALWAYS better.", color: Color.white.opacity(0.6)) {
                    Booktofilm()
                }
                .padding(.bottom, 20)

               
                
                BackgroundCard(title: "Tastemaker Picks 🌟", description: "Book recommendations from cultural icons", color: Color.white.opacity(0.9)) {
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        HStack(spacing: 20) {
                                            ForEach(famousPeople, id: \.name) { person in
                                                FamousPersonCard(
                                                    famousPersonImage: person.famousPersonImage,
                                                    description: person.description,
                                                    name: person.name,
                                                    title: person.title
                                                )
                                            }
                                        }
                                        .padding(.horizontal)
                                        .padding(.vertical, 8)
                                    }
                                }

                // Best Sellers Section
                               BackgroundCard(title: "Best Sellers 📚", description: "Discover the best-selling books in the app.", color: Color.white.opacity(0.9)) {
                                   BestSellersView(books: books)
                               }
                               .padding(.top, 20)

                               // New York Times Best Sellers Section
                               BackgroundCard(title: "NY Times Best Sellers🗽", description: "Best Selling New York Times Books", color: Color.white.opacity(0.4)) {
                                   NYTimesBestSellersView(books: books) // Assuming similar structure to BestSellersView
                               }

                               // Inspiring Reads Section
                QuizPromptView()
                    .padding(.leading, 10)
                    .padding(.bottom, 20)
                               BackgroundCard(title: "Inspiring Reads 🚀", description: "Reads that inspire and motivate.", color: Color.white.opacity(0.4)) {
                                   InspiringReadsView(books: books) // Assuming similar structure to BestSellersView
                               }
                
                               // Must Reads Section
                               BackgroundCard(title: "Must Reads 💯", description: "Essential books that you must read.", color: Color.white.opacity(0.4)) {
                                   MustReadsView(books: books) // Assuming similar structure to BestSellersView
                               }
                           }
                           .padding(.bottom)
                       }
        .navigationTitle("Explore")
                       .padding(.bottom)
                   }
               }

// Updated AuthorCardExplore to better match the overall design
struct AuthorCardExplore: View {
    var author: Author
    
    var body: some View {
        NavigationLink(destination: AuthorProfileViewControllerRepresentable(author: author)) {
            // Existing AuthorCardExplore view content
            VStack {
                Image(author.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 120, height: 160)
                    .cornerRadius(10)
                    .clipped()
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
                
                Text(author.name)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .padding(.top, 8)
                    .padding(.horizontal, 5)
                
                Text(author.bio)
                    .font(.caption)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .padding(.horizontal, 5)
                    .padding(.top, 2)
            }
            .frame(width: 140)
            .padding(10)
            .background(Color.white)
            .cornerRadius(12)
            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
        }
    }
}

struct SearchBar: View {
    @Binding var searchText: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .padding(.leading, 10)

            TextField("Search Books...", text: $searchText)
                .padding(10)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(8)
                .padding(.leading, 5)
                .padding(.trailing, 10)
        }
        .padding()
    }
}

struct BackgroundCard<Content: View>: View {
    var title: String
    var description: String
    var color: Color
    var content: () -> Content

    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title2)
                .fontWeight(.bold)
                .padding(.horizontal)

            Text(description)
                .font(.subheadline)
                .foregroundColor(.gray)
                .padding(.horizontal)

            content()
                .padding(.top)
        }
        .padding()
        .background(color)
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
        .padding(.horizontal)
    }
}

struct NewReleasesView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(books, id: \.id) { book in
                    BookCard(book: book)
                }
            }
            .padding(.horizontal)
        }
    }
}

struct Booktofilm: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(books, id: \.id) { book in
                    BookCard(book: book)
                }
            }
            .padding(.horizontal)
        }
    }
}


struct BestSellersView: View {
    var books: [Book]

    var body: some View {
        let rows = [
            GridItem(.flexible()),
            GridItem(.flexible())
        ]
        
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows, alignment: .top, spacing: 10) {
                ForEach(books) { book in  // Updated to use implicit `id`
                    NavigationLink(destination: BookPageRepresentable(book: book)) {
                        BookCard(book: book)
                            .frame(width: 150)
                            .padding(.vertical, 10)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}
struct GenreSelectionView: View {
    var genres: [String]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("Browse Genres")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color(.black))
                .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(genres, id: \.self) { genre in
                        GenreOptionButton(genre: genre)
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.top, 10)
    }
}

struct GenreOptionButton: View {
    var genre: String

    var body: some View {
        Text(genre)
            .fontWeight(.bold)
            .padding(10)
            .foregroundColor(.white)
            .background(
                LinearGradient(gradient: Gradient(colors: [
                    Color(red: 0.0, green: 92/255, blue: 120/255),  // Lighter version of #005C78
                    Color(red: 0.0, green: 122/255, blue: 149/255)  // Lighter version of #007A95
                ]), startPoint: .leading, endPoint: .trailing)
                .opacity(0.9) // Keep some opacity for the gradient
            )
            .cornerRadius(15)
            .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 2)
            .overlay(
                RoundedRectangle(cornerRadius: 15)
                    .stroke(Color.white.opacity(0.6), lineWidth: 1) // Slightly more opaque for better visibility
            )
            .scaleEffect(1.05)
            .animation(.easeInOut(duration: 0.2), value: true) // Subtle scale animation on tap
            .onTapGesture {
                // Optional: Add an action for when the button is tapped
                print("\(genre) tapped")
            }
    }
}


struct FeaturedAuthorsView: View {
    let authors: [Author]

    var body: some View {
        VStack(alignment: .leading) {
            Text("Featured Authors ✍🏽")
                .font(.headline)
                .padding(.horizontal)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(authors, id: \.name) { author in
                        AuthorCardExplore(author: author)
                    }
                }
                .padding(.horizontal)
            }
        }
        .padding(.top)
        .padding(.bottom)
    }
}
struct QuizPromptView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(spacing: 10) {
                Image(systemName: "lightbulb.fill")
                    .font(.largeTitle)
                    .foregroundColor(.yellow)
                Text("Not Sure What Book to Read?")
                    .font(.title2)
                    .fontWeight(.bold)
            }

            Text("Take a quick quiz to get personalized recommendations!")
                .font(.subheadline)
                .foregroundColor(.gray)

            NavigationLink(destination: QuizView()) {
                Text("Start Quiz")
                    .fontWeight(.bold)
                    .padding(10)
                    .frame(width: 120)
                    .background(Color("#005C78"))
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.top, 10)
        }
        .padding(20)
        .padding(.leading, 10)
        .padding(.trailing, 10)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}

struct QuizView: View {
    var body: some View {
        Text("Quiz goes here")
            .font(.largeTitle)
            .navigationTitle("Book Quiz")
    }
}

struct SwipeCard: View {
    var books: [Book]
    @State private var randomBooks: [Book] = []
    @State private var isAnimating = false

    var body: some View {
        VStack {
            HStack(spacing: 20) {
                ForEach(randomBooks.indices, id: \.self) { index in
                    VStack {
                        Image(randomBooks[index].imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 100, height: 150)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .rotationEffect(index == 0 ? .degrees(-10) : (index == 2 ? .degrees(10) : .degrees(0)))
                            .scaleEffect(isAnimating ? 1.1 : 1.0)

                        Text(randomBooks[index].title)
                            .font(.caption)
                            .foregroundColor(.gray)
                    }
                }
            }
            .onAppear {
                getRandomBooks()
                startAnimation()
            }
        }
        .padding(.horizontal)
    }

    func startAnimation() {
        withAnimation(.easeInOut(duration: 1).repeatForever()) {
            isAnimating.toggle()
        }
    }

    func getRandomBooks() {
        if books.count >= 3 {
            randomBooks = [books[0], books[1], books[2]]
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}


struct FamousPersonCard: View {
    let famousPersonImage: String
    let description: String
    let name: String
    let title: String

    var body: some View {
        NavigationLink(
            destination: FamousPersonProfileViewControllerRepresentable(
                famousPersonImage: famousPersonImage,
                description: description,
                name: name,
                title: title
            )
        ) {
            VStack(alignment: .leading, spacing: 0) {
                // Top section with famous person's image and gradient overlay
                ZStack(alignment: .bottomLeading) {
                    Image(famousPersonImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 280, height: 200)
                        .clipped()
                        .overlay(
                            LinearGradient(
                                gradient: Gradient(colors: [
                                    Color.black.opacity(0.8),
                                    Color.black.opacity(0.2)
                                ]),
                                startPoint: .bottom,
                                endPoint: .top
                            )
                        )

                    // Name and title overlay
                    VStack(alignment: .leading, spacing: 4) {
                        Text(name)
                            .font(.title3)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        Text(title)
                            .font(.subheadline)
                            .fontWeight(.medium)
                            .foregroundColor(.white.opacity(0.9))
                    }
                    .padding(.bottom, 16)
                    .padding(.horizontal, 16)
                }

                // Bottom section with description
                VStack(alignment: .leading, spacing: 12) {
                    Text(description)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .lineSpacing(4)
                        .lineLimit(3)
                        .multilineTextAlignment(.leading)
                }
                .padding(16)
                .background(Color.white)
            }
            .frame(width: 280)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: Color.black.opacity(0.1), radius: 10, x: 0, y: 2)
        }
    }
}

struct BookCard: View {
    var book: Book

    var body: some View {
        NavigationLink(destination: BookPageViewControllerRepresentable(book: book)) {
            VStack(alignment: .center, spacing: 0) {
                ZStack(alignment: .bottom) {
                    Image(book.imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 160)
                        .clipped()
                        .cornerRadius(8)
                        .shadow(radius: 3)
                    
                    LinearGradient(gradient: Gradient(colors: [Color.black.opacity(0.6), Color.clear]), startPoint: .bottom, endPoint: .top)
                        .frame(height: 40)
                        .cornerRadius(8)
                        .overlay(
                            Text(book.title)
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .padding(.bottom, 5),
                            alignment: .bottom
                        )
                }
                .frame(width: 120, height: 160)
            }
            .padding(10)
            .background(Color.white)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 2)
        }
    }
}


// MARK: - Supporting Views

struct ReviewCard: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            HStack {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.gray)
                
                VStack(alignment: .leading) {
                    Text("User Name")
                        .font(.headline)
                    
                    HStack {
                        ForEach(0..<5) { index in
                            Image(systemName: index < 4 ? "star.fill" : "star")
                                .foregroundColor(.yellow)
                                .font(.caption)
                        }
                        Text("· 2 months ago")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
            
            Text("Great book! The author's writing style is engaging and the plot keeps you guessing until the end. Highly recommended!")
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(12)
    }
}

struct WriteReviewSheet: View {
    let book: Book
    @Environment(\.dismiss) private var dismiss
    @State private var reviewText = ""
    @State private var rating = 0
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Rating")) {
                    HStack {
                        ForEach(1...5, id: \.self) { index in
                            Image(systemName: index <= rating ? "star.fill" : "star")
                                .foregroundColor(.yellow)
                                .onTapGesture {
                                    rating = index
                                }
                        }
                    }
                    .font(.title2)
                }
                
                Section(header: Text("Review")) {
                    TextEditor(text: $reviewText)
                        .frame(height: 150)
                }
            }
            .navigationTitle("Write a Review")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                
                ToolbarItem(placement: .confirmationAction) {
                    Button("Submit") {
                        // Add submit action
                        dismiss()
                    }
                    .disabled(reviewText.isEmpty || rating == 0)
                }
            }
        }
    }
}


// New York Times Best Sellers View
struct NYTimesBestSellersView: View {
    var books: [Book]

    var body: some View {
        VStack(alignment: .leading) {
//            Text("New York Times Best Sellers")
//                .font(.title2)
//                .fontWeight(.bold)
//                .padding(.bottom, 5)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(books, id: \.id) { book in
                        BookCard(book: book)
                            .frame(width: 150) // Customize width as needed
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

// Inspiring Reads View
struct InspiringReadsView: View {
    var books: [Book]

    var body: some View {
        VStack(alignment: .leading) {
//            Text("Inspiring Reads")
//                .font(.title2)
//                .fontWeight(.bold)
//                .padding(.bottom, 5)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(books, id: \.id) { book in
                        BookCard(book: book)
                            .frame(width: 150) // Customize width as needed
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}


// Must Reads View
struct MustReadsView: View {
    var books: [Book]

    var body: some View {
        VStack(alignment: .leading) {
//            Text("Must Reads")
//                .font(.title2)
//                .fontWeight(.bold)
//                .padding(.bottom, 5)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(books, id: \.id) { book in
                        BookCard(book: book)
                            .frame(width: 150) // Customize width as needed
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}

extension Color {
    // Define custom colors using hex values
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        let r, g, b: Double
        
        // Check if hex is valid
        if hex.hasPrefix("#") {
            let start = hex.index(hex.startIndex, offsetBy: 1)
            let hexColor = String(hex[start...])
            
            var rgb: UInt64 = 0
            Scanner(string: hexColor).scanHexInt64(&rgb)
            
            r = Double((rgb >> 16) & 0xFF) / 255
            g = Double((rgb >> 8) & 0xFF) / 255
            b = Double(rgb & 0xFF) / 255
        } else {
            r = 0
            g = 0
            b = 0
        }
        
        self.init(red: r, green: g, blue: b)
    }
}
