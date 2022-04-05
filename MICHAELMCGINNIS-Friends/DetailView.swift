//
//  DetailView.swift
//  MICHAELMCGINNIS-Friends
//
//  Created by Michael Mcginnis on 4/4/22.
//

import SwiftUI

struct DetailView: View {
    let user: User
    
    var body: some View {
        NavigationView{
            VStack{
                HStack{
                    IsActiveView(isActive: user.isActive)
                    Text("Name: \(user.name)")
                        .font(.largeTitle)
                }
                NavigationLink(destination: FriendsView(friends: user.friends)){
                    Text("\(user.friends.count) Friends")
                        .font(.title3.bold())
                }
                Text("About:")
                    .font(.title)
                VStack(alignment: .leading){
                    Text("Age: \(user.age)")
                    Text("Company: \(user.company)")
                    Text("Address: \(user.address)")
                    Text("Email: \(user.email)")
                }
                    .font(.title3)
                Text("About me:")
                    .font(.title)
                Text("\(user.about)")
                    .padding(.leading)
                    .padding(.trailing)
                    .font(.body)
                Spacer()
            }
            .navigationBarHidden(true)
            Spacer()
        }
    }
}

/*
struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}*/
