//
//  ContentView.swift
//  Jackpot
//
//  Created by SOUMYATTAM DEY on 28/04/21.
//

import SwiftUI

struct ContentView: View {
    
    //adding State properties
    
    @State var upperSlot=["apple","apple","apple"]
    @State var mainSlot=["star","star","star"]
    @State var lowerSlot=["cherry","cherry","cherry"]
    
    @State var background_upper_slot=[Color.white,Color.white,Color.white]
    @State var background_main_slot=[Color.white,Color.white,Color.white]
    @State var background_lower_slot=[Color.white,Color.white,Color.white]
    
    @State var creditScore=1000
    @State var win=false;
    
    var body: some View {
        
        ZStack{
            Rectangle()
                .foregroundColor(Color.init( red: 200/255, green: 143/255, blue: 32/255, opacity: 1))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            Rectangle()
                .foregroundColor(Color.init( red: 228/255, green: 195/255, blue: 76/255, opacity: 100))
                .rotationEffect(Angle(degrees: 45))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack{
                Spacer()
                
                HStack{
                    
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    Text("SwiftUI Slots!")
                        .bold()
                        .foregroundColor(.white)

                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                    
                }.scaleEffect(2)
                
                Spacer()
                
                Text("Score: "+String(creditScore))
                    .font(.title2)
                    .padding(.all,10)
                    .background(win ? Color.green.opacity(0.5) : Color.white.opacity(0.5))
                    .animation(.none)
                    .cornerRadius(20)
                    .scaleEffect(win ? 1.2 : 1)
                    .animation(.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 0.2))
                
                Spacer()
                
                VStack{
                    HStack{
                        Spacer()
                        SlotView(symbol: $upperSlot[0], background:$background_upper_slot[0])
                        SlotView(symbol: $upperSlot[1], background:$background_upper_slot[1])
                        SlotView(symbol: $upperSlot[2], background:$background_upper_slot[2])
                        Spacer()
                    }
                    
                    HStack{
                        Spacer()
                        SlotView(symbol: $mainSlot[0], background:$background_main_slot[0])
                        SlotView(symbol: $mainSlot[1], background:$background_main_slot[1])
                        SlotView(symbol: $mainSlot[2], background:$background_main_slot[2])
                        Spacer()
                    }
                    
                    HStack{
                        Spacer()
                        SlotView(symbol: $lowerSlot[0], background:$background_lower_slot[0])
                        SlotView(symbol: $lowerSlot[1], background:$background_lower_slot[1])
                        SlotView(symbol: $lowerSlot[2], background:$background_lower_slot[2])
                        Spacer()
                    }
                }
                
                
                
                Spacer()
                
                HStack{
                    Spacer(minLength: 20)
                    
                    VStack{
                        Button(action: {
                            
                            //Generating random slot values
                            let mainslot_one_rand=Int.random(in: 1...3)
                            let mainslot_two_rand=Int.random(in: 1...3)
                            let mainslot_three_rand=Int.random(in: 1...3)
                            
                            
                            //Updating Mani Slot Element 1
                            if mainslot_one_rand==1{
                                mainSlot[0]="apple"
                            }
                            else if mainslot_one_rand==2 {
                                mainSlot[0]="cherry"
                            }
                            else {
                                mainSlot[0]="star"
                            }
                            
                            //Updating Main Slot Element 2
                            if mainslot_two_rand==1{
                                mainSlot[1]="apple"
                            }
                            else if mainslot_one_rand==2 {
                                mainSlot[1]="cherry"
                            }
                            else {
                                mainSlot[1]="star"
                            }
                            
                            //Updating Main Slot Element 3
                            if mainslot_three_rand==1{
                                mainSlot[2]="apple"
                            }
                            else if mainslot_three_rand==2 {
                                mainSlot[2]="cherry"
                            }
                            else {
                                mainSlot[2]="star"
                            }
                            
                            
                            //When all slot values are the same
                            if mainslot_one_rand==mainslot_two_rand && mainslot_two_rand==mainslot_three_rand {
                                
                                //Updating the main slot background to green
                                for i in 0..<background_main_slot.count{
                                    background_main_slot[i]=Color.green
                                }
                                
                                //Updating the credit score and win condition
                                creditScore+=5
                                win=true;
                            }
                            else {
                                //When the slot values are not same.Change background to white
                                for i in 0..<background_main_slot.count{
                                    background_main_slot[i]=Color.white
                                }
                                
                                //Updating the credit score and win condition
                                creditScore-=5
                                win=false
                            }
                            
                        }, label: {
                            Text("Spin")
                                .foregroundColor(Color.white)
                                .bold()
                                .padding(.all, 10.0)
                                .padding([.leading,.trailing],20)
                                .background(Color.pink)
                                .cornerRadius(20)
                                
                        })
                        
                        Text("5 Credits")
                        
                    }
                    
                    Spacer(minLength: 30)
                    
                    VStack {
                        Button(action: {
                            
                            //Restoring background of each of the slots
                            for i in 0..<background_upper_slot.count{
                                background_upper_slot[i]=Color.white
                                upperSlot[i]="apple"
                            }
                            for i in 0..<background_main_slot.count{
                                background_main_slot[i]=Color.white
                                mainSlot[i]="star"
                            }
                            for i in 0..<background_lower_slot.count{
                                background_lower_slot[i]=Color.white
                                lowerSlot[i]="cherry"
                            }
                            
                            //Restoring credit score and win condition
                            creditScore=1000
                            win=false
                                
                        }, label: {
                            Text("Reset")
                                .foregroundColor(Color.white)
                                .bold()
                                .padding(.all, 10.0)
                                .padding([.leading,.trailing],20)
                                .background(Color.pink)
                                .cornerRadius(20)
                        })
                        
                        Text("Reset Game")
                            
                    }
                    
                    Spacer(minLength: 10)
                    
                    VStack{
                        Button(action: {
                            
                            //Generating random main slot values
                            let mainslot_one_rand=Int.random(in: 1...3)
                            let mainslot_two_rand=Int.random(in: 1...3)
                            let mainslot_three_rand=Int.random(in: 1...3)
                            
                            //Generating random upper slot values
                            let upperslot_one_rand=Int.random(in: 1...3)
                            let upperslot_two_rand=Int.random(in: 1...3)
                            let upperslot_three_rand=Int.random(in: 1...3)
                            
                            //Generating random lower slot values
                            let lowerslot_one_rand=Int.random(in: 1...3)
                            let lowerslot_two_rand=Int.random(in: 1...3)
                            let lowerslot_three_rand=Int.random(in: 1...3)
                            
                            //Main Slot
                            
                            //Updating Main Slot Element 1
                            if mainslot_one_rand==1{
                                mainSlot[0]="apple"
                            }
                            else if mainslot_one_rand==2 {
                                mainSlot[0]="cherry"
                            }
                            else {
                                mainSlot[0]="star"
                            }
                            
                            //Updating Main Slot Element 2
                            if mainslot_two_rand==1{
                                mainSlot[1]="apple"
                            }
                            else if mainslot_two_rand==2 {
                                mainSlot[1]="cherry"
                            }
                            else {
                                mainSlot[1]="star"
                            }
                            
                            //Updating Main Slot Element 3
                            if mainslot_three_rand==1{
                                mainSlot[2]="apple"
                            }
                            else if mainslot_three_rand==2 {
                                mainSlot[2]="cherry"
                            }
                            else {
                                mainSlot[2]="star"
                            }
                            
                            //Upper Slot
                            
                            //Updating Upper Slot Element 1
                            if upperslot_one_rand==1{
                                upperSlot[0]="apple"
                            }
                            else if upperslot_one_rand==2 {
                                upperSlot[0]="cherry"
                            }
                            else {
                                upperSlot[0]="star"
                            }
                            
                            //Updating Upper Slot Element 2
                            if upperslot_two_rand==1{
                                upperSlot[1]="apple"
                            }
                            else if upperslot_two_rand==2 {
                                upperSlot[1]="cherry"
                            }
                            else {
                                upperSlot[1]="star"
                            }
                            
                            //Updating Upper Slot Element 3
                            if upperslot_three_rand==1{
                                upperSlot[2]="apple"
                            }
                            else if upperslot_three_rand==2 {
                                upperSlot[2]="cherry"
                            }
                            else {
                                upperSlot[2]="star"
                            }
                            
                            //Lower Slot
                            
                            //Updating Lower Slot Element 1
                            if lowerslot_one_rand==1{
                                lowerSlot[0]="apple"
                            }
                            else if lowerslot_one_rand==2 {
                                lowerSlot[0]="cherry"
                            }
                            else {
                                lowerSlot[0]="star"
                            }
                            
                            //Updating Lower Slot Element 2
                            if lowerslot_two_rand==1{
                                lowerSlot[1]="apple"
                            }
                            else if lowerslot_two_rand==2 {
                                lowerSlot[1]="cherry"
                            }
                            else {
                                lowerSlot[1]="star"
                            }
                            
                            //Updating Lower Slot Element 3
                            if lowerslot_three_rand==1{
                                lowerSlot[2]="apple"
                            }
                            else if lowerslot_three_rand==2 {
                                lowerSlot[2]="cherry"
                            }
                            else {
                                lowerSlot[2]="star"
                            }
                            
                            
                            //When all slot values are the same
                            if mainslot_one_rand==mainslot_two_rand && mainslot_two_rand==mainslot_three_rand && mainslot_three_rand==upperslot_one_rand && upperslot_one_rand==upperslot_two_rand && upperslot_two_rand==upperslot_three_rand && upperslot_three_rand==lowerslot_one_rand && lowerslot_one_rand==lowerslot_two_rand && lowerslot_two_rand==lowerslot_three_rand {
                                
                                //Updating the main slot background to green
                                for i in 0..<background_main_slot.count{
                                    background_main_slot[i]=Color.green
                                    background_upper_slot[i]=Color.green
                                    background_lower_slot[i]=Color.green
                                }
                                
                                //Updating the credit score and win condition
                                creditScore+=25
                                win=true
                                
                            }else if upperslot_one_rand==mainslot_two_rand && mainslot_two_rand==lowerslot_three_rand{
                                
                                //Updating slot background to green
                                background_upper_slot[0]=Color.green
                                background_main_slot[1]=Color.green
                                background_lower_slot[2]=Color.green
                                
                                //Updating credit score and win condition
                                creditScore+=25
                                win=true
                                
                            }else if upperslot_three_rand==mainslot_two_rand && mainslot_two_rand==lowerslot_one_rand{
                                //Updating slot background to green
                                background_upper_slot[2]=Color.green
                                background_main_slot[1]=Color.green
                                background_lower_slot[0]=Color.green
                                
                                //Updating credit score and win condition
                                creditScore+=25
                                win=true
                                
                            }
                            else {
                                //When the slot values are not same.Change background to white
                                for i in 0..<background_main_slot.count{
                                    background_main_slot[i]=Color.white
                                    background_upper_slot[i]=Color.white
                                    background_lower_slot[i]=Color.white
                                }
                                
                                //Updating the credit score and win condition
                                creditScore-=25
                                win=false
                                
                            }
                        }, label: {
                            Text("Max Spin")
                                .foregroundColor(Color.white)
                                .bold()
                                .padding(.all, 10.0)
                                .padding([.leading,.trailing],10)
                                .background(Color.pink)
                                .cornerRadius(20)
                        })
                        
                        Text("25 Credits")
                    }
                    
                    Spacer()
                }
                
                Spacer()
                
            }
        }
        .animation(.easeIn)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
