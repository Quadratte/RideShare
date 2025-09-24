
import UIKit

final class AppLabel: UILabel {
  
  init(text: String, textAlignment: NSTextAlignment) {
    super.init(frame: .zero)
    self.text = text
    self.textAlignment = textAlignment
    configureAppLabel()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configureAppLabel() {
    translatesAutoresizingMaskIntoConstraints = false
    textColor = .contentSecondary
    font = .preferredFont(forTextStyle: .title1)
    numberOfLines = 0
  }  
}
