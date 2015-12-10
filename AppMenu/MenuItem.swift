//
//  MenuItem.swift
//  AppMenu
//
//  Created by Jeff Jones on 12/9/15.
//  Copyright © 2015 Jeff Jones. All rights reserved.
//

import Foundation


class MenuItem {
    let title : String
    var subTitle : String?
    var iconName : String?
    
    init(title: String) {
        self.title = title
    }
}