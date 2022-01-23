package repository.position.impl;

import model.Position;
import repository.BaseRepository;
import repository.position.IPositionRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PositionRepositoryImpl implements IPositionRepository {
    private BaseRepository baseRepository = new BaseRepository();

    private static final String SELECT_ALL_POSITION_TYPE = "select * from position;";
    @Override
    public List<Position> findAll() {
        List<Position> positions = new ArrayList<>();
        Connection connection = this.baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_POSITION_TYPE);
            ResultSet  resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int position_id = resultSet.getInt("position_id");
                String position_name = resultSet.getString("position_name");
                positions.add(new Position(position_id, position_name));
            }
            preparedStatement.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return positions;
    }
}
