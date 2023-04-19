//
//  SideEffectsMildVideoView.swift
//  AboutMedications
//
//  Created by Adira Blumenthal on 2/13/23.
//

import SwiftUI
import AVKit

struct SideEffectsMildVideoView: View {
    @AppStorage("ASL") var ASL = false
    @AppStorage("ASLwithCaptions") var ASLwithCaptions = false
    @AppStorage("addTranscript") var transcript = false
    @State private var currentTime: TimeInterval = 0
    @State private var currentText = ""
    private let timeObserver: PlayerTimeObserver
    private let avplayer: AVPlayer
    private let parser: Subtitles?
    
    init(){
        avplayer = AVPlayer(url:  Bundle.main.url(forResource: "Metformin Common Side Effects", withExtension: "mov")!)
        parser = try? Subtitles(file: URL(fileURLWithPath: Bundle.main.path(forResource: "metforminsideffects", ofType: "srt")!), encoding: .utf8)
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
                    VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "Metformin Common Side Effects", withExtension: "mov")!))
                    ScrollView{
                        VStack(alignment: .leading, spacing: 8){
                            Text("Side effects that usually do not require medical attention (report to your care team if they continue or are bothersome")
                            Text("- Diarrhea")
                            Text("- Gas")
                            Text("- Headache")
                            Text("- Metallic taste in mouth")
                            Text("- Nausea")
                        }
                        .padding(20)
                    }
                    
                }
            }
            else if ASL{
                VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "Metformin Common Side Effects", withExtension: "mov")!))
            } else{
                VStack(alignment: .leading, spacing: 8){
                    Text("Side effects that usually do not require medical attention (report to your care team if they continue or are bothersome")
                        .font(.title2)
                        .lineSpacing(10)
                    Text("- Diarrhea")
                        .font(.title2)
                        .lineSpacing(10)
                    Text("- Gas")
                        .font(.title2)
                        .lineSpacing(10)
                    Text("- Headache")
                        .font(.title2)
                        .lineSpacing(10)
                    Text("- Metallic taste in mouth")
                        .font(.title2)
                        .lineSpacing(10)
                    Text("- Nausea")
                        .font(.title2)
                        .lineSpacing(10)
                }
                .padding(20)
            
        }
    }
        .navigationTitle("Common Side Effects")
        .toolbarBackground(CustomColor.background, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(CustomColor.background, for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
}
}

struct SideEffectsMildVideoView_Previews: PreviewProvider {
    static var previews: some View {
        SideEffectsMildVideoView()
    }
}
