
import UIKit

final class SignUpViewController: UIViewController {
  
  let titleLabel = AppLabel(text: "Sign up with your email or phone number",
                            textAlignment: .left)
  
  let nameTextField = AppTextField(placeholder: "Name", keyboardType: .default)
  let emailTextField = AppTextField(placeholder: "Email", keyboardType: .emailAddress)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupConstraints()
  }
  
  private func setupUI() {
    view.backgroundColor = .white
    view.addSubview(titleLabel)
    view.addSubview(nameTextField)
    view.addSubview(emailTextField)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
      titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
      titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
      
      nameTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
      nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
      nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
      nameTextField.heightAnchor.constraint(equalToConstant: 60),
      
      emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 20),
      emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
      emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
      emailTextField.heightAnchor.constraint(equalToConstant: 60),
    ])
  }
}

