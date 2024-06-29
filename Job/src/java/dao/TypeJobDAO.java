/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import models.TypeJob;
/**
 *
 * @author SHD
 */
public class TypeJobDAO extends DBContext{
    public List<TypeJob> getAllTypeJobs() {
        List<TypeJob> typeJobs = new ArrayList<>();
        String sql = "SELECT * FROM TypeJob";

        try (
             PreparedStatement statement = connection.prepareStatement(sql)) {

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                TypeJob typeJob = new TypeJob();
                typeJob.setTypeJobID(resultSet.getInt("TypeJobID"));
                typeJob.setName(resultSet.getString("Name"));
                typeJobs.add(typeJob);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return typeJobs;
    }
}
