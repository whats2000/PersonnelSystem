package com.whats2000.dao;

import com.whats2000.model.Address;

import java.sql.*;

public class AddressDAO extends BaseDAO {
    public AddressDAO(String jdbcURL, String jdbcUsername, String jdbcPassword) {
        super(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public Address getAddressByID(int addressID) {
        Address address = null;
        String sql = "SELECT * FROM address WHERE addressID = ?";

        try {
            connect();
            PreparedStatement statement = jdbcConnection.prepareStatement(sql);
            statement.setInt(1, addressID);

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                String city = resultSet.getString("city");
                String street = resultSet.getString("street");
                String unitNumber = resultSet.getString("unitNumber");

                address = new Address(city, street, unitNumber);
            }

            resultSet.close();
            statement.close();

            return address;
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            return null;
        } finally {
            try {
                disconnect();
            } catch (SQLException e) {
                System.out.println(e.getMessage());
            }
        }
    }

    // 其他方法...
}
