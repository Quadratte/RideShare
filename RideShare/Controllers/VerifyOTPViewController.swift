
import UIKit

final class VerifyOTPViewController: UIViewController {
  
  let verifyTitle = AppLabel(text: "Phone verification", textAlignment: .center)
  let verifySubtitle = AppSublabel(text: "Enter your OTP code")
  let resendCodeText = AppAttributedTextView(fullText: "Didn’t receive code? Resend again", linkText: "https://vk.com", resend: "Resend again")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupConstraints()
  }
  
  private func setupUI() {
    view.backgroundColor = .white
    view.addSubview(resendCodeText)
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      resendCodeText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      resendCodeText.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
      resendCodeText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
      resendCodeText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16)
    ])
  }
}
