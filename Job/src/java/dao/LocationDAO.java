/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.ArrayList;
import java.util.List;
import models.Location;
import java.sql.*;

/**
 *
 * @author SHD
 */
public class LocationDAO extends DBContext{
    public List<Location> getAllLocations() {
        List<Location> locations = new ArrayList<>();
        String sql = "SELECT * FROM Location";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Location location = new Location();
                location.setLocationID(resultSet.getInt("LocationID"));
                location.setName(resultSet.getString("Name"));
                locations.add(location);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return locations;
    }
}
