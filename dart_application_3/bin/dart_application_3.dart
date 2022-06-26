import 'dart:io';

void main() {
  // add objects to the list

  books.add(Book(
      id: 1,
      author: "Simon Sinek",
      Title: "Start with why",
      price: 80.0,
      quantity: 13));
  books.add(Book(
      id: 2,
      author: "J. Clark Scott",
      Title: "But how do it know",
      price: 59.9,
      quantity: 22));
  books.add(Book(
      id: 3,
      author: "Robert Cecil Martin",
      Title: "Clean Code",
      price: 50.0,
      quantity: 5));
  books.add(Book(
      id: 4,
      author: "Peter Thiel",
      Title: "Zero to One",
      price: 45.0,
      quantity: 12));
  books.add(Book(
      id: 5,
      author: "Kyle Simpson",
      Title: "You don't know JS",
      price: 39.9,
      quantity: 9));

//  OverView message to start the program
  OverView();

  for (var i = 0; i < 50; i++) {
    //  User Select From Here
    options();
    var input = stdin.readLineSync(); //Taking Input From The User
    InputFromUser(UserChoice: input);
  }
}

OverView() {
  print("\nHello you are in ${BookkStore.libraryName}\n"); // from super class
  print("${BookkStore.libraryName1}"); // frome super class
}

options() {
  print(
      "  Plz select from the optoins \n\n 1: Show all Books \n  2: Add a new Book \n 3: Search For a Book By: \n 4: Remove a Book \n 5: to exit\n\n");
}

List<Book> books = [];

addbook(
    {int? id, String? title, String? author, double? price, int? quantity}) {
  books.add(Book(
      id: id, Title: title, author: author, price: price, quantity: quantity));
}

abstract class BookkStore {
  //Super class
// here are the attrabuites
  int? id;
  String? Title;
  String? author;
  double? price;
  int? quantity;
  static String libraryName =
      " Wurud And Hanan Library  "; //using static concept
  static String libraryName1 =
      " You can search for any book you want in this library  "; //static concept

  BookkStore(
      {this.id,
      this.Title,
      this.author,
      this.price,
      this.quantity}); // this is a constracter

} //super class end

class Book extends BookkStore {
  // child class that extend the atrabuots from BookkStore class
  Book(
      {required super.id,
      required super.Title,
      required super.author,
      required super.price,
      required super.quantity});

  showBook() {
    // print BookkStore class

    print("This is the id:  ${super.id}");
    print("This is the title:   ${super.Title}");
    print("This is the author:  ${super.author}");
    print("This is the pricec:  ${super.price}");
    print("This is the quantity:  ${super.quantity} is avaiable\n");
  }
}

printTheBooks() {
  for (var i = 0; i < books.length; i++) {
    books[i].showBook();
  }
}

//
searchById({int? id}) {
  for (var i in books) {
    if (i.id == id) {
      print("\nHere is The book: \n");
      i.showBook();
    }
  }
}

searchByTitle({String? title}) {
  for (var i in books) {
    if (i.Title == title) {
      print("\nHere is The book: \n");
      i.showBook();
    }
  }
}

searchByAuthor({String? author}) {
  for (var i in books) {
    if (i.author == author) {
      print("\nHere is The book: \n");
      i.showBook();
    }
  }
}

searchBy() {
  print(
      "Searching for a book:\n 1 By The  id \n2  By The  title \n3  By The  Author \n");
  var input = int.parse(stdin.readLineSync()!);
  // If Statment With User Inputs and Storing to the functions
  if (input == 1) {
    print("\nEnter Book id:");
    int id = int.parse(stdin.readLineSync()!);
    searchById(id: id);
  } else if (input == 2) {
    print("\nEnter Book Title:");
    var title = stdin.readLineSync()!;
    searchByTitle(title: title);
  } else if (input == 3) {
    print("\nEnter Author:");
    var author = stdin.readLineSync()!;
    searchByAuthor(author: author);
  }
}

removeBook({int? id}) {
  bool Remove = false;
  for (var i = 0; i < books.length; i++) {
    if (books[i].id == id) {
      books.removeAt(i);
      Remove = true;
      print("\nThanks, Book is Removed \n");
    }
  }
}

// Taking Input from uuser
InputFromUser({String? UserChoice}) {
  switch (UserChoice) {

// Frist Case Print All Books

    case "1":
      print("\n");
      printTheBooks();
      break;

// Secend Case User Will Add a book

    case "2":
      print("\nadd new Book:\n");
      print("Plz add id: \n");
      var bookid = int.parse(stdin.readLineSync()!);
      print("Plz add the Title : \n");
      var booktitle = stdin.readLineSync();
      print("Plz add the Price:\n ");
      var bookprice = double.parse(stdin.readLineSync()!);
      print("Plz add the auther:\n ");
      var bookauther = stdin.readLineSync();
      print("Plz add the Quantity : \n");
      var bookQ = int.parse(stdin.readLineSync()!);
      print("Thanks! Book Added Successfully\n ");

// Taking The Inputs And Add Them To Addbook Method
      addbook(
          author: bookauther,
          id: bookid,
          price: bookprice,
          quantity: bookQ,
          title: booktitle);
      break;

// Third Case User Will Search for a book

    case "3":
      print(searchBy());
      break;

// Forth Case User Will Remove a book

    case "4":
      print("\Plz Enter Book id to Remove it\n ");
      removeBook(id: int.parse(stdin.readLineSync()!));
      break;

    // Fifth Case End the Program

    case "5":
      exit(0);
      break;
  }
}
