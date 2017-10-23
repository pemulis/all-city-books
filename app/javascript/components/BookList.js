import React from 'react';

export default class BookList extends React.Component {
  /*
  componentDidMount() {
    window.fetch('api/books')
      .then(response => response.json())
      .then(json => console.log(json))
      .catch(error => console.log(error))
  }
  render() {
    return (
        <div className="App">
          <div className="App-header">
            <h2>Welcome to React</h2>
          </div>
          <p className="App-intro">
            To get started, edit <code>src/BookList.js</code> and save to reload.
          </p>
        </div>
      );
    }
  }
  */
  constructor() {
    super()
    this.state = {}
    this.getBooks = this.getBooks.bind(this)
    this.getBook = this.getBook.bind(this)
  }
  componentDidMount() {
    this.getBooks()
  }
  fetch (endpoint) {
    return new Promise((resolve, reject) => {
      window.fetch(endpoint)
      .then(response => response.json())
      .then(json => resolve(json))
      .catch(error => reject(error))
    });
  }
  getBooks () {
    this.fetch('api/books')
      .then(books => {
        this.setState({books: books})
        this.getBook(books[0].id)
      });
  }
  getBook (id) {
    this.fetch(`api/books/${id}`)
      .then(book => this.setState({book: book}));
      window.scrollTo(0,0);
  }
  render() {
    let {books, book} = this.state
    return books

    ? <div>
        <h1>All City Books</h1>
        <aside>Click the title of a book in the list below to see its price and description.</aside>
        {book &&
        <div id='current-book'>
          <h2>{book.itemname}</h2>
          {book.price = book.price.toLocaleString('en-US', { style: 'currency'}) && <p>Price: ${book.price}</p>}
          {book.binding && <p>Binding: {book.binding}</p>}
          {<p>Quantity: {book.quantity}</p>}
          {book.itemnote && <p>Item Note: {book.itemnote}</p>}
          {book.asin1 && <p>ASIN/ISBN: {book.asin1}</p>}
        </div>
        }
        <ul>
          {Object.keys(books).map((key) => {
            if (books[key].quantity > 0) {
              return <li active={book && book.id === books[key].id} key={key} onClick={() => this.getBook(books[key].id) }>
                <a>{books[key].itemname}</a>
              </li>
            } else {
              return <li active={book && book.id === books[key].id} key={key} onClick={() => this.getBook(books[key].id) }>
                <a class='out-of-stock'>{books[key].itemname}</a>
              </li>
            }
          })}
        </ul>
      </div>
    : <div> 
        <p>Loading...</p>
      </div>
  }
}
