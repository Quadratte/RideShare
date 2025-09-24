
import UIKit

final class AppSublabel: UILabel {
  
  init(text: String) {
    super.init(frame: .zero)
    self.text = text
    configureAppSublabel()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configureAppSublabel() {
    translatesAutoresizingMaskIntoConstraints = false
    textColor = .neutralGray400
    font = .preferredFont(forTextStyle: .body)
    textAlignment = .center
    numberOfLines = 0
  }
}
