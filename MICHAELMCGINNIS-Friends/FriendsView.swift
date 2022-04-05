//
//  FriendsView.swift
//  MICHAELMCGINNIS-Friends
//
//  Created by Michael Mcginnis on 4/4/22.
//

import SwiftUI

struct FriendsView: View {
    //let user: User
    let friends: [Friend]
    var body: some View {
        List{
            Section(header: Text("Friends")){
                ForEach(friends){ friend in
                    VStack{
                        Text("\(friend.name)")
                    }
                }
            }
        }
    }
}

/*
struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsView()
    }
}*/
