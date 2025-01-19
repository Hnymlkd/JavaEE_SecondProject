package db;

import servlets.Items;
import servlets.Users;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DBManager {
    private static Connection connection;

    static {
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
        try {
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/university",
                    "postgres", "123");
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
/*
    public static List<Item> getItems() {
        List<Item> itemList = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM university.public.items");
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Item item = new Item();
                item.setId(resultSet.getLong("id"));
                item.setName(resultSet.getString("name"));
                item.setDescription(resultSet.getString("description"));
                item.setDeadlineDate(resultSet.getString("deadlineDate"));

                itemList.add(item);
            }
            resultSet.close();
            return itemList;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static boolean addItem(Item item) {
        int row = 0;
        try {
            PreparedStatement statement = connection.prepareStatement("INSERT INTO university.public.items" +
                    "(name, description, deadlinedate) VALUES (?, ?, ?);");
            statement.setString(1, item.getName());
            statement.setString(2, item.getDescription());
            statement.setString(3, item.getDeadlineDate());

            row = statement.executeUpdate();
            if(row>0){
                return true;
            } else{
                return false;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static Item getItembyId(Long id){
        Item item = new Item();
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM university.public.items " +
                    "WHERE id = ?;");
            statement.setLong(1, id);
            ResultSet resultSet = statement.executeQuery();
            if(resultSet.next()){
                item.setId(resultSet.getLong("id"));
                item.setName(resultSet.getString("name"));
                item.setDescription(resultSet.getString("description"));
                item.setDeadlineDate(resultSet.getString("deadlineDate"));
            }
            return item;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static boolean saveItem(Item item) {
        int row = 0;
        try {
            PreparedStatement statement = connection.prepareStatement("UPDATE university.public.items SET " +
                    "name = ?, description = ?, deadlineDate = ? WHERE id = ?;");
            statement.setString(1, item.getName());
            statement.setString(2, item.getDescription());
            statement.setString(3, item.getDeadlineDate());
            statement.setLong(4, item.getId());

            row = statement.executeUpdate();
            if(row>0){
                return true;
            } else{
                return false;
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void deleteItem(Long id){
        try {
            PreparedStatement statement = connection.prepareStatement("DELETE FROM university.public.items WHERE id=?");
            statement.setLong(1, id);
            statement.execute();
            statement.close();
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

    }

*/

    public static List<Items> getAllItems() {
        List<Items> itemList = new ArrayList<>();
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM university.public.item");
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                Items items = new Items();
                items.setId(resultSet.getLong("id"));
                items.setName(resultSet.getString("name"));
                items.setDescription(resultSet.getString("description"));
                items.setPrice(resultSet.getDouble("price"));

                itemList.add(items);
            }
            resultSet.close();
            return itemList;
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static Users checkUserInDatabase(String email, String password) {
        Users user = null;
        try {
            PreparedStatement statement = connection.prepareStatement("SELECT * FROM university.public.users WHERE email = ? AND password = ?");
            statement.setString(1, email);
            statement.setString(2, password);

            ResultSet resultSet = statement.executeQuery();
            if (resultSet.next()) {
                user = new Users();
                user.setId(resultSet.getLong("id"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setFullName(resultSet.getString("full_name"));
            } else {
                System.out.println("No user found with the provided email and password");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return user;
    }
}

