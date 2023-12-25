## Create Game Hammer-Scissors-Paper
## Link for run the code as below
## https://colab.research.google.com/drive/19SyPy-OyDcrnRJnfZyJojCZHl_jF6bnd?usp=sharing#scrollTo=bI4JBan7GzUU

game <- function(){
    print("Hi! welcome to the game 🔨✂️📃")
    flush.console()
    username <- readline("What's your name? : ")
    end_round <- as.numeric(readline("Rounds to play ? : "))

   ## while (!is.numeric(end_round)) {
   ##     print("In valid, please select again number only!")
   ##     flush.console()
   ##     end_round <- readline("Rounds to play ? : ")
   ##     }

    print(paste("Let's start! ,",username))
    print("You have 3 choice as below...")
    print("[ 1 : Hammer🔨 | 2 : scissors✂️  | 3 : paper📃 ]")

    u_score <- 0
    pc_score <- 0
    rounds <- 1
    hands <- c("1","2","3")


    while( rounds <= end_round  ){
    print(paste("---------- ROUND ",rounds," -----------"))
    flush.console()

    u_hand<-readline("Select your choice : ")
    pc_hand <- sample(hands,1)
    while(u_hand != "1" && u_hand != "2" && u_hand != "3"){
        print("In valid, please select again by 1, 2, 3 only!")
        flush.console()
        u_hand<-readline("Select your choice : ")
        pc_hand <- sample(hands,1)
    }


    if(u_hand == pc_hand){
      print("🤝🤝🤝Draw🤝🤝🤝")
      }else if (u_hand == 1 && pc_hand == 2 ||
              u_hand == 2 && pc_hand == 3 ||
              u_hand == 3 && pc_hand == 1 ){
              print("😆😆😆You Win😆😆😆")
              u_score = u_score +1
      }else{
              print("😭😭😭You lose😭😭😭")
              pc_score = pc_score +1

      }

    u_hand_name <- switch(u_hand,
                 "1" = "Hammer🔨",
                 "2" = "scissors✂️",
                 "3" = "Paper📃")
    pc_hand_name <- switch(pc_hand,
                 "1" = "Hammer🔨",
                 "2" = "scissors✂️",
                 "3" = "Paper📃")

    print(paste(username,"choose",u_hand_name , "VS", pc_hand_name))
    print(paste("current score", u_score, ":", pc_score))
    rounds = rounds + 1
    }
    print("---------------------------------------------------------")
    print("🏁🚦🏁🚦🏁🚦🏁🚦Summary Score🚦🏁🚦🏁🚦🏁🚦🏁")
    print(paste(username,"score :",u_score ))
    print(paste("Bot score :",pc_score ))
    if(u_score > pc_score){
        print("🎊🎊🎊🎊The winner is you. This game so easy!! 🎊🎊🎊🎊")
    }else if((u_score < pc_score)){
        print("😭😭😭Your lost!! 😭😭😭")
    }else{
        print("🤝🤝🤝Draw!! 🤝🤝🤝")
    }
  flush.console()
  }

game()

1
