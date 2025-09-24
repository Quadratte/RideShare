
import UIKit

final class AppTextField: UITextField {
  
  private let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
  
  init(placeholder: String, keyboardType: UIKeyboardType) {
    super.init(frame: .zero)
    self.placeholder = placeholder
    self.keyboardType = keyboardType
    configureAppTextField()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configureAppTextField() {
    translatesAutoresizingMaskIntoConstraints = false
    layer.borderColor = UIColor.neutralGray200.cgColor
    layer.cornerRadius = 8
    layer.borderWidth = 1
    clearButtonMode = .whileEditing
    autocorrectionType = .no
    adjustsFontSizeToFitWidth = true
  }
  
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    let rect = super.textRect(forBounds: bounds)
    return rect.inset(by: insets)
  }
  
  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    let rect = super.editingRect(forBounds: bounds)
    return rect.inset(by: insets)
  }
}
