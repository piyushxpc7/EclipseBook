import UIKit

class GenreSelectionViewController: UIViewController {
    // Array of genres
    let genres = ["Thriller", "Romance", "Sci-Fi", "Fantasy", "Mystery", "Non-Fiction", "Biography", "Horror"]
    var selectedGenres: Set<String> = [] // To keep track of selected genres

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    private func setupUI() {
        view.backgroundColor = .white // Set background color to white
        
        // Create a title label
        let titleLabel = UILabel()
        titleLabel.text = "Select Your Favorite Genres"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)

        // Create a stack view to hold genre buttons
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackView)

        // Create buttons for each genre
        for genre in genres {
            let button = createGenreButton(withTitle: genre)
            button.addTarget(self, action: #selector(genreButtonTapped(_:)), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }

        // Create Continue button
        let continueButton = UIButton(type: .system)
        continueButton.setTitle("Continue", for: .normal)
        continueButton.backgroundColor = UIColor.systemBlue
        continueButton.setTitleColor(.white, for: .normal)
        continueButton.layer.cornerRadius = 10
        continueButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.addTarget(self, action: #selector(continueButtonTapped), for: .touchUpInside)
        
        // Layout constraints for Continue button
        view.addSubview(continueButton)

        // Layout constraints for all elements
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),

            continueButton.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 30),
            continueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            continueButton.widthAnchor.constraint(equalToConstant: 200),
            continueButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

    private func createGenreButton(withTitle title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(white: 0.95, alpha: 1.0) // Light grey background
        button.layer.cornerRadius = 10
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18)
        
        return button
    }

    @objc private func genreButtonTapped(_ sender: UIButton) {
        guard let genreTitle = sender.title(for: .normal) else { return }

        if selectedGenres.contains(genreTitle) {
            // Deselect the genre
            selectedGenres.remove(genreTitle)
            sender.backgroundColor = UIColor(white: 0.95, alpha: 1.0) // Reset to light grey
            sender.setTitleColor(.black, for: .normal)
        } else {
            // Select the genre
            selectedGenres.insert(genreTitle)
            sender.backgroundColor = UIColor.darkGray // Change to dark color when selected
            sender.setTitleColor(.white, for: .normal) // Change text color to white
        }
    }

    @objc private func continueButtonTapped() {
        let nextScreenVC = authorpref() // Replace with your actual next screen's view controller class name
        navigationController?.pushViewController(nextScreenVC, animated: true)
    }
}
