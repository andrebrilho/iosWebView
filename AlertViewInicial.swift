//
//  AlertViewInicial.swift
//  webview
//
//  Created by André Brilho on 10/12/16.
//  Copyright © 2016 Andre Brilho. All rights reserved.
//

import Foundation
import UIKit

class alerta {

    class Alerta {
        
        class func alerta(msg: String, viewController: UIViewController){
            let alert = UIAlertController(title: "Alerta", message: msg, preferredStyle: .Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
            viewController.presentViewController(alert, animated: true, completion: nil)
            
            
            
        }
    
        
    }
    
}
