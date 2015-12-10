//
//  EntryReader.swift
//  AppMenu
//
//  Created by Jeff Jones on 12/9/15.
//  Copyright © 2015 Jeff Jones. All rights reserved.
//

import Foundation

protocol EntryReader {
    func readItems(fileName: String) -> ([[String : String]]?, NSError?)
}