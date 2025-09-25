
import UIKit

final class AppAttributedTextView: UITextView {
  
  var fullText: String
  var linkText: String
  var resend: String
  
  init(fullText: String, linkText: String, resend: String) {
    self.fullText = fullText
    self.linkText = linkText
    self.resend = resend
    super.init(frame: .zero, textContainer: .none)
    configureAppTextView()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func configureAppTextView() {
    let attributedString = NSMutableAttributedString(string: fullText)
    let linkRange = (fullText as NSString).range(of: resend)
    
    if linkRange.location != NSNotFound {
      attributedString.addAttribute(.link, value: linkText, range: linkRange)
    }
    
    translatesAutoresizingMaskIntoConstraints = false
    isEditable = false
    isScrollEnabled = false
    isSelectable = true
    backgroundColor = .clear
    linkTextAttributes = [.foregroundColor: UIColor.primaryApp]
    textColor = .contentSecondary
    attributedText = attributedString
    font = .preferredFont(forTextStyle: .body)
    textAlignment = .center
    textContainerInset = .zero
    textContainer.lineFragmentPadding = 0
  }
}
