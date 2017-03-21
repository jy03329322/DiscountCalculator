//
//  RViewController.swift
//  DiscountCalculator
//
//  Created by Chao Zhang on 3/10/17.
//  Copyright © 2017 Chao Zhang. All rights reserved.
//

import UIKit


class RViewController: UIViewController {
        var OP:Float = 0
        var YP:Float = 0
        var YS:Float = 0
        var pay:Float = 0
        var save:Float = 0
        var payrate:Float = 0
        var saverate:Float = 0
        override func viewDidLoad() {
        super.viewDidLoad()

        pay = YP/OP*464
        save = YS/OP*464
        payrate = YP/OP*100
        saverate = YS/OP*100
            
        let viewRect = CGRect(x: 0, y: 65, width: 160, height: 464)
        let viewRectm = CGRect(x: 160, y: 65, width: 160, height: Int(save))
        let viewRectn = CGRect(x: 160, y:Int(save)+65 , width: 160, height: Int(pay))
            
        let view1 = MyCanvas(frame: viewRect)
        let view2 = MyCanvasm(frame: viewRectm)
        let view3 = MyCanvasn(frame: viewRectn)
        self.view.addSubview(view1)
        self.view.addSubview(view2)
        self.view.addSubview(view3)
        
        let label = UILabel(frame:CGRect(x:10, y:50, width:200, height:100))
        label.text = "Original Price" + "\n" + "$ \(OP)"
        self.view.addSubview(label);
        label.numberOfLines = 2
            
        let labela = UILabel(frame:CGRect(x:170, y:50, width:200, height:100))
        labela.text = "You Saved" + "\n" + "\(saverate) %"
        self.view.addSubview(labela);
        labela.numberOfLines = 2
            
        let labelb = UILabel(frame:CGRect(x:170, y:Int(save)+50, width:200, height:100))
        labelb.text = "You Pay" + "\n" + "\(payrate) %"
        self.view.addSubview(labelb);
        labelb.numberOfLines = 2
        
            
        let swipeRight:
        UISwipeGestureRecognizer = UISwipeGestureRecognizer(target:self, action: #selector(handleSwipe))
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        view.addGestureRecognizer(swipeRight)
       
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
        func handleSwipe(_sender:UIGestureRecognizer){
            navigationController?.popViewController(animated: true)
            
            dismiss(animated: true, completion: nil)
         
    }

}


class MyCanvas: UIView {
    override func draw(_ rect: CGRect) {
        UIColor.lightGray.setFill()
        let path = UIBezierPath(rect: self.bounds)
        path.fill()
        
    }
}

class MyCanvasm: UIView {
    override func draw(_ rect: CGRect) {
        UIColor.cyan.setFill()
        let path = UIBezierPath(rect: self.bounds)
        path.fill()
  }
}
class MyCanvasn: UIView {
    override func draw(_ rect: CGRect) {
        UIColor.orange.setFill()
        let path = UIBezierPath(rect: self.bounds)
        path.fill()
        
   }
}

