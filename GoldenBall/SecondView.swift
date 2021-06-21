//
//  SecondView.swift
//  GoldenBall
//
//  Created by 宋秀珍 on 2021/6/21.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack{
            Text("Welcome to ours AR Game!")
            Button(action:{self.presentationMode.wrappedValue.dismiss()}){
                Text("Back").foregroundColor(.blue)
            }
        }
        
    }
}

struct SecondView_Previews: PreviewProvider {
    static var previews: some View {
        SecondView()
    }
}
