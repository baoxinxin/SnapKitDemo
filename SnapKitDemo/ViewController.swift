//
//  ViewController.swift
//  SnapKitDemo
//
//  Created by ZLY on 16/9/28.
//  Copyright © 2016年 petrel. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var box = UIView()
    
    //外部方块
    lazy var boxOutter = UIView()
    //内部方块
    lazy var boxInner = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        box.backgroundColor = UIColor.orange
        self.view.addSubview(box)
        
        //由于长宽一样，可以串连视图属性，增加可读性
        /*
        box.snp.makeConstraints { (make) in
            make.width.height.equalTo(50)
            make.center.equalTo(self.view)
        }
        */
        
        /*
        通过 snp.makeConstraints 方法给view添加约束，约束有几种，分别是边距，宽，高，左上右下距离，基准线。同时，添加过约束后可以有修正，修正有位移修正（inset、offset）和倍率修正（multipliedBy）
        语法一般是： make.equalTo 或 make.greaterThanOrEqualTo 或 make.lessThanOrEqualTo + 倍数和位移修正。
        使用snp.makeConstraints方法的元素必须事先添加到父元素中
         view.snp.left  view.snp.right view.snp.top view.snp.bottom view.snp.leading 
         view.snp.trailing view.snp.width view.snp.height view.snp.centerX 
         view.snp.centerY  view.snp.baseline
        */
        
        //视图关系
        //比如想让view.left大于等于label.left:
//        make.left.greaterThanOrEqualTo(label1)
        //等价于
//        make.left.greaterThanOrEqualTo(label1.snp.left)
        
        //严格检测
        //比如将宽度和高度属性设置为常量值
//        make.height.equalTo(20)
        
        //edges边缘
        //让当前视图的上下左右等于view2
//        make.edges.equalTo(view2)
        //当前视图宽高>=titleLabel
//        make.size.greaterThanOrEqualTo(titleLabel)
        //当前视图与button1中心相同(centerX, centerY)
//        make.center.equalTo(button1)
        
        
//        boxOutter.backgroundColor = UIColor.orange
//        self.view.addSubview(boxOutter)
//        boxInner.backgroundColor = UIColor.green
//        boxOutter.addSubview(boxInner)
//        
//        boxOutter.snp.makeConstraints { (make) -> Void in
//            make.width.height.equalTo(200)
//            make.center.equalTo(self.view)
//        }
//        
//        boxInner.snp.makeConstraints { (make) -> Void in
//            
//            //内位移修正
//            //            make.top.equalTo(boxOutter).offset(10)
//            //            make.left.equalTo(boxOutter).offset(15)
//            //            make.bottom.equalTo(boxOutter).offset(-20)
//            //            make.right.equalTo(boxOutter).offset(-25)
//            //等同于
////            make.edges.equalTo(boxOutter).inset(ConstraintInsets(top: 10, left: 15, bottom: 20, right: 25))
//
//             make.center.equalTo(boxOutter)
//            
////            外位移修正
////            make.width.equalTo(boxOutter).offset(20)
////            make.height.equalTo(boxOutter).offset(-20)
//            
//            //倍率修正: multiliedBy
//             // make width = superview.width / 2, height = superview.height / 2
////            make.size.equalTo(boxOutter).multipliedBy(0.5)
//            
//        }
        //约束的更新、移除、重做
        MakeconstraintsByUpdateAndRemoveAndReset()
    }
    
    //保存约束的引用
    var topConstraint: Constraint?
    
    func MakeconstraintsByUpdateAndRemoveAndReset() {
        
        box.snp.makeConstraints { (make) in
//            make.width.height.equalTo(150)
            make.height.equalTo(150)
            make.centerX.equalTo(self.view)
//            self.topConstraint = make.top.equalTo(self.view).offset(100).constraint
        }
    }

    @IBAction func btnClick(_ sender: AnyObject) {
        //通过约束的引用更新约束
        self.topConstraint?.update(offset: 160)
    }
    
}

