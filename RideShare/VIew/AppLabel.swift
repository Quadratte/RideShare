
import UIKit

final class AppLabel: UILabel {
  
  init(text: String) {
    super.init(frame: .zero)
    self.text = text
    configureAppLabel()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configureAppLabel() {
    translatesAutoresizingMaskIntoConstraints = false
    textColor = .contentSecondary
    font = .preferredFont(forTextStyle: .title1)
    textAlignment = .center
    numberOfLines = 0
  }
  
}
