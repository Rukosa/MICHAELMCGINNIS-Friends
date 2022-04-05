//
//  UserView.swift
//  MICHAELMCGINNIS-Friends
//
//  Created by Michael Mcginnis on 4/4/22.
//

import SwiftUI

struct UserView: View {
    let user: User
    var body: some View {
        VStack{
            HStack{
                Text("Name: \(user.name)")
                Spacer()
                IsActiveView(isActive: user.isActive)
            }
        }
    }
}

/*
struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView()
    }
}*/
