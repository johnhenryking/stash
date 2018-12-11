//
//  Extensions.swift
//  stash
//
//  Created by User on 12/10/18.
//  Copyright © 2018 jonathanking. All rights reserved.
//

import UIKit

extension UIView {
    
    func setCornerRadius(to newRadius: CGFloat) {
        self.layer.cornerRadius = newRadius
        self.layer.masksToBounds = true
    }
    
    func setRounded() {
        self.layer.cornerRadius = self.frame.height / 2
    }
}

extension UIProgressView {
    
    func roundEdges() {
        self.layer.cornerRadius = 8
        self.clipsToBounds = true
        self.layer.sublayers![1].cornerRadius = 8
        self.subviews[1].clipsToBounds = true
        
    }
    
}

extension UIImageView {
    
    func setImage(with imageUrl: String?) {
        
        guard let imageUrl = imageUrl else { return }
        guard let url = URL(string: imageUrl) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            //check for the error, then construct the image using data
            if let error = error {
                print("Failed to fetch image:", error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            let image = UIImage(data: data)
            
            DispatchQueue.main.async {
                UIView.transition(with: self,
                                  duration: 0.2,
                                  options: .transitionCrossDissolve,
                                  animations: { self.image = image },
                                  completion: nil)
            }
            
            }.resume()
    }
    
}

extension UIViewController {
    
    func presentAlert(title: String, message: String?) {
        let alertController = UIAlertController(title: title, message: message ?? "Something went wrong.", preferredStyle: .alert)
        let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
        
    }
    
    
}

