//
//  ButtonOptionView.swift
//  appDesafio
//
//  Created by MacBook on 13/03/22.
//

import Foundation
import UIKit

class TextFieldOptionView : UIView{ // Se crea una clase que hereda de UIView
    
    var emailInputTextField : UITextField?
    var gray = UIColor(displayP3Red: 0.92, green: 0.92, blue: 0.92, alpha: 1)
    
    
    init(titlePlaceHolder : String, frame : CGRect){
        super.init(frame: frame)

        emailInputTextField = UITextField(frame: frame)
        //emailInputTextField?.placeholder = "Ingresa tu email"
        emailInputTextField?.placeholder = titlePlaceHolder
        emailInputTextField?.backgroundColor = gray
        emailInputTextField?.layer.cornerRadius = 7
        emailInputTextField?.layer.borderColor = UIColor.darkGray.cgColor
        emailInputTextField?.layer.borderWidth = 1
        emailInputTextField?.font = UIFont(name: "Helvetica Bold", size: 14)
        emailInputTextField?.textAlignment = .center
        emailInputTextField?.keyboardType = .emailAddress
        emailInputTextField?.autocapitalizationType = .none
        self.addSubview(emailInputTextField!)
    }
    
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
    }
