/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.util.ArrayList;
import java.util.List;
import models.Level;
import java.sql.*;

/**
 *
 * @author SHD
 */
public class LevelDAO extends DBContext{
    public List<Level> getAllLevels() {
        List<Level> levels = new ArrayList<>();
        String sql = "SELECT * FROM Level";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Level level = new Level();
                level.setLevelID(resultSet.getInt("LevelID"));
                level.setName(resultSet.getString("Name"));
                levels.add(level);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return levels;
    }
}
