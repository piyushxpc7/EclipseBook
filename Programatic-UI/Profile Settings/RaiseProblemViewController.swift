import UIKit

class RaiseProblemViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    private var image: UIImage?
    private var openCases: [[String: String]] = [
        // Sample data in Open Cases array
        ["title": "Harry Potter", "image": "harry_potter"],
        ["title": "Mockingbird", "image": "mockingbird"]
    ]
    
    private let bookTitleTextField = UITextField()
    private let descriptionTextField = UITextField()
    private let borrowerNameTextField = UITextField()
    private let uploadImageButton = UIButton(type: .system)
    private let submitButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        
        // Title Label
        let titleLabel = UILabel()
        titleLabel.text = "Report a Problem"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 28)
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        // Create Card View for the Form
        let formCardView = UIView()
        formCardView.backgroundColor = .white
        formCardView.layer.cornerRadius = 15
        formCardView.layer.shadowColor = UIColor.black.cgColor
        formCardView.layer.shadowOffset = CGSize(width: 0, height: 4)
        formCardView.layer.shadowOpacity = 0.1
        formCardView.layer.shadowRadius = 10
        formCardView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(formCardView)
        
        // Book Title Field
        bookTitleTextField.placeholder = "Book Title"
        bookTitleTextField.borderStyle = .roundedRect
        bookTitleTextField.translatesAutoresizingMaskIntoConstraints = false
        formCardView.addSubview(bookTitleTextField)
        
        // Description Field
        descriptionTextField.placeholder = "Description"
        descriptionTextField.borderStyle = .roundedRect
        descriptionTextField.translatesAutoresizingMaskIntoConstraints = false
        formCardView.addSubview(descriptionTextField)
        
        // Borrower's Name Field
        borrowerNameTextField.placeholder = "Borrower's Name"
        borrowerNameTextField.borderStyle = .roundedRect
        borrowerNameTextField.translatesAutoresizingMaskIntoConstraints = false
        formCardView.addSubview(borrowerNameTextField)
        
        /// Upload Image Button
        uploadImageButton.setTitle("Upload Image", for: .normal)
        uploadImageButton.setTitleColor(.white, for: .normal) // Set text color to white
        uploadImageButton.backgroundColor = UIColor(hex: "#005C78") // Use app theme color
        uploadImageButton.layer.cornerRadius = 10 // Round the corners for a softer look
        uploadImageButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16) // Make the text bold
        uploadImageButton.contentEdgeInsets = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20) // Add padding around the text
        uploadImageButton.translatesAutoresizingMaskIntoConstraints = false
        formCardView.addSubview(uploadImageButton)

        
        // Submit Button
        submitButton.setTitle("Submit", for: .normal)
        submitButton.backgroundColor = UIColor(hex: "#005C78")
        submitButton.layer.cornerRadius = 10
        submitButton.setTitleColor(.white, for: .normal)
        submitButton.addTarget(self, action: #selector(submitTapped), for: .touchUpInside)
        submitButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(submitButton)
        
        // Constraints for the elements
        NSLayoutConstraint.activate([
            // Title Label
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // Form Card View
            formCardView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            formCardView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            formCardView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            formCardView.heightAnchor.constraint(equalToConstant: 350),
            
            // Book Title Field
            bookTitleTextField.topAnchor.constraint(equalTo: formCardView.topAnchor, constant: 20),
            bookTitleTextField.leadingAnchor.constraint(equalTo: formCardView.leadingAnchor, constant: 16),
            bookTitleTextField.trailingAnchor.constraint(equalTo: formCardView.trailingAnchor, constant: -16),
            bookTitleTextField.heightAnchor.constraint(equalToConstant: 40),
            
            // Description Field
            descriptionTextField.topAnchor.constraint(equalTo: bookTitleTextField.bottomAnchor, constant: 16),
            descriptionTextField.leadingAnchor.constraint(equalTo: formCardView.leadingAnchor, constant: 16),
            descriptionTextField.trailingAnchor.constraint(equalTo: formCardView.trailingAnchor, constant: -16),
            descriptionTextField.heightAnchor.constraint(equalToConstant: 40),
            
            // Borrower's Name Field
            borrowerNameTextField.topAnchor.constraint(equalTo: descriptionTextField.bottomAnchor, constant: 16),
            borrowerNameTextField.leadingAnchor.constraint(equalTo: formCardView.leadingAnchor, constant: 16),
            borrowerNameTextField.trailingAnchor.constraint(equalTo: formCardView.trailingAnchor, constant: -16),
            borrowerNameTextField.heightAnchor.constraint(equalToConstant: 40),
            
            // Upload Image Button
            uploadImageButton.topAnchor.constraint(equalTo: borrowerNameTextField.bottomAnchor, constant: 20),
            uploadImageButton.centerXAnchor.constraint(equalTo: formCardView.centerXAnchor),
            
            // Submit Button
            submitButton.topAnchor.constraint(equalTo: formCardView.bottomAnchor, constant: 20),
            submitButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            submitButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            submitButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    // MARK: - Actions
    
    @objc private func uploadImageTapped() {
        // Launch image picker
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc private func submitTapped() {
        // Collect all the data from the text fields
        guard let bookTitle = bookTitleTextField.text, !bookTitle.isEmpty,
              let description = descriptionTextField.text, !description.isEmpty,
              let borrowerName = borrowerNameTextField.text, !borrowerName.isEmpty else {
            // Handle validation (e.g., show alert if any field is missing)
            print("All fields are required")
            return
        }
        
        // Generate unique image name
        let imageName = "\(bookTitle.lowercased().replacingOccurrences(of: " ", with: "_"))_image"
        
        // Add the new book issue to the open cases array
        let newIssue = ["title": bookTitle, "description": description, "borrower": borrowerName, "image": imageName]
        openCases.append(newIssue)
        
        // You can save or display this data (like pushing back to the previous screen or showing confirmation)
        print("New issue added: \(newIssue)")
        
        // Dismiss or reset form
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - UIImagePickerControllerDelegate
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            image = selectedImage
            // Handle the selected image (save or display it as needed)
        }
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
