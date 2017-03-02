//
//  ViewController.swift
//  TestRichEditor
//
//  Created by xujing on 17/3/2.
//  Copyright © 2017年 xujing. All rights reserved.
//

import UIKit
import RichEditorView

class ViewController: UIViewController {

    @IBOutlet weak var editorView: RichEditorView!
    
    lazy var toolbar:RichEditorToolbar = {
        let toolbar = RichEditorToolbar(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: 44))
        toolbar.options = RichEditorOptions.all()
        return toolbar
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        editorView.inputAccessoryView = toolbar
        editorView.setPlaceholderText("我不想写了，你随便说点啥吧。。。")
        toolbar.delegate = self
        toolbar.editor = editorView
        
        let item = RichEditorOptionItem(image:nil,title: "Clear"){toolbar in
            
        }
        
        var options = toolbar.options
        options.append(item)
        toolbar.options = options
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//RichEditorToolbarDelegate
extension ViewController:RichEditorToolbarDelegate{
    
    private func randomColor()->UIColor{
        
        let red = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
        let green = CGFloat( arc4random_uniform(255))/CGFloat(255.0)
        let blue = CGFloat(arc4random_uniform(255))/CGFloat(255.0)
        let colorRun = UIColor.init(red:red, green:green, blue:blue , alpha: 1)
        
        return colorRun
        
    }
    
    //添加图片
    func richEditorToolbarInsertImage(toolbar: RichEditorToolbar) {
        
       toolbar.editor?.insertImage("https://gravatar.com/avatar/696cf5da599733261059de06c4d1fe22", alt: "Gravatar")
    }
    
    //修改文字颜色
    func richEditorToolbarChangeTextColor(toolbar: RichEditorToolbar){
        let color = randomColor()
        toolbar.editor?.setTextColor(color)
    }
    
     //修改文字背景颜色
    func richEditorToolbarChangeBackgroundColor(toolbar: RichEditorToolbar) {
        let color = randomColor()
        toolbar.editor?.setTextBackgroundColor(color)
    }
    
    //添加链接
    func richEditorToolbarInsertLink(toolbar: RichEditorToolbar) {
      
    }
  
    
}




