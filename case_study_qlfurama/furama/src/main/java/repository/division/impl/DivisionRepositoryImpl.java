package repository.division.impl;

import model.Division;
import repository.BaseRepository;
import repository.division.IDivisionRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DivisionRepositoryImpl implements IDivisionRepository {

    private BaseRepository baseRepository = new BaseRepository();

    private static final String SELECT_ALL_DIVISION_TYPE = "select * from division;";

    @Override
    public List<Division> findAll() {
        List<Division> divisions = new ArrayList<>();
        Connection connection = this.baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_DIVISION_TYPE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int division_id = resultSet.getInt("division_id");
                String division_name = resultSet.getString("division_name");
                divisions.add(new Division(division_id,division_name));
            }
            preparedStatement.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return divisions;
    }
}
