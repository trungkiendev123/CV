/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.*;
import models.Account;

public class AccountDAO extends DBContext{
    public boolean registerAccount(String username, String password, int role) {
        String sql = "INSERT INTO Account (Username, Password, Role) VALUES (?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, username);
            statement.setString(2, password);
            statement.setInt(3, role);
            int rowsInserted = statement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to login an account
    public Account loginAccount(String username, String password) {
        String sql = "SELECT * FROM Account WHERE Username like ? AND Password like ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, username);
            statement.setString(2, password);
            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    Account account = new Account();
                    account.setAccountID(resultSet.getInt("AccountID"));
                    account.setUsername(resultSet.getString("Username"));
                    account.setPassword(resultSet.getString("Password"));
                    account.setRole(resultSet.getInt("Role"));
                    return account;
                } else {
                    return null;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
    }
    
    // Method to check if a username exists
    public boolean isUsernameExists(String username) {
        String sql = "SELECT * FROM Account WHERE Username like ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, username);
            try (ResultSet resultSet = statement.executeQuery()) {
                return resultSet.next();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    public static void main(String[] args) {
        System.out.println(new AccountDAO().isUsernameExists("recruiter1"));
    }
}
