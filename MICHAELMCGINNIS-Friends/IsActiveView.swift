//
//  IsActiveView.swift
//  MICHAELMCGINNIS-Friends
//
//  Created by Michael Mcginnis on 4/4/22.
//

import SwiftUI

struct IsActiveView: View {
    //let user: User
    let isActive: Bool
    var body: some View {
        Circle()
            .fill(isActive ? Color.green : Color.red)
            .frame(width: 10, height: 10)
    }
}

/*
struct IsActiveView_Previews: PreviewProvider {
    static var previews: some View {
        IsActiveView()
    }
}*/
