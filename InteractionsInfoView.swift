//
//  InteractionsInfoView.swift
//  AboutMedications
//
//  Created by Adira Blumenthal on 2/8/23.
//

import SwiftUI
import AVKit

struct InteractionsInfoView: View {
    @AppStorage("ASL") var ASL = false
    @AppStorage("ASLwithCaptions") var ASLwithCaptions = false
    @AppStorage("addTranscript") var transcript = false
    @State private var currentTime: TimeInterval = 0
    @State private var currentText = ""
    private let timeObserver: PlayerTimeObserver
    private let avplayer: AVPlayer
    private let parser: Subtitles?
    
    init(){
        avplayer = AVPlayer(url:  Bundle.main.url(forResource: "InteractionsInformationComposited", withExtension: "mp4")!)
        parser = try? Subtitles(file: URL(fileURLWithPath: Bundle.main.path(forResource: "InteractionsInformation", ofType: "srt")!), encoding: .utf8)
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
                    VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "InteractionsInformationComposited", withExtension: "mp4")!))
                    ScrollView{
                        VStack(alignment: .leading, spacing: 8){
                            Text("Critical ⚠⚠⚠")
                                .bold()
                                .background(CustomColor.Red)
                                .font(.title2)
                                .padding([.leading, .trailing], 30)
                            Text("Do not take this combination together. Contact your doctor, pharmacist, or care team to discuss this combination. Sever or life-threatening side effects may occur or your medication may not work as well. In rare cases, they may be taken together with specifc approval from your care team.")
                                .multilineTextAlignment(.leading)
                                .padding([.leading, .trailing], 30)
                                .padding(.bottom, 10)
                            Text("Serious ⚠⚠")
                                .bold()
                                .font(.title2)
                                .background(CustomColor.Orange)
                                .padding([.leading, .trailing], 30)
                            Text("Discuss this combination with your care team. Taking them together may casue significant side effects or cause your medications to not work as well. Your care team may recommend changes to your treatment plan. Ask your care team what to watch from when taking this combination.")
                                .multilineTextAlignment(.leading)
                                .padding([.leading, .trailing], 30)
                                .padding(.bottom, 10)
                            Text("Moderate ⚠")
                                .bold()
                                .font(.title2)
                                .background(CustomColor.Yellow)
                                .padding([.leading, .trailing], 30)
                            Text("In certain cases, this combination may be taken together. When taken togheter, side effects may occur or your medications may not work as well. Your care team may recommend changes to your treatment plan. Ask your care team what to watch for when taking this combination.")
                                .multilineTextAlignment(.leading)
                                .padding([.leading, .trailing], 30)
                        }
                    }
                }
            }
            else if ASL{
                VideoPlayer(player: AVPlayer(url:  Bundle.main.url(forResource: "InteractionsInformationComposited", withExtension: "mp4")!))
            } else{
                ScrollView{
                    VStack(alignment: .leading, spacing: 8){
                        Text("Critical ⚠⚠⚠")
                            .bold()
                            .font(.title2)
                            .background(CustomColor.Red)
                            .padding([.leading, .trailing], 30)
                        Text("Do not take this combination together. Contact your doctor, pharmacist, or care team to discuss this combination. Sever or life-threatening side effects may occur or your medication may not work as well. In rare cases, they may be taken together with specifc approval from your care team.")
                            .multilineTextAlignment(.leading)
                            .padding([.leading, .trailing], 30)
                            .padding(.bottom, 10)
                        Text("Serious ⚠⚠")
                            .bold()
                            .font(.title2)
                            .background(CustomColor.Orange)
                            .padding([.leading, .trailing], 30)
                        Text("Discuss this combination with your care team. Taking them together may casue significant side effects or cause your medications to not work as well. Your care team may recommend changes to your treatment plan. Ask your care team what to watch from when taking this combination.")
                            .multilineTextAlignment(.leading)
                            .padding([.leading, .trailing], 30)
                            .padding(.bottom, 10)
                        Text("Moderate ⚠")
                            .bold()
                            .font(.title2)
                            .background(CustomColor.Yellow)
                            .padding([.leading, .trailing], 30)
                        Text("In certain cases, this combination may be taken together. When taken togheter, side effects may occur or your medications may not work as well. Your care team may recommend changes to your treatment plan. Ask your care team what to watch for when taking this combination.")
                            .multilineTextAlignment(.leading)
                            .padding([.leading, .trailing], 30)
                    }
                }
            }
        }
        .navigationTitle("Interactions")
        .toolbarBackground(CustomColor.background, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarBackground(CustomColor.background, for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
    }
}

struct InteractionsInfoView_Previews: PreviewProvider {
    static var previews: some View {
        InteractionsInfoView()
    }
}
