import UIKit

final class OTPTextField: UIView {
    
    // MARK: - Properties
    private var digitLabels: [UILabel] = []
    private var digitViews: [UIView] = []
    private let hiddenTextField = UITextField()
    private let digitsCount: Int
    
    var onCodeEntered: ((String) -> Void)?
    var currentCode: String {
        return hiddenTextField.text ?? ""
    }
    
    // MARK: - Initialization
    init(digitsCount: Int = 6) {
        self.digitsCount = digitsCount
        super.init(frame: .zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        self.digitsCount = 6
        super.init(coder: coder)
        setupUI()
    }
    
    // MARK: - UI Setup
    private func setupUI() {
        setupHiddenTextField()
        setupDigitViews()
        setupConstraints()
    }
    
    private func setupHiddenTextField() {
        hiddenTextField.translatesAutoresizingMaskIntoConstraints = false
        hiddenTextField.keyboardType = .numberPad
        hiddenTextField.textContentType = .oneTimeCode
        hiddenTextField.delegate = self
        hiddenTextField.tintColor = .clear
        hiddenTextField.textColor = .clear
        addSubview(hiddenTextField)
        
        // Активируем клавиатуру при тапе на любое место
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(focusTextField))
        addGestureRecognizer(tapGesture)
    }
    
    private func setupDigitViews() {
        for i in 0..<digitsCount {
            let view = createDigitView()
            digitViews.append(view)
            addSubview(view)
        }
    }
    
    private func createDigitView() -> UIView {
        let container = UIView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.backgroundColor = .systemGray6
        container.layer.cornerRadius = 8
        container.layer.borderWidth = 1
        container.layer.borderColor = UIColor.systemGray3.cgColor
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.font = UIFont.monospacedDigitSystemFont(ofSize: 24, weight: .bold)
        label.textAlignment = .center
        label.textColor = .label
        
        container.addSubview(label)
        digitLabels.append(label)
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: container.centerYAnchor)
        ])
        
        return container
    }
    
    private func setupConstraints() {
        let stackView = UIStackView(arrangedSubviews: digitViews)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 12
        stackView.distribution = .fillEqually
        
        addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            hiddenTextField.topAnchor.constraint(equalTo: topAnchor),
            hiddenTextField.leadingAnchor.constraint(equalTo: leadingAnchor),
            hiddenTextField.trailingAnchor.constraint(equalTo: trailingAnchor),
            hiddenTextField.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        // Фиксированная высота для каждой ячейки
        digitViews.forEach { view in
            view.heightAnchor.constraint(equalToConstant: 60).isActive = true
            view.widthAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        }
    }
    
    // MARK: - Actions
    @objc private func focusTextField() {
        hiddenTextField.becomeFirstResponder()
    }
    
    private func updateDigitViews() {
        let text = hiddenTextField.text ?? ""
        
        for (index, label) in digitLabels.enumerated() {
            if index < text.count {
                let index = text.index(text.startIndex, offsetBy: index)
                label.text = String(text[index])
            } else {
                label.text = ""
            }
        }
        
        // Обновляем стили
        updateAppearance()
        
        // Проверяем заполнение
        if text.count == digitsCount {
            onCodeEntered?(text)
        }
    }
    
    private func updateAppearance() {
        let currentIndex = hiddenTextField.text?.count ?? 0
        
        for (index, view) in digitViews.enumerated() {
            if index == currentIndex && currentIndex < digitsCount {
                // Активная ячейка
                view.layer.borderColor = UIColor.systemBlue.cgColor
                view.layer.borderWidth = 2
                view.backgroundColor = .systemBlue.withAlphaComponent(0.1)
            } else if index < currentIndex {
                // Заполненная ячейка
                view.layer.borderColor = UIColor.systemGreen.cgColor
                view.layer.borderWidth = 1
                view.backgroundColor = .systemGreen.withAlphaComponent(0.05)
            } else {
                // Пустая ячейка
                view.layer.borderColor = UIColor.systemGray3.cgColor
                view.layer.borderWidth = 1
                view.backgroundColor = .systemGray6
            }
        }
    }
    
    // MARK: - Public Methods
    func clear() {
        hiddenTextField.text = ""
        updateDigitViews()
    }
    
    func focus() {
        hiddenTextField.becomeFirstResponder()
    }
}

// MARK: - UITextFieldDelegate
extension OTPTextField: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let currentText = textField.text ?? ""
        let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        // Разрешаем только цифры и ограничиваем длину
        let allowedCharacters = CharacterSet.decimalDigits
        let characterSet = CharacterSet(charactersIn: string)
        
        return newText.count <= digitsCount && allowedCharacters.isSuperset(of: characterSet)
    }
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        updateDigitViews()
    }
}
