package me.jclazz.liquibasedemo.repository;


import me.jclazz.liquibasedemo.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User,String> {

    User findUserByLoginName(String loginName);
}
