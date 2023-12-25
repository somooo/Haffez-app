//
//  Qoutes page .swift
//  NotificationsApp
//
//  Created by bsamh on 25/12/2023.
//

import SwiftUI

struct QoutesPage: View {
    let quotes = [
        NSLocalizedString("IF you get tired, learn to rest not to quit", comment: "") ,
        NSLocalizedString("There is no Failure You either Win or Learn", comment: "") ,
        NSLocalizedString("Let your dreams be your wings", comment: "") ,
        NSLocalizedString("Hey, when life gives you Monday , Dip it in glitter and Sparkle all day", comment: "") ,
        NSLocalizedString("Life is 10% what happens to you , and 90% how you react to it", comment: "") ,
        NSLocalizedString("If the plan doesn’t work change the plan but never the Goal", comment: "") ,
        NSLocalizedString("Unless someone like you cares a whole awful lot nothing is going to get better it’s not", comment: ""),
        NSLocalizedString("Be who you are and say how you feel because those who mind don’t matter and those who matter don’t mind", comment: ""),
        NSLocalizedString("You’re on your own. And you know what you know, and you are the one who’ll decide where to go.", comment: ""),
        NSLocalizedString("You’ll be on your way Up! You’ll be seeing great sights! You’ll join the high fliers Who soar to high heights.", comment: "")
      
    ]
    
    @State private var currentQuoteIndex = 0
    
    var body: some View {
        VStack {
            Spacer()
            CardView(quote: quotes[currentQuoteIndex])
                .padding()
                .onTapGesture {
                    // Show a new quote when tapped
                    currentQuoteIndex = (currentQuoteIndex + 1) % quotes.count
                }
            Spacer()
        }
    }
}

struct CardView: View {
    let quote: String
    
    var body: some View {
        VStack { Spacer()
            Text(quote)
                .foregroundColor(.hBlue)
                .font(.title)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center) // Center the text
                .padding()
            Spacer()
          
            
            HStack {
                Spacer()
                Button(action: {
                    // Add copy functionality
                    UIPasteboard.general.string = quote
                }) {
                    Image(systemName: "doc.on.doc")
                        .padding()
                        .foregroundColor(.hBlue)
                }
                .background(Color(red: 0.77, green: 0.89, blue: 1))
                .clipShape(Circle())
                .padding(EdgeInsets(top: 0, leading: 16, bottom: 16, trailing: 0))
            }
        }
        .background(Color(red: 0.77, green: 0.89, blue: 1))
        .cornerRadius(16)
        .padding(EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 16))
    }
}

//@main
struct NotificationsApp: App {
    var body: some Scene {
        WindowGroup {
            QoutesPage()
        }
    }
}
