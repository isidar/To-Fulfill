//
//  LocalizedStrings.swift
//  CellcomTVOS
//
//  Created by Nazarii Melnyk on 8/20/18.
//  Copyright © 2018 Cellcom. All rights reserved.
//

import Foundation

struct LocalizedStrings: Decodable {
    var main: Main
    var conversation: Conversation
    var story: Story
    var specialThanks: SpecialThanks
    var common: Common
}
