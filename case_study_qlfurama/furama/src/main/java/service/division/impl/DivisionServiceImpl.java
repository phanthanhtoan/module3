package service.division.impl;

import model.Division;
import repository.division.IDivisionRepository;
import repository.division.impl.DivisionRepositoryImpl;
import service.division.IDivisionService;

import java.util.List;

public class DivisionServiceImpl implements IDivisionService {
    private IDivisionRepository divisionRepository = new DivisionRepositoryImpl();
    @Override
    public List<Division> findAll() {
        return divisionRepository.findAll();
    }
}
