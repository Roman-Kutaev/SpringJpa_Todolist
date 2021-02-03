package org.itstep.controller.domain.dao.impl;

import org.hibernate.Hibernate;
import org.itstep.controller.domain.dao.TaskDao;
import org.itstep.controller.domain.entity.Task;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Transactional
@Repository
public class TaskDaoImpl implements TaskDao {

    @PersistenceContext
    private EntityManager entityManager;


    @Override
    public void save(Task data) {
        entityManager.persist(data);
    }

    @Override
    public Task findById(Integer id) {
        return entityManager.find(Task.class, id);
    }

    @Override
    public List<Task> findAll() {
        return entityManager.createQuery("from Task", Task.class).getResultList();
    }

    @Override
    public void delete(Task task) {
        if (Hibernate.isInitialized(task)){
            task = entityManager.merge(task);
        }
        entityManager.remove(task);
    }

    @Override
    public Task update(Task task) {
        return entityManager.merge(task);
    }
}
