//
//  ContentView.swift
//  GoldenBall
//
//  Created by 仲輝 on 2021/6/21.
//

import SwiftUI
import RealityKit

struct ContentView : View {
    @State var selectedTabview = 0
    @State var viewControl = false
    
    var body: some View {
        TabView(selection: $selectedTabview){

            Tabview1(selectedTabview: $selectedTabview).tabItem{
                Image(systemName: "circle.fill")
                Text("GoldenBall")
            }.tag(1)
            Tabview2().tabItem{
                Image(systemName: "person.circle")
                Text("My_Info")
            }.tag(0)
        }
    }
}
//return ARViewContainer().edgesIgnoringSafeArea(.all)
struct Tabview1: View{
    @Binding var selectedTabview: Int
    var body: some View{
        VStack{
            return ARViewContainer().edgesIgnoringSafeArea(.all)
        }
    }
}
struct Tabview2: View{
    @State var username: String = ""
    @State var isPresented:Bool = false
    private var enableButton: Bool {
            !username.isEmpty
    }
    
    var body: some View{
        Group{
            HStack{
                Text("Username").font(.title)
                TextField("Username",text: $username).border(Color.black)
                .frame(width: 245.0)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            Button(action:
                self.isPresented = true
            ){
                Text("Sign Up").foregroundColor(.blue)
                print("Sign in using \(self.username)")
            }.disabled(!enableButton)
            .sheet(isPresented: $isPresented){
                SecondView()
            }
        }.padding()
        .font(.title)
    }
}
struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        
        let arView = ARView(frame: .zero)
        
        // Load the "Box" scene from the "Experience" Reality File
        let boxAnchor = try! Experience.loadBox()
        
        // Add the box anchor to the scene
        arView.scene.anchors.append(boxAnchor)
        
        return arView
        
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
