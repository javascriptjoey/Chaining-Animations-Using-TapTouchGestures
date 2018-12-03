//
//  ViewController.swift
//  Chain-Animations
//
//  Created by Joey Essak on 12/2/18.
//  Copyright © 2018 Joey Essak. All rights reserved.
//


// Run code and tap screen 


import UIKit

class ViewController: UIViewController {

    // First I need to set up UI
    let titleLabel = UILabel()
    let bodyLabel = UILabel()
    fileprivate func setupLabels() {
        //Throw some color into the background so I can see the labels
    //    titleLabel.backgroundColor = .red
    //    bodyLabel.backgroundColor = .green
        // Set the numeber of lines in the title label to 0 so  multi lines are enabled
        titleLabel.numberOfLines = 0
        titleLabel.text = "Animation is rad"
        
        titleLabel.font = UIFont(name: "Papyrus", size:40)
        
        // Set the numeber of lines in the body label to 0 so you can enable multi lines on the UILabel component
        bodyLabel.numberOfLines = 0
        
        bodyLabel.text = "One of the founding fathers of Pixar, John Lasseter, was fired from Disney for pushing them to use computer animation. He was then hired by Graphics Group of Lucasfilm, later renamed Pixar, and won two Oscars. When Disney bought Pixar, Lasseter was hired back as the chief creative officer of both Pixar and Walt Disney Animation Studios to save Disney."
    }
    
    fileprivate func setupStackView() {
        //I need put both the title label and body label into the view and they need to be vertically centered
        let stackView = UIStackView(arrangedSubviews: [titleLabel,bodyLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        view.addSubview(stackView)
        
        
        //I need to center stackviews, use autolayout to handle this
        //First step autolayout needs to be enabled by setting translatesAutoresizingMaskIntoConstraints
        //This enables autolayout
        stackView.translatesAutoresizingMaskIntoConstraints = false
        //centers stackViews
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -100).isActive = true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabels()
        setupStackView()
        
        // Animations
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleTapAnimations)))
    }
  
        @objc fileprivate func handleTapAnimations()
        {
        print("Animation is working")
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
               
                self.titleLabel.transform = CGAffineTransform(translationX: -30, y: 0)
                
            }) { (_) in
                // sets animation options
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    // fades the label
                    self.titleLabel.alpha = 0
                    // sends the label up
                    self.titleLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -200)
                    
                })
                
            }
            // set up animation bodylabel with offset delay
            UIView.animate(withDuration: 0.5, delay: 0.5, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                // sends label to the left side
                self.bodyLabel.transform = CGAffineTransform(translationX: -30, y: 0)
                
            }) { (_) in
                // sets animation options body label
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                    // fades the body label
                    self.bodyLabel.alpha = 0
                    // sends the body label up
                    self.bodyLabel.transform = self.bodyLabel.transform.translatedBy(x: 0, y: -200)
                    
                })
                
            }
            
    }
}

