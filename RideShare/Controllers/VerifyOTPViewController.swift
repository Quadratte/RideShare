
import UIKit

final class VerifyOTPViewController: UIViewController {
  
  
  
  let verifyTitle = AppLabel(text: "Phone verification", textAlignment: .center)
  let verifySubtitle = AppSublabel(text: "Enter your OTP code")
  let otp = OTPTextField(digitsCount: 5)
  let resendCodeText = AppAttributedTextView(fullText: "Didn’t receive code? Resend again", linkText: "https://vk.com", resend: "Resend again")
  let verifyButton = AppMainButton(title: "Verify")
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupConstraints()
  }
  
  private func setupUI() {
    view.backgroundColor = .white
    view.addSubview(otp)
    view.addSubview(resendCodeText)
    view.addSubview(verifyButton)
    otp.translatesAutoresizingMaskIntoConstraints = false
  }
  
  private func setupConstraints() {
    NSLayoutConstraint.activate([
      
      otp.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
      otp.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
      otp.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
      otp.heightAnchor.constraint(equalToConstant: 48),
      
      resendCodeText.topAnchor.constraint(equalTo: otp.bottomAnchor, constant: 40),
      resendCodeText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      resendCodeText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
      resendCodeText.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
      
      verifyButton.heightAnchor.constraint(equalToConstant: 54),
      verifyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
      verifyButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
      verifyButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20)
    ])
  }
}
