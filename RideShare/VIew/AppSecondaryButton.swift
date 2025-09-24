
import UIKit

final class AppSecondaryButton: UIButton {
  
  init(title: String) {
    super.init(frame: .zero)
    setTitle(title, for: .normal)
    setTitleColor(.primaryApp, for: .normal)
    configureAppSecondaryButton()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configureAppSecondaryButton() {
    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = .clear
    layer.borderColor = UIColor.primaryApp.cgColor
    layer.borderWidth = 2
    layer.cornerRadius = 8
  }
}
