//
//  List.swift
//  单词app
//
//  Created by 金乃德 on 2018/5/29.
//  Copyright © 2018年 金乃德. All rights reserved.
//

import Foundation


struct List {
    var WordList: [Word]
    
    init(givenWordlist: [Word]){
        WordList = givenWordlist.shuffled()
        print("wordlist:\(WordList)")
    }
}

extension MutableCollection {
    /// Shuffles the contents of this collection.
    mutating func shuffle() {
        let c = count
        guard c > 1 else { return }
        
        for (firstUnshuffled, unshuffledCount) in zip(indices, stride(from: c, to: 1, by: -1)) {
            let d: Int = numericCast(arc4random_uniform(numericCast(unshuffledCount)))
            let i = index(firstUnshuffled, offsetBy: d)
            swapAt(firstUnshuffled, i)
        }
    }
}

extension Sequence {
    func shuffled() -> [Element] {
        var result = Array(self)
        result.shuffle()
        return result
    }
}
