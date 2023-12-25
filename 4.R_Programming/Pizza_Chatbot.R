## Create Pizza Chatbot

chatbot <- function(){
## create df : pizza menu
    pizza_df <- data.frame(
    number = 1 :5,
    name = c("Margherita",  "Pepperoni", "Hawaiian", "Double Cheese", "Vegetarian"),
    price = c(449, rep(499,3),399)
    )

## create df : drink menu
    drink_df <- data.frame(
    number = 1 : 3,
    name =  c("Beer", "Coke", "Water"),
    price = c(129, 40 , 20)
    )

## welcome customer
    print("Welcome to Pizza ABC 1190")
    flush.console()
    c_name <- readline("What's your name? : ")
    cat("\n")
    print(paste0("🥰khun ",toupper(c_name),"🥰What would you like to order today?"))
    cat("\n")
    print("Our Pizza menu")
    print(pizza_df)
    cat("\n")
    print("Our Drink menu")
    print(drink_df)

    qty_piz <- 0
    qty_dr <- 0
    sum_piz_price <- 0
    sum_dr_price <- 0
    total_price <- 0

    flush.console()


    pizza_loop <-readline("Order Pizza? (1:yes or 2:no) :")
      ## idea is create the df
    while(pizza_loop == 1 || tolower(pizza_loop) == "yes"){
        c_piz_no <- as.numeric(readline("select your pizza order number(1-5): "))
        c_piz_qty <- as.numeric(readline("Quantity :"))
        qty_piz = qty_piz + c_piz_qty
        sum_piz_price = sum_piz_price + (pizza_df[["price"]][c_piz_no] * c_piz_qty)
        print(paste0("🥰khun ",toupper(c_name),"🥰 ordered: ",pizza_df[["name"]][c_piz_no]," Pizza","(Quantity :",c_piz_qty, "pcs)🙏🙏🙏"  ))
        flush.console()
        pizza_loop <-readline('Order another pizza? (1:yes or 2:no) :')
        }

    drink_loop <-readline("Order Drink? (1:yes or 2:no) :")
      ## idea is create the df
    while(drink_loop == 1 || tolower(drink_loop) == "yes"){
        c_dr_no <- as.numeric(readline("select your drink order number(1-3): "))
        c_dr_qty <- as.numeric(readline("Quantity :"))
        qty_dr = qty_dr + c_dr_qty
        sum_dr_price = sum_dr_price + (drink_df[["price"]][c_dr_no] * c_dr_qty)
        print(paste0("🥰khun ",toupper(c_name),"🥰 ordered: ",drink_df[["name"]][c_dr_no],"(Quantity :",c_dr_qty, "pcs)🙏🙏🙏"  ))
        flush.console()
        drink_loop <-readline('Order another Drink? (1:yes or 2:no) :')
        }

        total_price = (sum_piz_price + sum_dr_price)
        flush.console()

        print(paste("Order Detail / Customer name:",toupper(c_name)))
        print(paste("Pizza quantity : ",qty_piz, "amount", sum_piz_price))
        print(paste("Drink quantity : ",qty_dr, "amount", sum_dr_price))
        print(paste("total price :",total_price))
        print(paste("🙏🙏🙏Thank you very much khun",toupper(c_name),"🙏🙏🙏" ))
        print("🥰🥰🥰Enjoy your food🥰🥰🥰")
        flush.console()

}

chatbot()
