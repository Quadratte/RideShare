
import UIKit

class WelcomeViewController: UIViewController {

  let welcomeImage: UIImageView = {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    image.image = .welcome
    return image
  }()
  
  let mainLabel = AppLabel(text: "Welcome", textAlignment: .center)
  let subLabel = AppSublabel(text: "Have a better sharing experience")

  let createAccountButton = AppMainButton(title: "Create an account")
  let loginButton = AppSecondaryButton(title: "Log In")

  override func viewDidLoad() {
    super.viewDidLoad()
    setupUI()
    setupConstraints()
  }
  
  private func setupUI() {
    view.backgroundColor = .white
    view.addSubview(welcomeImage)
    view.addSubview(mainLabel)
    view.addSubview(subLabel)
    view.addSubview(createAccountButton)
    view.addSubview(loginButton)
  }

  private func setupConstraints() {
    NSLayoutConstraint.activate([
      welcomeImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 18),
      welcomeImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 18),
      welcomeImage.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -18),
      welcomeImage.heightAnchor.constraint(equalToConstant: 276),
      
      mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      mainLabel.topAnchor.constraint(equalTo: welcomeImage.bottomAnchor, constant: 30),
      
      subLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      subLabel.topAnchor.constraint(equalTo: mainLabel.bottomAnchor, constant: 12),
      
      createAccountButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
      createAccountButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
      createAccountButton.heightAnchor.constraint(equalToConstant: 54),
      createAccountButton.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -18),
      
      loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
      loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
      loginButton.heightAnchor.constraint(equalToConstant: 54),
      loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -18),
    ])
  }
}

