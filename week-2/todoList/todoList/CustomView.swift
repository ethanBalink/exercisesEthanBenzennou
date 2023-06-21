//
//  CustomView.swift
//  todoList
//
//  Created by EthanBalink on 21/06/2023.
//

import UIKit

class CustomView: UIView {
    
    @IBAction func pressedX(_ sender: Any) {
        print(4444)
    }
    @IBOutlet weak var switchStatus: UISwitch!
    @IBOutlet weak var title: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder){
        super.init(coder: coder)
    }
    func commonInit(){
        let viewFromXib = Bundle.main.loadNibNamed("customView", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
    }
    
    
}
