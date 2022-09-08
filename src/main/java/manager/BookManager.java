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
        String sql = "insert into book(title,description,price,author_id,profile_pic_book) VALUES (?,?,?,?,?)";
        try {

            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, book.getTitle());
            ps.setString(2, book.getDescription());
            ps.setDouble(3, book.getPrice());
            ps.setInt(4, book.getAuthor().getId());
            ps.setString(5,book.getProfilePicBook());

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

    public void removeBook(int id) {
        String sql = "delete from book where id =" + id;
        try {
            Statement statement = connection.createStatement();
            statement.executeUpdate(sql);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private Book getBookFromResultSet(ResultSet resultSet) throws SQLException {
        Book book = new Book();
        book.setId(resultSet.getInt("id"));
        book.setTitle(resultSet.getString("title"));
        book.setDescription(resultSet.getString("description"));
        book.setPrice(resultSet.getDouble("price"));
        int author = resultSet.getInt("author_id");
        Author author1 = authorManager.getById(author);
        book.setProfilePicBook(resultSet.getString("profile_pic_book"));
        book.setAuthor(author1);

        return book;
    }

    public void edit(Book books) {
        String sql = "update book set title = ?,description = ?,price = ?,author_id = ?,profile_pic_book = ? where id = ?";
        try {

            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, books.getTitle());
            ps.setString(2, books.getDescription());
            ps.setDouble(3, books.getPrice());
            ps.setInt(4, books.getAuthor().getId());
            ps.setInt(5,books.getId());
            ps.setString(6, books.getProfilePicBook());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
