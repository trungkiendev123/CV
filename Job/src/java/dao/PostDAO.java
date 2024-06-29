/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import models.Post;

/**
 *
 * @author SHD
 */
public class PostDAO extends DBContext{

    public int getTotalPostsCount(Integer locationID, Integer typeJobID, Integer levelID) {
        int count = 0;
        StringBuilder sql = new StringBuilder("SELECT COUNT(*) FROM Post WHERE status = 1");

        if (locationID != null) {
            sql.append(" AND LocationID = ?");
        }
        if (typeJobID != null) {
            sql.append(" AND TypeJobID = ?");
        }
        if (levelID != null) {
            sql.append(" AND LevelID = ?");
        }

        try (
             PreparedStatement statement = connection.prepareStatement(sql.toString())) {

            int parameterIndex = 1;
            if (locationID != null) {
                statement.setInt(parameterIndex++, locationID);
            }
            if (typeJobID != null) {
                statement.setInt(parameterIndex++, typeJobID);
            }
            if (levelID != null) {
                statement.setInt(parameterIndex++, levelID);
            }

            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                count = resultSet.getInt(1);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return count;
    }

    public List<Post> getFilteredPosts(Integer locationID, Integer typeJobID, Integer levelID, int offset, int pageSize) {
        List<Post> posts = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM Post WHERE Status = 1");

        if (locationID != null) {
            sql.append(" AND LocationID = ?");
        }
        if (typeJobID != null) {
            sql.append(" AND TypeJobID = ?");
        }
        if (levelID != null) {
            sql.append(" AND LevelID = ?");
        }

        sql.append(" ORDER BY PostDate DESC OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");

        try (
             PreparedStatement statement = connection.prepareStatement(sql.toString())) {

            int parameterIndex = 1;
            if (locationID != null) {
                statement.setInt(parameterIndex++, locationID);
            }
            if (typeJobID != null) {
                statement.setInt(parameterIndex++, typeJobID);
            }
            if (levelID != null) {
                statement.setInt(parameterIndex++, levelID);
            }
            statement.setInt(parameterIndex++, offset);
            statement.setInt(parameterIndex++, pageSize);

            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Post post = new Post();
                post.setPostID(resultSet.getInt("PostID"));
                post.setTitle(resultSet.getString("Title"));
                post.setCompanyName(resultSet.getString("CompanyName"));
                post.setAddress(resultSet.getString("Address"));
                post.setPostDate(resultSet.getDate("PostDate"));
                post.setDescription(resultSet.getString("Description"));
                post.setBenefit(resultSet.getString("Benefit"));
                post.setStatus(resultSet.getInt("Status"));
                post.setLocationID(resultSet.getInt("LocationID"));
                post.setLevelID(resultSet.getInt("LevelID"));
                post.setTypeJobID(resultSet.getInt("TypeJobID"));
                post.setAccountID(resultSet.getInt("AccountID"));
                post.setPrice(resultSet.getInt("Price"));
                posts.add(post);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return posts;
    }
    public static void main(String[] args) {
        System.out.println(new PostDAO().getFilteredPosts(null, null, null,2,3).size());
    }
}
