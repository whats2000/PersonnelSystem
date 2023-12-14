package com.whats2000.dao;

import com.whats2000.model.Content;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ContentDAO extends BaseDAO {
    public ContentDAO(String jdbcURL, String jdbcUsername, String jdbcPassword) {
        super(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public List<Content> listContentsByCargoID(int cargoID) throws SQLException {
        List<Content> listContent = new ArrayList<>();
        String sql = "SELECT * FROM content WHERE cargoID = ?";

        connect();

        try (PreparedStatement statement = jdbcConnection.prepareStatement(sql)) {
            statement.setInt(1, cargoID);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                String cargoName = resultSet.getString("cargoName");
                int quantity = resultSet.getInt("quantity");

                Content content = new Content(cargoName, quantity);
                listContent.add(content);
            }

            resultSet.close();
            statement.close();

            return listContent;
        } finally {
            disconnect();
        }
    }
}
