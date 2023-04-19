//
//  AboutConditionsVideoView.swift
//  AboutMedications
//
//  Created by Adira Blumenthal on 2/6/23.
//

import SwiftUI
import AVKit

struct AboutConditionsVideoView: View {
    @AppStorage("ASL") var ASL = false
    @AppStorage("ASLwithCaptions") var ASLwithCaptions = false
    @AppStorage("addTranscript") var transcript = false
    @State private var currentTime: TimeInterval = 0
    @State private var currentText = ""
    private let timeObserver: PlayerTimeObserver
    private let avplayer: AVPlayer
    private let parser: Subtitles?
    
    init(){
        avplayer = AVPlayer(url:  Bundle.main.url(forResource: "Diabetes Info", withExtension: "MOV")!)
        parser = try? Subtitles(file: URL(fileURLWithPath: Bundle.main.path(forResource: "diabetesInfo", ofType: "srt")!), encoding: .utf8)
        timeObserver = PlayerTimeObserver(player: avplayer)
    }
    var body: some View {
        NavigationView{
            if ASL && ASLwithCaptions{
                VideoPlayer(player: avplayer) {
                    VStack {
                        Spacer()
                        Spacer()
                        Text(currentText)
                            .foregroundColor(.white)
                            .background(Color.black)
                            .font(.title)
                            .multilineTextAlignment(.center)
                            .padding()
                            .onReceive(timeObserver.publisher) { time in
                                currentText = parser?.searchSubtitles(at: time) ?? ""
                            }
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }.ignoresSafeArea()
            } else if ASL && transcript{
                VStack{
                    VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "Diabetes Info", withExtension: "MOV")!))
                    Text("If you have type 2 diabetes, your pancreas does not make insulin or makes very little insulin. Insulin helps blood sugar enter the cells in your body for use as energy. Without insulin, blood sugar can’t get into the cells and builds up in the bloodstream. High blood sugar is damaging to the body and causes many of the symptoms and complications of diabetes.")
                        .padding(20)
                }
            }
            else if ASL{
                VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "Diabetes Info", withExtension: "MOV")!))
            } else{
                Text("Type 2 diabetes is chronic disease in which the pancreas does not make insulin or makes very little insulin. Insulin helps blood sugar enter the cells in your body for use as energy. Without insulin, blood sugar can’t get into the cells and builds up in the bloodstream. High blood sugar is damaging to the body and causes many of the symptoms and complications of diabetes.")
                    .multilineTextAlignment(.leading)
                    .font(.title2)
                    .lineSpacing(10)
                    .padding(20)
            }
        }
        .navigationTitle("Type 2 Diabetes")
        
        .toolbarBackground(CustomColor.background, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(CustomColor.background, for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
        
    }
}



struct AboutConditionsVideoView_Previews: PreviewProvider {
    static var previews: some View {
        AboutConditionsVideoView()
    }
}
