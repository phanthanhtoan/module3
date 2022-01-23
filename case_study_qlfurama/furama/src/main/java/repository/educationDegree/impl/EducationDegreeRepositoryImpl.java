package repository.educationDegree.impl;

import model.EducationDegree;
import repository.BaseRepository;
import repository.educationDegree.IEducationDegreeRepository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EducationDegreeRepositoryImpl implements IEducationDegreeRepository {

    private BaseRepository baseRepository = new BaseRepository();

    private static final String SELECT_ALL_EDUCATION_DEGREE_TYPE = "select * from education_degree;";
    @Override
    public List<EducationDegree> findAll() {
        List<EducationDegree> educationDegrees = new ArrayList<>();
        Connection connection = this.baseRepository.getConnection();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_EDUCATION_DEGREE_TYPE);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()){
                int education_degree_id = resultSet.getInt("education_degree_id");
                String education_degree_name = resultSet.getString("education_degree_name");
                educationDegrees.add(new EducationDegree(education_degree_id, education_degree_name));
            }
            preparedStatement.close();

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return educationDegrees;
    }
}
