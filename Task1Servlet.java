package servlets;

import db.DBManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet(value = "/task1")
public class Task1Servlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Items> itemList = DBManager.getAllItems();
        for (int i=0; i < itemList.size(); i++) {
            System.out.println(itemList.get(i).getName());
        }
        req.setAttribute("tovar", itemList);
        req.getRequestDispatcher("main.jsp").forward(req, resp);
    }
}
