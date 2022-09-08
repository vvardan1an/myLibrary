package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;


@WebServlet(urlPatterns = "/getImageBook")
public class GetImageBookServlet extends HttpServlet {

    private static final String IMAGE_PATH_BOOK = "C:\\Users\\user\\IdeaProjects\\myLibrary\\myBookImages\\";


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        imageControl(req, resp, IMAGE_PATH_BOOK);

    }

    static void imageControl(HttpServletRequest req, HttpServletResponse resp, String imagePathBook) {
        String profilePicBook = req.getParameter("image");

        String filePath = imagePathBook + profilePicBook;
        File imageFile = new File(filePath);

        if(imageFile.exists()){
            try(FileInputStream inStream = new FileInputStream(imageFile)){
                resp.setContentType("image/jpeg");
                resp.setContentLength((int) imageFile.length());

                OutputStream outStream = resp.getOutputStream();

                byte[] buffer = new byte[4096];
                int bytesRead;
                while ((bytesRead = inStream.read(buffer)) != -1){
                    outStream.write(buffer,0,bytesRead);
                }
            }catch (IOException e){
                e.printStackTrace();
            }
        }
    }

}
