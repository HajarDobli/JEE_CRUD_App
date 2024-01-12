package net.javaguides.usermanagement.web;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.javaguides.usermanagement.dao.our_employeesDAO;
import net.javaguides.usermanagement.model.our_employees;

@WebServlet("/")

public class our_employeesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private our_employeesDAO employeeDAO;

    public void init() {
        employeeDAO = new our_employeesDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        this.doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();

        try {
            switch (action) {
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insert":
                    insertEmployee(request, response);
                    break;
                case "/delete":
                    deleteEmployee(request, response);
                    break;
                case "/edit":
                    showEditForm(request, response);
                    break;
                case "/update":
                    updateEmployee(request, response);
                    break;
                default:
                    listEmployees(request, response);
                    break;
            }
        } catch (SQLException | ParseException ex) {
            throw new ServletException(ex);
        }
    }

    private void listEmployees(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        List<our_employees> listEmployees = employeeDAO.selectAllEmployees();
        request.setAttribute("listEmployees", listEmployees);
        RequestDispatcher dispatcher = request.getRequestDispatcher("our_employees-list.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher dispatcher = request.getRequestDispatcher("our_employees-form.jsp");
        dispatcher.forward(request, response);
    }

    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        our_employees existingEmployee = employeeDAO.selectEmployee(id);
        RequestDispatcher dispatcher = request.getRequestDispatcher("our_employees-form.jsp");
        request.setAttribute("employee", existingEmployee);
        dispatcher.forward(request, response);
    }

    private void insertEmployee(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ParseException {
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        // Parse date parameter
        String dobString = request.getParameter("dateOfBirth");
        Date dateOfBirth = new SimpleDateFormat("yyyy-MM-dd").parse(dobString);
        String gender = request.getParameter("gender");
        String address = request.getParameter("address");
        String contactNumber = request.getParameter("contactNumber");
        String email = request.getParameter("email");
        String jobTitle = request.getParameter("jobTitle");
        String department = request.getParameter("department");
        // Parse date parameter
        String dojString = request.getParameter("dateOfJoining");
        Date dateOfJoining = new SimpleDateFormat("yyyy-MM-dd").parse(dojString);
        double salary = Double.parseDouble(request.getParameter("salary"));
        String status = request.getParameter("status");

        our_employees newEmployee = new our_employees(firstName, lastName, dateOfBirth, gender, address, contactNumber, email,
                jobTitle, department, dateOfJoining, salary, status);
        employeeDAO.insertEmployee(newEmployee);

        response.sendRedirect("list");
    }

    private void updateEmployee(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ParseException {
        try {
            String employeeIdString = request.getParameter("employeeId");
            if (employeeIdString != null && !employeeIdString.isEmpty()) {
                int employeeId = Integer.parseInt(employeeIdString);
                String firstName = request.getParameter("firstName");
                String lastName = request.getParameter("lastName");
                String dobString = request.getParameter("dateOfBirth");
                Date dateOfBirth = new SimpleDateFormat("yyyy-MM-dd").parse(dobString);
                String gender = request.getParameter("gender");
                String address = request.getParameter("address");
                String contactNumber = request.getParameter("contactNumber");
                String email = request.getParameter("email");
                String jobTitle = request.getParameter("jobTitle");
                String department = request.getParameter("department");
                String dojString = request.getParameter("dateOfJoining");
                Date dateOfJoining = new SimpleDateFormat("yyyy-MM-dd").parse(dojString);
                double salary = Double.parseDouble(request.getParameter("salary"));
                String status = request.getParameter("status");

                our_employees updatedEmployee = new our_employees(employeeId, firstName, lastName, dateOfBirth, gender, address, contactNumber,
                        email, jobTitle, department, dateOfJoining, salary, status);
                boolean rowUpdated = employeeDAO.updateEmployee(updatedEmployee);

                response.sendRedirect("list");
            } else {
                System.out.println("Employee ID is null or empty. Cannot update.");
            }
        } catch (NumberFormatException e) {
            e.printStackTrace();
            System.out.println("Invalid employee ID provided.");
        }
    }


    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        employeeDAO.deleteEmployee(id);
        response.sendRedirect("list");
    }
}
