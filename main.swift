import Foundation

class book{
  var book_name: String
  var category: String
  let no_of_pages: Int
  let price: Float
  var tot:Float = 1.0

  init(book_name: String, category: String, no_of_pages: Int, price: Float){
    self.book_name = book_name
    self.category = category
    self.no_of_pages = no_of_pages
    self.price = price
  }

  
  func order(){
    print("Quantity: ", terminator: "")
    let q1 = readLine()
    guard let q2 = q1, let q = Float(q2) else{
      print("Error...")
      return 
    }
    ord += 1
    tot = Float(q) * Float(self.price)
    print("\nYour Order: \nOrder Id: #\(ord) \nname: \(self.book_name) \nTotal Pages: \(self.no_of_pages) \nPrice: \(self.price) \nquantity: \(q) \nTotal Price: \(tot) \n\n Order Placed!!")
  }
}


var ord = 0

let lotr = book(book_name: "Lord of the Rings", category: "fantasy", no_of_pages: 1200, price: 800)

let sherlock = book(book_name: "sherlock", category: "Mystery", no_of_pages: 400, price: 480)

let harry = book(book_name: "harry potter (all coolection)", category: "fantasy", no_of_pages: 1400, price: 1850)

let gg = book(book_name: "Gone Girl", category: "Mystery", no_of_pages: 450, price: 400)

var books: [book] = [lotr, sherlock, harry, gg]

var name = books.map({$0.book_name})

var endl: Bool = true
var endl1: Bool = true
var endl2: Bool = true
var curs: String = "nil"
print("\t\t Online Book Store!!! \t\t\n")


start: 
while(endl){
  print("\nExplore - (e) \t Order - (o) \t Add your Book - (ad) \t Exit - (ex) \n")
  guard var ans = readLine() else{ 
    print("You haven’t entered any Key")
    continue start
  }
  
  s1: 
  while(endl2){
    
    switch ans.lowercased(){
      case "e":
      print("\nExplore By Category - (c) \nExplore By Price - (p) \nGo Back - (b) \nExit(ex)")
      while(endl1){
        guard let ans1 = readLine() else{
          print("You haven’t entered any value!!!")
          continue s1
        }
        switch ans1.lowercased(){
          case "c":
          var categories = Set(books.map{$0.category})
          print("Categories..")
          for i in categories {
            print("\(i): ", terminator: "")
            for j in books{
              if j.category == i{
              print("\(j.book_name)", terminator: ", ")
              }
            }
            print("\n")
          }
          print("\nWanna Order(o)? 0r Go Back(b)? or Press any key to exit\n")
          guard let ans2 = readLine() else{
            print("Not responded Going back to starting!!!")
            continue start
          }
            
          switch ans2{
            case "o":
            ans = "o"
            continue s1
    
            case "b":
            ans = "e"
            continue s1
    
            default:
            print("Thank You!!!")
            endl = false
            continue start 
          }
      
          case "p":
          print("\nFrom Rs.0 to Rs.500: ", terminator: "")
          print(books.filter({$0.price <= 500}).map({$0.book_name}))

          let a = books.filter({$0.price <= 500})
          
          
          print("\n\nFrom Rs.501 to Rs.1000: ", terminator: "")
          
          print(books.filter({$0.price > 500 && $0.price <= 1000}).map({$0.book_name }))
          
          print("\n\nRs. 1000 above: ", terminator: "")

          print(books.filter({$0.price > 1000}).map({$0.book_name}))
          print("\nWanna Order(o)? 0r Go Back(b)?\n")
          guard let ans2 = readLine() else{
            print("You Didn’t Entered any Value...!")
            continue start
          }
            
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
          endl = false
          continue start
            
      
          default:
          print("\nEnter correct values: c, p, b (or) ex")
          continue s1
        }      
      }
      case "o":
      print("Enter Book Name: ", terminator: "")
      guard let bname = readLine() else{
        print("Unexpected Error")
        continue start
      }
      let b = bname[..<bname.index(bname.startIndex, offsetBy: 4)]
      let begin = String(b)
      let e = bname[bname.index(bname.endIndex, offsetBy: -4)...]
      let end = String(e)
      
      for i in books{
        if i.book_name.lowercased() == bname.lowercased(){
          i.order()
        }
        else if begin == i.book_name[..<i.book_name.index(i.book_name.startIndex, offsetBy: 4)]{
          print("Can't Find the book! \n Did you mean \(i.book_name)? \nType (y)es or any key to Exit")
          let yesno1 = readLine()
          guard let yesno = yesno1 else{
            print("Error")
            continue start
          }
          if yesno.lowercased() == "y"{
            i.order()
          }
          else if end == i.book_name[i.book_name.index(i.book_name.endIndex, offsetBy: -4)...] {
             print("Can't Find the book! \n Did you mean \(i.book_name)? \nType (y)es or any key to Exit")
          let yesno = readLine()!
          if yesno.lowercased() == "y"{
            i.order()
          }
          } 
          else{
            print("Book Not Found")
            print("Sorry For the Inconvenience!!")
            continue start
          }
          
        }
      }    
      continue start
  
      case "ad":
      print("Enter how many Books: ", terminator: "")
      let n1 = readLine()
      guard let n2 = n1, let n = Int(n2) else{
        print("Error")
        continue start
      } 
      for _ in 0..<n{
        print("Enter the name of your book: ", terminator: "")
        let name_ur_book = readLine()
        guard let name_ur_b = name_ur_book else{
          print("Error")
          continue start
        }
        let trimmed = name_ur_b.filter({$0 != " "})
        if name_ur_b == "" || trimmed == ""{
          print ("you haven’t entered the name!")
          continue start
        }
        print("Enter the category:", terminator: "")
        let cat_ur_book = readLine()
        guard let cat_ur_b = cat_ur_book else{
          print("error")
          continue start
        }
        print("Enter How many pages: ", terminator: "")
        let page_ur_book = readLine()
        guard let p = page_ur_book, let page_ur_b = Int(p) else{
          print("error")
          continue start
        }
        print("Enter book price: ", terminator: "")
        let b_price1 = readLine()
        guard let b = b_price1, let b_price = Float(b) else{
          print("Error")
          continue start
        }
        let obj = book(book_name: name_ur_b, category: cat_ur_b, no_of_pages: page_ur_b, price: b_price)
        books.append(obj)
      }
      print("Book(s) Added Successfully!!!")
      
      continue start
      
      case "ex":
      endl = false; continue start
          
      default:
      print("Enter correct value: e, o, ad, (or) ex")
      continue start
    }    
  }
  endl = false
}

