package service.educationDegree.impl;

import model.EducationDegree;
import repository.educationDegree.IEducationDegreeRepository;
import repository.educationDegree.impl.EducationDegreeRepositoryImpl;
import service.educationDegree.IEducationDegreeService;

import java.util.List;

public class EducationDegreeServiceImpl implements IEducationDegreeService {
    private IEducationDegreeRepository educationDegreeRepository = new EducationDegreeRepositoryImpl();
    @Override
    public List<EducationDegree> findAll() {
        return educationDegreeRepository.findAll();
    }
}
