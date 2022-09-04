package manager;

import database.DBConnectionProvider;
import model.Author;
import model.Book;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class BookManager {

    private final Connection connection = DBConnectionProvider.getInstance().getConnection();
    private final AuthorManager authorManager = new AuthorManager();

    public void add(Book book) {
        String sql = "insert into book(title,description,price,author_id) VALUES (?,?,?,?)";
        try {

            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, book.getTitle());
            ps.setString(2, book.getDescription());
            ps.setDouble(3, book.getPrice());
            ps.setInt(4, book.getAuthor().getId());

            ps.executeUpdate();
            ResultSet resultSet = ps.getGeneratedKeys();
            if (resultSet.next()) {
                int id = resultSet.getInt(1);
                book.setId(id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Book> getAll() {
        String sql = "select * from book";
        List<Book> books = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                books.add(getBookFromResultSet(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return books;
    }

    public Book getById(int id) {
        String sql = "select * from book where id = " + id;
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            if (resultSet.next()) {
                return getBookFromResultSet(resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private Book getBookFromResultSet(ResultSet resultSet) throws SQLException {
        Book book = new Book();
        book.setId(resultSet.getInt("id"));
        book.setTitle(resultSet.getString("title"));
        book.setDescription(resultSet.getString("description"));
        book.setPrice(resultSet.getDouble("price"));
        int author = resultSet.getInt("author_id");
        Author author1 = authorManager.getById(author);
        book.setAuthor(author1);

        return book;
    }
}
