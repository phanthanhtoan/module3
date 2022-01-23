package repository.contract.impl;

import model.Contract;
import repository.BaseRepository;
import repository.contract.IContractRepository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ContractRepositoryImpl implements IContractRepository {

    private BaseRepository baseRepository = new BaseRepository();
    private static final  String  SELECT_ALL_CONTRACT = "select * from contract;";

    private static final String SELECT_CONTRACT_BY_ID_SQL = "select * from contract where contract.contract_id=?;";
    @Override
    public List<Contract> findAll() {
        List<Contract> contractList = new ArrayList<>();
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection()
                    .prepareStatement(SELECT_ALL_CONTRACT);
            ResultSet resultSet = preparedStatement.executeQuery();
            Contract contract;
            while (resultSet.next()){
                contract = new Contract();
                contract.setContract_id(resultSet.getInt("contract_id"));
                contract.setContract_start_date(resultSet.getString("contract_start_date"));
                contract.setContract_end_date(resultSet.getString("contract_end_date"));
                contract.setContract_deposit(resultSet.getDouble("contract_deposit"));
                contract.setContract_total_money(resultSet.getDouble("contract_total_money"));
                contract.setEmployee_id(resultSet.getInt("employee_id"));
                contract.setCustomer_id(resultSet.getInt("customer_id"));
                contract.setService_id(resultSet.getInt("service_id"));
                contractList.add(contract);

            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return contractList;
    }

    @Override
    public Contract findById(int contract_id) {
        try {
            PreparedStatement preparedStatement = this.baseRepository.getConnection()
                    .prepareStatement(SELECT_CONTRACT_BY_ID_SQL);
            preparedStatement.setString(1, String.valueOf(contract_id));
            ResultSet resultSet = preparedStatement.executeQuery();
            Contract contract = null;
            while (resultSet.next()){
                contract = new Contract();
                contract.setContract_id(resultSet.getInt("contract_id"));
                contract.setContract_start_date(String.valueOf(resultSet.getDate("contract_start_date")));
                contract.setContract_end_date(String.valueOf(resultSet.getDate("contract_end_date")));
                contract.setContract_deposit(resultSet.getDouble("contract_deposit"));
                contract.setContract_total_money(resultSet.getDouble("contract_total_money"));
                contract.setEmployee_id(resultSet.getInt("employee_id"));
                contract.setCustomer_id(resultSet.getInt("customer_id"));
                contract.setService_id(resultSet.getInt("service_id"));
                break;
            }
            return contract;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
