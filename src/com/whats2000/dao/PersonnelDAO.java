package com.whats2000.dao;

import java.sql.*;
import com.whats2000.model.Personnel;

public class PersonnelDAO extends BaseDAO {
    public PersonnelDAO(String jdbcURL, String jdbcUsername, String jdbcPassword) {
        super(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public Personnel readPersonnelInformation(String personnelNumber) throws SQLException {
        Personnel personnel = null;
        String sql = "SELECT * FROM personnel WHERE personnelNumber = ?";

        connect();
        try (PreparedStatement statement = jdbcConnection.prepareStatement(sql)) {
            statement.setString(1, personnelNumber);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String personnelPassword = resultSet.getString("personnelPassword");
                personnel = new Personnel(personnelNumber, personnelPassword);
            }

            resultSet.close();
            statement.close();
            disconnect();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
        return personnel;
    }
}
