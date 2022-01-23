package repository.contract;

import model.Contract;

import java.util.List;

public interface IContractRepository {
    List<Contract> findAll();
    Contract findById(int contract_id);
}
