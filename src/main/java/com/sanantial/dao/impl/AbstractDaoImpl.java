package com.sanantial.dao.impl;


import com.sanantial.dao.AbstractDao;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.springframework.beans.factory.annotation.Autowired;

import java.io.Serializable;
import java.util.List;

public abstract class AbstractDaoImpl<E, I extends Serializable> implements AbstractDao<E,I> {

    private Class<E> entityClass;

    protected AbstractDaoImpl(Class<E> entityClass) {
        this.entityClass = entityClass;
    }

    @Autowired
    private SessionFactory sessionFactory;

    public Session getCurrentSession() {
        return sessionFactory.getCurrentSession();
    }

    @Override
    public E findById(Integer id) {
        return (E) getCurrentSession().get(entityClass, id);
    }

    @Override
    public void saveOrUpdate(E e) {
        getCurrentSession().saveOrUpdate(e);
    }

    @Override
    public void delete(E e) {
        getCurrentSession().delete(e);
    }

    @Override
    public List<E> findByCriteria(Criterion criterion) {
        Criteria criteria = getCurrentSession().createCriteria(entityClass);
        //criteria.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);//TODO only for work arround on historial citas change tratamientos to LAZY
        criteria.add(criterion);
        return criteria.list();
    }
    
    @Override
    public List<E> findAll(){
    	Criteria criteria = getCurrentSession().createCriteria(entityClass)//;
    			.setResultTransformer(Criteria.DISTINCT_ROOT_ENTITY);
		return criteria.list();
    	
    }
}
