
import UIKit

final class AppMainButton: UIButton {
  
  init(title: String) {
    super.init(frame: .zero)
    setTitle(title, for: .normal)
    setTitleColor(.white, for: .normal)
    configureAppMainButton()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configureAppMainButton() {
    translatesAutoresizingMaskIntoConstraints = false
    backgroundColor = .primaryApp
    layer.cornerRadius = 8
  }
}
