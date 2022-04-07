//
//  User.swift
//  MICHAELMCGINNIS-Friends
//
//  Created by Michael Mcginnis on 4/4/22.
//

import Foundation

enum CodingKeys: CodingKey{
    case id, isActive, name, age, company, email, address, about, registered, tags, friends
}

enum CodingKeysClass: CodingKey{
    case users
}

struct User: Codable, Identifiable{
    let id: String
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    var friends: [Friend]
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encode(id, forKey: .id)
        try container.encode(isActive, forKey: .isActive)
        try container.encode(name, forKey: .name)
        try container.encode(age, forKey: .age)
        try container.encode(company, forKey: .company)
        try container.encode(email, forKey: .email)
        try container.encode(address, forKey: .address)
        try container.encode(about, forKey: .about)
        try container.encode(registered, forKey: .registered)
        try container.encode(tags, forKey: .tags)
        try container.encode(friends, forKey: .friends)
        }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        id = try container.decode(String.self, forKey: .id)
        isActive = try container.decode(Bool.self, forKey: .isActive)
        name = try container.decode(String.self, forKey: .name)
        age = try container.decode(Int.self, forKey: .age)
        company = try container.decode(String.self, forKey: .company)
        email = try container.decode(String.self, forKey: .email)
        address = try container.decode(String.self, forKey: .address)
        about = try container.decode(String.self, forKey: .about)
        registered = try container.decode(Date.self, forKey: .registered)
        tags = try container.decode([String].self, forKey: .tags)
        friends = try container.decode([Friend].self, forKey: .friends)
        
    }
    
    init(cachedUser: CachedUser){
        id = cachedUser.id ?? "failed id"
        isActive = cachedUser.isActive
        name = cachedUser.name ?? "No name"
        age = Int(cachedUser.age)
        company = cachedUser.company ?? "No company"
        email = cachedUser.email ?? "No email"
        address = cachedUser.address ?? "No address"
        about = cachedUser.about ?? "No about"
        registered = cachedUser.registered!
        tags = cachedUser.tags?.components(separatedBy: ",") ?? []
        //let cachedFriends = cachedUser.friends?.allObjects as! [CachedFriend]
        
        let cachedFriends = cachedUser.friends
        var newFriend: [Friend] = []
        
        cachedFriends?.forEach{ cachedFriend in
            newFriend.append(Friend(cachedFriend: cachedFriend))
            //friends.append(Friend(cachedFriend: (cachedFriends?.popFirst())!))
        }
        friends = newFriend
        //friends = []
        //let cachedFriend = cachedUser.friends?.sorted() ?? []
        //for friend in cachedFriends {
            
        //}
    }
}

class UserC: Codable, ObservableObject{
    @Published var users: [User] = []
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeysClass.self)
        
        try container.encode(users, forKey: .users)
        }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeysClass.self)
        users = try container.decode([User].self, forKey: .users)
        
    }
    
    init(){}
}
