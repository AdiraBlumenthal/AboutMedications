//
//  AboutConditionsVideoView.swift
//  AboutMedications
//
//  Created by Adira Blumenthal on 2/6/23.
//

import SwiftUI
import AVKit

struct AboutConditionsVideoView2: View {
    @AppStorage("ASL") var ASL = false
    @AppStorage("ASLwithCaptions") var ASLwithCaptions = false
    @AppStorage("addTranscript") var transcript = false
    @State private var currentTime: TimeInterval = 0
    @State private var currentText = ""
    private let timeObserver: PlayerTimeObserver
    private let avplayer: AVPlayer
    private let parser: Subtitles?
    
    init(){
        avplayer = AVPlayer(url:  Bundle.main.url(forResource: "CholesterolInfoComposited", withExtension: "mp4")!)
        parser = try? Subtitles(file: URL(fileURLWithPath: Bundle.main.path(forResource: "CholesterolInfo", ofType: "srt")!), encoding: .utf8)
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
                    VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "CholesterolInfoComposited", withExtension: "mp4")!))
//                    ScrollView{
                        Text("If you have high blood cholesterol, it can lead to a buildup called plaque on the walls of your arteries. As plaque builds up over time, the inside of arteries become narrow. This narrowing blocks blood flow to and from your heart and other organs. High blood cholesterol does not have symptoms, which is why getting your cholesterol levels checked is so important. It can cause chest pain or a heart attack if untreated.")
                            .padding(20)
//                    }
                }
            }
            else if ASL{
                VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "CholesterolInfoComposited", withExtension: "mp4")!))

            } else{
                Text("If you have high blood cholesterol, it can lead to a buildup called plaque on the walls of your arteries. As plaque builds up over time, the inside of arteries become narrow. This narrowing blocks blood flow to and from your heart and other organs. High blood cholesterol does not have symptoms, which is why getting your cholesterol levels checked is so important. It can cause chest pain or a heart attack if untreated.")
                    .multilineTextAlignment(.leading)
                    .font(.title2)
                    .lineSpacing(10)
                    .padding(20)
            }
        }
        .navigationTitle("High Cholesterol")
        .toolbarBackground(CustomColor.background, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(CustomColor.background, for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
    }
}

struct AboutConditionsVideoView2_Previews: PreviewProvider {
    static var previews: some View {
        AboutConditionsVideoView2()
    }
}
