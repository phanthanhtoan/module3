package service.contract;

import model.Contract;

import java.util.List;

public interface IContractService {
    List<Contract> findAll();
    Contract findById(int contract_id);
}
