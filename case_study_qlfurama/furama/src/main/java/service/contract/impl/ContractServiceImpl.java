package service.contract.impl;

import model.Contract;
import repository.contract.IContractRepository;
import repository.contract.impl.ContractRepositoryImpl;
import service.contract.IContractService;

import java.util.List;

public class ContractServiceImpl implements IContractService {
    private IContractRepository contractRepository = new ContractRepositoryImpl();
    @Override
    public List<Contract> findAll() {
        return contractRepository.findAll();
    }

    @Override
    public Contract findById(int contract_id) {
        return contractRepository.findById(contract_id);
    }
}
