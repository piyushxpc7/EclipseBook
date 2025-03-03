import UIKit

class BookSupportViewController: UIViewController {
    
    private let caseSections = ["Open Cases", "Closed Cases"]
    private let books = [
        [
            ["title": "Harry Potter", "image": "b5"],
            ["title": "Mockingbird", "image": "b2"],
            ["title": "1984", "image": "b3"]
        ],
        [
            ["title": "Whiplash", "image": "b9"],
            ["title": "Oceania", "image": "b8"]
        ]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    private func setupUI() {
         view.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
         
         // Title label
         let titleLabel = UILabel()
         titleLabel.text = "Book Support"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 28)

        
         titleLabel.textAlignment = .center
         titleLabel.translatesAutoresizingMaskIntoConstraints = false
         view.addSubview(titleLabel)
         
         // ScrollView setup
         let scrollView = UIScrollView()
         scrollView.translatesAutoresizingMaskIntoConstraints = false
         view.addSubview(scrollView)
         
         // StackView for organizing sections
         let stackView = UIStackView()
         stackView.axis = .vertical
         stackView.spacing = 20
         stackView.translatesAutoresizingMaskIntoConstraints = false
         scrollView.addSubview(stackView)
         
         // Constraints for Title, ScrollView, and StackView
         NSLayoutConstraint.activate([
             titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
             titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
             
             scrollView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
             scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
             scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
             scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
             
             stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
             stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
             stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
             stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
             stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32)
         ])
         
         // Add sections for Open Cases and Closed Cases
         for (index, section) in caseSections.enumerated() {
             // Section label
             let sectionLabel = UILabel()
             sectionLabel.text = section
             sectionLabel.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
             sectionLabel.textAlignment = .left
             sectionLabel.translatesAutoresizingMaskIntoConstraints = false
             stackView.addArrangedSubview(sectionLabel)
             
             // Add books as cards in each section
             let booksStackView = UIStackView()
             booksStackView.axis = .vertical
             booksStackView.spacing = 15
             booksStackView.translatesAutoresizingMaskIntoConstraints = false
             stackView.addArrangedSubview(booksStackView)
             
             for book in books[index] {
                 if let title = book["title"], let imageName = book["image"] {
                     let bookCard = createBookCard(title: title, imageName: imageName)
                     booksStackView.addArrangedSubview(bookCard)
                 }
             }
         }
     }
     
     // Helper to create book card with image, title, and chat button
     private func createBookCard(title: String, imageName: String) -> UIView {
         let cardView = UIView()
         cardView.backgroundColor = .white
         cardView.layer.cornerRadius = 15
         cardView.layer.shadowColor = UIColor.black.cgColor
         cardView.layer.shadowOffset = CGSize(width: 0, height: 2)
         cardView.layer.shadowOpacity = 0.2
         cardView.layer.shadowRadius = 4
         cardView.translatesAutoresizingMaskIntoConstraints = false
         
         // Image view for the book cover
         let bookImageView = UIImageView()
         bookImageView.image = UIImage(named: imageName) // Set the specific image for the book
         bookImageView.contentMode = .scaleAspectFill
         bookImageView.clipsToBounds = true
         bookImageView.layer.cornerRadius = 10
         bookImageView.translatesAutoresizingMaskIntoConstraints = false
         cardView.addSubview(bookImageView)
         
         // Title label for the book
         let titleLabel = UILabel()
         titleLabel.text = title
         titleLabel.font = UIFont(name: "SFPro-Regular", size: 18)
         titleLabel.textColor = .black
         titleLabel.translatesAutoresizingMaskIntoConstraints = false
         cardView.addSubview(titleLabel)
         
         // Chat button
         let chatButton = UIButton(type: .system)
         chatButton.setImage(UIImage(systemName: "message"), for: .normal)
         chatButton.tintColor = UIColor.systemBlue
         chatButton.translatesAutoresizingMaskIntoConstraints = false
         cardView.addSubview(chatButton)
         
         // Constraints for the image, title, and chat button
         NSLayoutConstraint.activate([
             cardView.heightAnchor.constraint(equalToConstant: 100),
             
             bookImageView.leadingAnchor.constraint(equalTo: cardView.leadingAnchor, constant: 10),
             bookImageView.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
             bookImageView.widthAnchor.constraint(equalToConstant: 60),
             bookImageView.heightAnchor.constraint(equalToConstant: 80),
             
             titleLabel.leadingAnchor.constraint(equalTo: bookImageView.trailingAnchor, constant: 16),
             titleLabel.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
             
             chatButton.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: -16),
             chatButton.centerYAnchor.constraint(equalTo: cardView.centerYAnchor),
             chatButton.widthAnchor.constraint(equalToConstant: 30),
             chatButton.heightAnchor.constraint(equalToConstant: 30)
         ])
         
         return cardView
     }
 }
