package servlet;

import lombok.SneakyThrows;
import manager.AuthorManager;
import manager.BookManager;
import model.Author;
import model.Book;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = "/books/add")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 10,
        maxRequestSize = 1024 * 1024 * 100
)
public class AddBookServlet extends HttpServlet {

    private final BookManager bookManager = new BookManager();

    private final AuthorManager authorManager = new AuthorManager();

    private static final String IMAGE_PATH_BOOK = "C:\\Users\\user\\IdeaProjects\\myLibrary\\myBookImages\\";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Author> authors = authorManager.getAll();
        req.setAttribute("authors",authors);
        req.getRequestDispatcher("/WEB-INF/addBook.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String title = req.getParameter("title");
        String description = req.getParameter("description");
        double price = Double.parseDouble(req.getParameter("price"));
        int id = Integer.parseInt(req.getParameter("authorId"));

        Part profilePicPart = req.getPart("image");

        String fileName = null;

        if (profilePicPart != null) {
            long nanoTime = System.nanoTime();
            fileName = nanoTime + "_" + profilePicPart.getSubmittedFileName();
            profilePicPart.write(IMAGE_PATH_BOOK + fileName);
        }

        Book books = Book.builder()
                .title(title)
                .description(description)
                .price(price)
                .author(authorManager.getById(id))
                .profilePicBook(fileName)
                .build();

        bookManager.add(books);
        resp.sendRedirect("/books");
    }
}
