//
//  LabelMessageInput.swift
//  appDesafio
//
//  Created by MacBook on 23/01/22.
//

import Foundation
import UIKit

class LabelMessageOptionView : UIView{
    
    var labelMessage : UILabel?

    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var blue = UIColor(displayP3Red: 0.1, green: 0.1, blue: 0.4, alpha: 1)
    var gray = UIColor(displayP3Red: 0.92, green: 0.92, blue: 0.92, alpha: 1)
    
    init(titleString : String, colorString : UIColor, frame : CGRect){
        super.init(frame: frame)

        
        labelMessage = UILabel(frame: CGRect(x: 15, y: 0, width: 150, height: 30))
        labelMessage?.text = titleString
        labelMessage?.textAlignment = .center
        labelMessage?.font = UIFont(name: "Helvetica", size: 12)
        labelMessage?.textColor = blue
        labelMessage?.backgroundColor = colorString
        self.addSubview(labelMessage!)
    }
    


    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
