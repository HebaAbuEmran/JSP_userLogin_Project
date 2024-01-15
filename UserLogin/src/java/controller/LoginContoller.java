/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dao.DaoImp;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;
import service.Validation;

/**
 *
 * @author habuomran
 */
public class LoginContoller extends HttpServlet {

    Validation v;
    DaoImp dao;

    public LoginContoller() {
        v = new Validation();
        dao = new DaoImp();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        resp.setContentType("text/html;charset=UTF-8");

        String action = req.getParameter("action");
        switch (action) {
            case "login":
                loginForm(req, resp);
                break;
            case "addUserButton":
                addUserButton(req, resp);
                break;
            case "addUser":
                addUser(req, resp);
                break;
            case "updateUserButton":
                updateUserButton(req, resp);
                break;
            case "updateUser":
                updateUser(req, resp);
                break;
            case "delete":
                deleteForm(req, resp);
                break;
            default:
                loginForm(req, resp);

        }
    }

    private void loginForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userName = req.getParameter("userName");
        String pass = req.getParameter("pass");
        PrintWriter out = resp.getWriter();
        RequestDispatcher dispatcher = null;

        if (v.authenticate(pass, userName)) {
            String s = v.authorizate(userName);

            if (s.equals("admin")) {
                listForm(req, resp);

            } else {
                User u = dao.getclinet(userName);
                req.setAttribute("theClient", u);

                dispatcher = req.getRequestDispatcher("/veiw/client.jsp");
                dispatcher.forward(req, resp);

            }
        } else {
            out.println("incorrect userName or password");
            dispatcher = req.getRequestDispatcher("/veiw/login.jsp");
            dispatcher.forward(req, resp);
        }

    }

    private void addUserButton(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setAttribute("user", null);

        RequestDispatcher dispatcher = null;
        dispatcher = req.getRequestDispatcher("/veiw/addUpdate.jsp");
        dispatcher.forward(req, resp);
    }

    private void addUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        String userName = req.getParameter("userName");
        String passWord = req.getParameter("password");
        String name = req.getParameter("name");
        int age = Integer.parseInt(req.getParameter("age"));
        String skill = req.getParameter("skill");
        String address = req.getParameter("address");
        String role = req.getParameter("role");

        User u = new User(id, name, age, skill, address, userName, passWord, role);
        dao.insert(u);
        listForm(req, resp);

    }

    private void updateUserButton(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        User u = dao.getclinet(id);
        req.setAttribute("user", u);

        RequestDispatcher dispatcher = null;
        dispatcher = req.getRequestDispatcher("/veiw/addUpdate.jsp");
        dispatcher.forward(req, resp);

    }

    private void updateUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        int age = Integer.parseInt(req.getParameter("age").trim());
        String userName = req.getParameter("userName");
        String password = req.getParameter("password");
        String name = req.getParameter("name");
        String skill = req.getParameter("skill");
        String address = req.getParameter("address");
        String role = req.getParameter("role");

        User u = new User(id, name, age, skill, address, userName, password, role);

        dao.update(u);
        listForm(req, resp);
    }

    private void deleteForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        int id = Integer.parseInt(req.getParameter("id"));
        if (dao.delete(id)) {
            req.setAttribute("notfication", "Employee Deleted Successfully!");
        }
        listForm(req, resp);

    }

    public void listForm(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        RequestDispatcher dispatcher = null;

        List<User> u = dao.getAll();
        req.setAttribute("Users", u);

        dispatcher = req.getRequestDispatcher("/veiw/admin.jsp");
        dispatcher.forward(req, resp);

    }
}
