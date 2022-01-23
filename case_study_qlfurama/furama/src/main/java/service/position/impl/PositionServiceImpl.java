package service.position.impl;

import model.Position;
import repository.position.IPositionRepository;
import repository.position.impl.PositionRepositoryImpl;
import service.position.IPositionService;

import java.util.List;

public class PositionServiceImpl  implements IPositionService {
    private IPositionRepository positionRepository = new PositionRepositoryImpl();
    @Override
    public List<Position> findAll() {
        return positionRepository.findAll();
    }
}
