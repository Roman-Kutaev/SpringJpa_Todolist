package org.itstep.controller.domain.dao.impl;

import org.hibernate.Hibernate;
import org.itstep.controller.domain.dao.CategoryDao;
import org.itstep.controller.domain.entity.Category;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;
@Repository
@Transactional
public class CategoryDaoImpl implements CategoryDao {
    @PersistenceContext
    private EntityManager entityManager;

    @Override
    public void save(Category category) {
        entityManager.persist(category);
    }

    @Override
    public Category findById(Integer id) {
        Category category = entityManager.find(Category.class, id);
        if (Hibernate.isInitialized(category)){
            entityManager.merge(category);
        }
        return entityManager.find(Category.class, id);
    }

    @Override
    public List<Category> findAll() {
        return entityManager.createQuery("from Category", Category.class).getResultList();
    }

    @Override
    public void delete(Category category) {
        if (Hibernate.isInitialized(category)){
            category = entityManager.merge(category);
        }
        entityManager.remove(category);
    }

    @Override
    public Category update(Category category) {
        return entityManager.merge(category);
    }
}
