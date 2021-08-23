//
//  CustomModalViewController.swift
//  HalfScreenPresentation
//
//  Created by on Brenda Linck 30/07/21
//

import UIKit

class CustomModalViewController:  UIViewController, UINavigationControllerDelegate, UIColorPickerViewControllerDelegate, UIImagePickerControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        picker.dismiss(animated: true, completion: nil)
        
        let storyboard = UIStoryboard(name: "addStoryboard", bundle: nil)
        guard let whiteVC = storyboard.instantiateViewController(identifier: "WhiteBoardViewController") as? WhiteBoardViewController else { return }
        whiteVC.imageReceive = image
        
        navigationController?.pushViewController(whiteVC, animated: true)
       
    }
    
    
    
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Adicione novas peças \nao seu guarda-roupa!"
        label.font = .boldSystemFont(ofSize: 24)
        label.numberOfLines = 2
        label.textColor = UIColor(named: "Text-Color")
        return label
    }()
    
    
    
    
    lazy var but1 : UIButton = {
        
        let buttom = UIButton()
        buttom.frame = CGRect(x: 0, y: 93, width: 100, height: 100)
        
        buttom.backgroundColor = .white
        //           buttom .setTitle("Câmera", for: .normal)
        buttom.setImage(UIImage(systemName: "photo.fill"), for: .normal)
        buttom.tintColor = UIColor(named: "BG-Color-2")
        buttom.layer.cornerRadius = 50
        buttom.imageView?.contentMode = .scaleAspectFit
        buttom.imageEdgeInsets = UIEdgeInsets(top: 75, left: 75, bottom: 75, right: 75)
        buttom.layer.shadowColor = UIColor.gray.cgColor
        buttom.layer.shadowOpacity = 0.3
        buttom.layer.shadowOffset = .zero
        buttom.layer.shadowRadius = 30
        buttom.addTarget(self, action: #selector(gallery(_:)), for: .touchUpInside)
        return buttom
        
    }()
    lazy var but1Label: UILabel = {
        let label = UILabel()
        label.text = "Galeria"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    @IBAction func gallery(_ sender: Any?) {
        let imagePicketController = UIImagePickerController()
        imagePicketController.delegate = self
        
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            imagePicketController.sourceType = .photoLibrary
            self.present(imagePicketController, animated: true, completion: nil)
        }else{
            print("Camera not available")
        }
    }
    
    
    lazy var but2 : UIButton = {
        let buttom = UIButton()
        buttom.frame = CGRect(x: 0, y: 93, width: 100, height: 100)
        
        buttom.backgroundColor = .white
        //           buttom .setTitle("Câmera", for: .normal)
        buttom.setImage(UIImage(systemName: "camera.fill"), for: .normal)
        buttom.tintColor = UIColor(named: "BG-Color-2")
        buttom.layer.cornerRadius = 50
        buttom.imageView?.contentMode = .scaleAspectFit
        buttom.imageEdgeInsets = UIEdgeInsets(top: 75, left: 75, bottom: 75, right: 75);
        buttom.layer.shadowColor = UIColor.gray.cgColor
        buttom.layer.shadowOpacity = 0.3
        buttom.layer.shadowOffset = .zero
        buttom.layer.shadowRadius = 30
        buttom.addTarget(self, action: #selector(camera(_:)), for: .touchUpInside)
        return buttom
    }()
    lazy var but2Label: UILabel = {
        let label = UILabel()
        label.text = "Camera"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()

    @IBAction func camera(_ sender: Any?) {
        
        let imagePicketController = UIImagePickerController()
        imagePicketController.delegate = self
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicketController.sourceType = .camera
            self.present(imagePicketController, animated: true, completion: nil)
        }else{
            print("Camera not available")
        }
        print("camera")
    }
    lazy var but3 : UIButton = {
        let buttom = UIButton()
        buttom.frame = CGRect(x: 0, y: 93, width: 100, height: 100)
        
        buttom.backgroundColor = .white
        //           buttom .setTitle("Câmera", for: .normal)
        buttom.setImage(UIImage(systemName: "sparkles"), for: .normal)
        buttom.tintColor = UIColor(named: "BG-Color-2")
        buttom.layer.cornerRadius = 50
        buttom.imageView?.contentMode = .scaleAspectFit
        buttom.imageEdgeInsets = UIEdgeInsets(top: 75, left: 75, bottom: 75, right: 75);
        buttom.layer.shadowColor = UIColor.gray.cgColor
        buttom.layer.shadowOpacity = 0.3
        buttom.layer.shadowOffset = .zero
        buttom.layer.shadowRadius = 30
        
        
        
        
        return buttom
        
    }()
    lazy var but3Label: UILabel = {
        let label = UILabel()
        label.text = "Sugestões"
        label.font = .systemFont(ofSize: 16)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    
    
//    lazy var notesLabel: UILabel = {
//        let label = UILabel()
//        label.text = "      Galeria                    Câmera                 Sugestões"
//        label.font = .systemFont(ofSize: 16)
//        label.textColor = .darkGray
//        label.numberOfLines = 0
//        return label
//    }()
    
    
    lazy var contentStackHorizontal: UIStackView = {
        //           let spacer1 = UIView()
        //           let spacer2 = UIView()
        //           let spacer3 = UIView()
        //           let spacer4 = UIView()
        
        
        
        // tirei o spacer
        let stackView = UIStackView(arrangedSubviews: [but1, but2, but3])
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 37
        return stackView
    }()
    lazy var labelStackHorizontal:UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [but1Label,but2Label, but3Label])
        stackView.axis = .horizontal
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.spacing = 37
        return stackView
    }()
    
    
    
    lazy var contentStackView: UIStackView = {
        let spacer = UIView()
        let spacer2 = UIView()
        let stackView = UIStackView(arrangedSubviews: [titleLabel,spacer,contentStackHorizontal,labelStackHorizontal, spacer2])
        stackView.axis = .vertical
        stackView.spacing = 12.0
        return stackView
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(named: "BG-Color" )
        view.layer.cornerRadius = 50
        
        view.clipsToBounds = true
        return view
    }()
    
    let maxDimmedAlpha: CGFloat = 0.6
    lazy var dimmedView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = maxDimmedAlpha
        return view
    }()
    
    // Constants
    let defaultHeight: CGFloat = 300
    let dismissibleHeight: CGFloat = 200
    let maximumContainerHeight: CGFloat = UIScreen.main.bounds.height - 64
    // keep current new height, initial is default height
    var currentContainerHeight: CGFloat = 300
    
    // Dynamic container constraint
    var containerViewHeightConstraint: NSLayoutConstraint?
    var containerViewBottomConstraint: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupConstraints()
        
        
        
        // tap gesture on dimmed view to dismiss
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.handleCloseAction))
        dimmedView.addGestureRecognizer(tapGesture)
        
        setupPanGesture()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: true)
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
    @objc func handleCloseAction() {
        animateDismissView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animateShowDimmedView()
        animatePresentContainer()
    }
    
    func setupView() {
        view.backgroundColor = .clear
    }
    
    func setupConstraints() {
        // Add subviews
        view.addSubview(dimmedView)
        view.addSubview(containerView)
        dimmedView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.addSubview(contentStackView)
        contentStackView.translatesAutoresizingMaskIntoConstraints = false
        
        // Set static constraints
        NSLayoutConstraint.activate([
            // set dimmedView edges to superview
            dimmedView.topAnchor.constraint(equalTo: view.topAnchor),
            dimmedView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            dimmedView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            dimmedView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            // set container static constraint (trailing & leading)
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 40),
            // content stackView
            contentStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 32),
            contentStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -20),
            contentStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20),
            contentStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -20),
            contentStackHorizontal.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        // Set dynamic constraints
        // First, set container to default height
        // after panning, the height can expand
        containerViewHeightConstraint = containerView.heightAnchor.constraint(equalToConstant: defaultHeight)
        
        // By setting the height to default height, the container will be hide below the bottom anchor view
        // Later, will bring it up by set it to 0
        // set the constant to default height to bring it down again
        containerViewBottomConstraint = containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: defaultHeight)
        // Activate constraints
        containerViewHeightConstraint?.isActive = true
        containerViewBottomConstraint?.isActive = true
    }
    
    func setupPanGesture() {
        // add pan gesture recognizer to the view controller's view (the whole screen)
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(self.handlePanGesture(gesture:)))
        // change to false to immediately listen on gesture movement
        panGesture.delaysTouchesBegan = false
        panGesture.delaysTouchesEnded = false
        view.addGestureRecognizer(panGesture)
    }
    
    // MARK: Pan gesture handler
    @objc func handlePanGesture(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: view)
        // Drag to top will be minus value and vice versa
        print("Pan gesture y offset: \(translation.y)")
        
        // Get drag direction
        let isDraggingDown = translation.y > 0
        print("Dragging direction: \(isDraggingDown ? "going down" : "going up")")
        
        guard isDraggingDown else {return}
        // New height is based on value of dragging plus current container height
        let newHeight = currentContainerHeight - translation.y
        
        // Handle based on gesture state
        switch gesture.state {
        case .changed:
            // This state will occur when user is dragging
            if newHeight < maximumContainerHeight {
                // Keep updating the height constraint
                containerViewHeightConstraint?.constant = newHeight
                // refresh layout
                view.layoutIfNeeded()
            }
        case .ended:
            // This happens when user stop drag,
            // so we will get the last height of container
            
            // Condition 1: If new height is below min, dismiss controller
            if newHeight < dismissibleHeight {
                self.animateDismissView()
            }
            else if newHeight < defaultHeight {
                // Condition 2: If new height is below default, animate back to default
                animateContainerHeight(defaultHeight)
            }
            else if newHeight < maximumContainerHeight && isDraggingDown {
                // Condition 3: If new height is below max and going down, set to default height
                animateContainerHeight(defaultHeight)
            }
            else if newHeight > defaultHeight && !isDraggingDown {
                // Condition 4: If new height is below max and going up, set to max height at top
                animateContainerHeight(maximumContainerHeight)
            }
        default:
            break
        }
    }
    
    func animateContainerHeight(_ height: CGFloat) {
        UIView.animate(withDuration: 0.4) {
            // Update container height
            self.containerViewHeightConstraint?.constant = height
            // Call this to trigger refresh constraint
            self.view.layoutIfNeeded()
        }
        // Save current height
        currentContainerHeight = height
    }
    
    // MARK: Present and dismiss animation
    func animatePresentContainer() {
        // update bottom constraint in animation block
        UIView.animate(withDuration: 0.3) {
            self.containerViewBottomConstraint?.constant = 0
            // call this to trigger refresh constraint
            self.view.layoutIfNeeded()
        }
    }
    
    func animateShowDimmedView() {
        dimmedView.alpha = 0
        UIView.animate(withDuration: 0.4) {
            self.dimmedView.alpha = self.maxDimmedAlpha
        }
    }
    
    func animateDismissView() {
        // hide blur view
        dimmedView.alpha = maxDimmedAlpha
        UIView.animate(withDuration: 0.4) {
            self.dimmedView.alpha = 0
        } completion: { _ in
            // once done, dismiss without animation
            self.dismiss(animated: false)
        }
        // hide main view by updating bottom constraint in animation block
        UIView.animate(withDuration: 0.3) {
            self.containerViewBottomConstraint?.constant = self.defaultHeight
            // call this to trigger refresh constraint
            self.view.layoutIfNeeded()
        }
    }
}
