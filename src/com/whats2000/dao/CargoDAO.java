package com.whats2000.dao;

import com.whats2000.model.Cargo;
import com.whats2000.model.Content;
import com.whats2000.model.Address;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CargoDAO extends BaseDAO {
    public CargoDAO(String jdbcURL, String jdbcUsername, String jdbcPassword) {
        super(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public List<Cargo> listAllCargos() throws SQLException {
        List<Cargo> listCargo = new ArrayList<>();

        String sql = "SELECT * FROM cargo";

        connect();

        try (Statement statement = jdbcConnection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {

            while (resultSet.next()) {
                int cargoID = resultSet.getInt("cargoID");
                String number = resultSet.getString("cargoNumber");
                Date estimatedDeliveryDate = resultSet.getDate("estimatedDeliveryDate");
                String limit = resultSet.getString("limit");

                int originAddressId = resultSet.getInt("origin");
                int destinationAddressId = resultSet.getInt("destination");

                // 使用 AddressDAO 獲取地址信息
                AddressDAO addressDao = new AddressDAO(jdbcURL, jdbcUsername, jdbcPassword);
                Address originAddress = addressDao.getAddressByID(originAddressId);
                Address destinationAddress = addressDao.getAddressByID(destinationAddressId);

                Date shippingDate = resultSet.getDate("shippingDate");

                // 使用 ContentDAO 獲取貨物內容列表
                ContentDAO contentDao = new ContentDAO(jdbcURL, jdbcUsername, jdbcPassword);
                List<Content> contentList = contentDao.listContentsByCargoID(cargoID);

                // 創建 Cargo 對象
                Cargo cargo = new Cargo(number, contentList, estimatedDeliveryDate, limit, shippingDate, originAddress, destinationAddress);
                listCargo.add(cargo);
            }

            resultSet.close();
            statement.close();

            return listCargo;
        } finally {
            disconnect();
        }
    }
    // 其他 CRUD 操作的方法...
}
