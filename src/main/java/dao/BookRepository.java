package dao;

import java.util.ArrayList;

import dto.Book;

public class BookRepository {
	private ArrayList<Book> listOfBooks = new ArrayList<Book>();
	private static BookRepository instance = new BookRepository();
	
	public static BookRepository getInstance() {
		return instance;
	}
	
	public BookRepository() {
		
		
		
		
	
	}
	
	public ArrayList<Book>getAllBooks(){
		return listOfBooks;
	}
	
	
	
	public void addBook(Book book) {
		listOfBooks.add(book);
	}
	
}
