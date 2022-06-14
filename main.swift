class book{
  var book_name: String
  var category: String
  let no_of_pages: Int
  let price: Float

  var ord: Int = 0
  var tot: Float = 1

  init(book_name: String, category: String, no_of_pages: Int, price: Float){
    self.book_name = book_name
    self.category = category
    self.no_of_pages = no_of_pages
    self.price = price
  }
  func order(quantity: Float){
    ord += 1
    tot = quantity * Float(price)
    
  }
  func disp(){
    print("Book Name: \(book_name) \n NOP: \(no_of_pages) \n price: \(price)") 
  }
}

let lotr = book(book_name: "Lord of the Rings", category: "fantasy", no_of_pages: 1200, price: 800)

let sherlock = book(book_name: "sherlock", category: "Mystery", no_of_pages: 400, price: 480)

let harry = book(book_name: "harry potter (all coolection)", category: "fantasy", no_of_pages: 1400, price: 1850)

let gg = book(book_name: "Gone Girl", category: "Mystery", no_of_pages: 450, price: 400)

var books: Array = [lotr, sherlock, harry, gg]
var name: [String] = []
var cat: [String] = []
for i in books{
  if !(cat.contains(i.category)){
    cat.append(i.category)
  } 
}
for i in books{
    name.append(i.book_name)
}
print(name)


var endl: Bool = true
var endl1: Bool = true
var endl2: Bool = true
var curs: String = "nil"
print("\t\t Online Book Store!!! \t\t\n")


start: while(endl){
  print("\nExplore - (e) \t Order - (o) \t Add your Book - (ad) \t Exit - (ex) ")
  var ans = readLine()
  
s1: while(endl2){ 
      switch ans{
      case "e":
      print("\nExplore By Category - (c) \nExplore By Price - (p) \nGo Back - (b) \nExit(ex)")
      while(endl1){
        var ans1 = readLine()
        switch(ans1){
          case "c":
          print("Categories..")
          for i in cat{
            print("\(i): ", terminator: "")
            for j in books{
              if j.category == i{
              print("\(j.book_name)", terminator: ", ")
              }
            }
            print("\n")
          }
          print("\nWanna Order(o)? 0r Go Back(b)?\n")
          var ans2 = readLine()
          switch ans2{
            case "o":
            ans = ans2
            continue s1
  
            case "b":
            ans = "e"
            continue s1
  
            default:
            print("Enter Correct Value")
          }
    
          case "p":
          print("\nFrom Rs.0 to Rs.500: ", terminator: "")
          for i in books{
            if Int(i.price) <= 500{
              print("\(i.book_name)", terminator: ", ")
            }
          }
          print("\n\nFrom Rs.501 to Rs.1000: ", terminator: "")
          for i in books{
            if Int(i.price) > 500 && Int(i.price)<=1000{
              print("\(i.book_name)", terminator: ", ")
            }
          }
          print("\n\nRs. 1000 above: ", terminator: "")
          for i in books{
            if Int(i.price) > 1000{
              print("\(i.book_name)", terminator: ", ")
            }
          }
          print("\nWanna Order(o)? 0r Go Back(b)?\n")
          var ans2 = readLine()
          switch ans2{
            case "o":
            ans = ans2
            continue s1
  
            case "b":
            ans = "e"
            continue s1
  
            default:
            print("Enter Correct Value")
          }
          case "b":
          continue start
  
          case "ex":
          continue start
          break
    
          default:
          print("\nEnter correct values: c, p, b (or) ex")
        }
      }
        case "o":
        print("Enter Book Name:")
        var bname1 = readLine()
        var bname = bname1!
        
        
          var isbook: Bool = true
        for i in name{
          if i == bname{
              isbook = true
          }
          
          // else if i[...3] == name[...3]{
          //   print("Do you mean: \(i)? \n(y)es || (n)0")
          //   var check = readLine()
          //   isbook = (check == "y" ? true : false)
          // }
          else{
            isbook = false
          }
        }
        if isbook{
        print("Quantity:")
        var q1 = Float(readLine()!)
        
        for i in books{
          if bname == i.book_name{
            i.order(quantity: Float(q1!))
            i.disp()
            break
          }
        }
        }
        else{ 
        print("Book Not Found")
          continue s1
        }
        continue start

        case "ex":
        endl = false
        break
        
        default:
        print("Enter correct value: e, o, ad, (or) ex")
    }
    endl = false
    }
  
}