//
//  CallToActionOptionView.swift
//  appDesafio
//
//  Created by MacBook on 23/01/22.
//

import Foundation
import UIKit

class CallToActionOptionView : UIView{ // Se crea una clase que hereda de UIView
    
    var titleSection : UILabel? // Atributo que es un UILabel
    var blue = UIColor(displayP3Red: 0.1, green: 0.1, blue: 0.4, alpha: 1)
    
    
    init(titleString : String, frame : CGRect){
        super.init(frame: frame)
        self.backgroundColor = blue
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 10
        
        
        titleSection = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: 50))
        titleSection?.text = titleString
        titleSection?.textAlignment = .center
        titleSection?.font = UIFont(name: "Helvetica Bold", size: 17)
        titleSection?.textColor = .white
        self.addSubview(titleSection!)
    }
    


    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
