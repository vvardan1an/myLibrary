package manager;

import database.DBConnectionProvider;
import model.Author;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

public class AuthorManager {

    private final Connection connection = DBConnectionProvider.getInstance().getConnection();

    public void add(Author author) {
        String sql = "insert into author(name,surname,email,age) VALUES (?,?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1,author.getName());
            ps.setString(2, author.getSurname());
            ps.setString(3,author.getEmail());
            ps.setInt(4, author.getAge());
            ps.executeUpdate();
            ResultSet resultSet = ps.getGeneratedKeys();
            if (resultSet.next()) {
                int id = resultSet.getInt(1);
                author.setId(id);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public List<Author> getAll() {
        String sql = "select * from author";
        List<Author> authors = new ArrayList<>();
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            while (resultSet.next()) {
                authors.add(getAuthorFromResultSet(resultSet));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return authors;
    }

    public Author getById(int id) {
        String sql = "select * from author where id = " + id;
        try {
            Statement statement = connection.createStatement();
            ResultSet resultSet = statement.executeQuery(sql);

            if (resultSet.next()) {
                return getAuthorFromResultSet(resultSet);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    private Author getAuthorFromResultSet(ResultSet resultSet) throws SQLException{

        return Author.builder()
                .id(resultSet.getInt("id"))
                .name(resultSet.getString("name"))
                .surname(resultSet.getString("surname"))
                .email(resultSet.getString("email"))
                .age(resultSet.getInt("age"))
                .build();
    }
}

