
import UIKit

final class SetPasswordViewController: UIViewController {

  let setPasswordTextField = AppPasswordTextField(placeholder: "Enter your password")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupConstraints()
  }
  
  private func setupUI() {
    view.backgroundColor = .white
    view.addSubview(setPasswordTextField)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      
      setPasswordTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
      setPasswordTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
      setPasswordTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
      setPasswordTextField.heightAnchor.constraint(equalToConstant: 60)
      
      
    ])
  }
  
}
