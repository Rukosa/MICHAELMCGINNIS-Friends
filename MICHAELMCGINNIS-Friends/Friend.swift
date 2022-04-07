//
//  Friend.swift
//  MICHAELMCGINNIS-Friends
//
//  Created by Michael Mcginnis on 4/4/22.
//

import Foundation

struct Friend: Codable, Identifiable{
    let id: String
    let name: String
    init(cachedFriend: CachedFriend){
        id = cachedFriend.id ?? "failed id"
        name = cachedFriend.name ?? "No name"
    }
}
