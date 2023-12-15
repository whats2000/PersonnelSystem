package com.whats2000.dao;

import com.whats2000.model.Cargo;
import com.whats2000.model.CargoHistory;

import java.util.List;

public class CargoHistoryDAO extends BaseDAO {
    public CargoHistoryDAO(String jdbcURL, String jdbcUsername, String jdbcPassword) {
        super(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public List<CargoHistory> getCargoHistoryByCargo(Cargo cargo) {
        return null;
    }

    public List<CargoHistory> addCargoHistory(CargoHistory cargoHistory) {
        return null;
    }
}
