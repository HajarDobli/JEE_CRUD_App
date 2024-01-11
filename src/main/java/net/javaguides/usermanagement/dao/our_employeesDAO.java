package net.javaguides.usermanagement.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import net.javaguides.usermanagement.model.our_employees;

public class our_employeesDAO {

    private String jdbcURL = "jdbc:mysql://localhost:3306/employee?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "";

    private static final String INSERT_EMPLOYEE_SQL = "INSERT INTO employees" +
            "  (first_name, last_name, date_of_birth, gender, address, contact_number, email,job_title, department, date_of_joining, salary, status) VALUES " +
            " (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

    private static final String SELECT_EMPLOYEE_BY_ID = "SELECT * FROM employees WHERE employee_id = ?";
    private static final String SELECT_ALL_EMPLOYEES = "SELECT * FROM employees";
    private static final String DELETE_EMPLOYEE_SQL = "DELETE FROM employees WHERE employee_id = ?";
    private static final String UPDATE_EMPLOYEE_SQL = "UPDATE employees SET first_name = ?, last_name = ?, date_of_birth = ?, gender = ?, address = ?, contact_number = ?, email = ?, job_title = ?, department = ?,date_of_joining = ?, salary = ?, status = ? WHERE employee_id = ?;";

    public our_employeesDAO() {
    }

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, "root","");
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void insertEmployee(our_employees employee) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_EMPLOYEE_SQL)) {
            preparedStatement.setString(1, employee.getFirstName());
            preparedStatement.setString(2, employee.getLastName());
            preparedStatement.setDate(3, new java.sql.Date(employee.getDateOfBirth().getTime()));
            preparedStatement.setString(4, employee.getGender());
            preparedStatement.setString(5, employee.getAddress());
            preparedStatement.setString(6, employee.getContactNumber());
            preparedStatement.setString(7, employee.getEmail());
            preparedStatement.setString(8, employee.getJobTitle());
            preparedStatement.setString(9, employee.getDepartment());
            preparedStatement.setDate(10, new java.sql.Date(employee.getDateOfJoining().getTime()));
            preparedStatement.setDouble(11, employee.getSalary());
            preparedStatement.setString(12, employee.getStatus());

            preparedStatement.executeUpdate();
        }
    }

    public our_employees selectEmployee(int id) {
        our_employees employee = null;
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_EMPLOYEE_BY_ID)) {

            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int employeeId = rs.getInt("employee_id");
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                Date dateOfBirth = rs.getDate("date_of_birth");
                String gender = rs.getString("gender");
                String address = rs.getString("address");
                String contactNumber = rs.getString("contact_number");
                String email = rs.getString("email");
                String jobTitle = rs.getString("job_title");
                String department = rs.getString("department");
                Date dateOfJoining = rs.getDate("date_of_joining");
                double salary = rs.getDouble("salary");
                String status = rs.getString("status");

                employee = new our_employees(employeeId, firstName, lastName, dateOfBirth, gender, address, contactNumber,
                        email, jobTitle, department, dateOfJoining, salary, status);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employee;
    }

    public List<our_employees> selectAllEmployees() {
        List<our_employees> employees = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EMPLOYEES)) {

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("employee_id");
                String firstName = rs.getString("first_name");
                String lastName = rs.getString("last_name");
                Date dateOfBirth = rs.getDate("date_of_birth");
                String gender = rs.getString("gender");
                String address = rs.getString("address");
                String contactNumber = rs.getString("contact_number");
                String email = rs.getString("email");
                String jobTitle = rs.getString("job_title");
                String department = rs.getString("department");
                Date dateOfJoining = rs.getDate("date_of_joining");
                double salary = rs.getDouble("salary");
                String status = rs.getString("status");

                our_employees employee = new our_employees(id, firstName, lastName, dateOfBirth, gender, address, contactNumber,
                        email, jobTitle, department, dateOfJoining, salary, status);

                employees.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employees;
    }


    public boolean deleteEmployee(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_EMPLOYEE_SQL)) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    public boolean updateEmployee(our_employees employee) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_EMPLOYEE_SQL)) {
            statement.setString(1, employee.getFirstName());
            statement.setString(2, employee.getLastName());
            statement.setDate(3, new java.sql.Date(employee.getDateOfBirth().getTime()));
            statement.setString(4, employee.getGender());
            statement.setString(5, employee.getAddress());
            statement.setString(6, employee.getContactNumber());
            statement.setString(7, employee.getEmail());
            statement.setString(8, employee.getJobTitle());
            statement.setString(9, employee.getDepartment());
            statement.setDate(10, new java.sql.Date(employee.getDateOfJoining().getTime()));
            statement.setDouble(11, employee.getSalary());
            statement.setString(12, employee.getStatus());
            statement.setInt(13, employee.getEmployeeId());

            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }
}
