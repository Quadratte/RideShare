
import UIKit

final class AppPasswordTextField: UITextField {
  
  init(placeholder: String) {
    super.init(frame: .zero)
    self.placeholder = placeholder
    configureAppPasswordTextField()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configureAppPasswordTextField() {
    
    let hidePassButton = UIImageView()
    hidePassButton.image = UIImage(systemName: "eye.slash")
    hidePassButton.tintColor = .neutralGray200
    hidePassButton.contentMode = .scaleAspectFit
    
    translatesAutoresizingMaskIntoConstraints = false
    isSecureTextEntry = true
    layer.cornerRadius = 8
    layer.borderWidth = 1
    layer.borderColor = UIColor.neutralGray200.cgColor
    rightView = hidePassButton
    rightViewMode = .always
  }
  
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    let rect = super.textRect(forBounds: bounds)
    return rect.inset(by: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 10))
  }
  
  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    let rect = super.editingRect(forBounds: bounds)
    return rect.inset(by: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 80))
  }
  
  override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
    let rect = super.rightViewRect(forBounds: bounds)
    return rect.inset(by: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 40))
  }
}


extension AppPasswordTextField: UITextFieldDelegate {
  
  
  
}
